import 'package:flutter/material.dart';
import 'dart:ui';
import 'pages/rk13_intro_page.dart';
import 'pages/home_page.dart';
import 'pages/learn_python_page.dart';
import 'pages/termux_commands_page.dart';
import 'pages/bash_tools_page.dart';
import 'pages/donar_page.dart';
import 'package:flutter/scheduler.dart';
import 'package:animations/animations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RK13App());
}

class RK13App extends StatelessWidget {
  const RK13App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Enable smooth animations
    timeDilation = 1.0;
    return MaterialApp(
      title: 'RK13 Installer',
      debugShowCheckedModeBanner: false,
      theme: _buildRK13Theme(),
      home: const MainLayout(),
    );
  }
}

/// ----------------------------------------------------------------------------
/// RK13 Custom Theme
/// ----------------------------------------------------------------------------
ThemeData _buildRK13Theme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF000000),
    canvasColor: Colors.transparent,
    primaryColor: const Color(0xFFFF1744),
    cardColor: Colors.black.withOpacity(0.5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xFFFF1744)),
      titleTextStyle: TextStyle(
        color: Color(0xFFFF1744),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white, fontSize: 16, height: 1.5),
      bodyText2: TextStyle(color: Colors.white70, fontSize: 18),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFFF1744)),
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF1744),
        foregroundColor: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Color(0xFFFF1744),
      textColor: Colors.white,
      selectedColor: Color(0xFFFF1744),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}

/// ----------------------------------------------------------------------------
/// Main Layout with Animated Drawer & Bottom Navigation
/// ----------------------------------------------------------------------------
class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late final AnimationController _drawerController;

  final List<Widget> _pages = [
    const Rk13IntroPage(),
    HomePage(),
    const LearnPythonPage(),
    const TermuxCommandsPage(),
    const BashToolsPage(),
    const DonarPage(),
  ];

  final List<String> _titles = [
    'Bienvenido a RK13',
    'Repositorios',
    'Aprende Python',
    'Comandos Termux',
    'Scripts Bash Tools',
    'Donar',
  ];

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    if (_drawerController.isDismissed) {
      _drawerController.forward();
    } else {
      _drawerController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        leading: IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: _drawerController,
            color: const Color(0xFFFF1744),
          ),
          onPressed: _toggleDrawer,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Sobre esta app',
            onPressed: () => _showInfo(context),
          ),
        ],
      ),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            color: Colors.black,
            child: PageTransitionSwitcher(
              transitionBuilder: (
                Widget child,
                Animation<double> primaryAnimation,
                Animation<double> secondaryAnimation,
              ) {
                return SharedAxisTransition(
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                  child: child,
                );
              },
              child: _pages[_currentIndex],
            ),
          ),
          _buildAnimatedDrawer(),
        ],
      ),
      bottomNavigationBar: _buildAnimatedBottomNav(),
    );
  }

  /// Animated Drawer Widget
  Widget _buildAnimatedDrawer() {
    final double maxSlide = MediaQuery.of(context).size.width * 0.6;
    return AnimatedBuilder(
      animation: _drawerController,
      builder: (context, _) {
        double slide = maxSlide * _drawerController.value;
        double scale = 1 - (_drawerController.value * 0.3);
        return Transform(
          transform:
              Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
          alignment: Alignment.centerLeft,
          child: _buildDrawerContent(),
        );
      },
    );
  }

  /// Drawer Content
  Widget _buildDrawerContent() {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
      child: Drawer(
        elevation: 12,
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: SafeArea(
            child: Column(
              children: [
                _buildDrawerHeader(),
                Expanded(child: _buildDrawerList()),
                _buildDrawerFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Row(
        children: const [
          Icon(Icons.terminal, size: 48, color: Colors.white),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'RK13 Tools',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: _titles.length,
      itemBuilder: (context, index) {
        bool selected = index == _currentIndex;
        return ListTile(
          leading: Icon(
            _getIcon(index),
            color: selected ? const Color(0xFFFF1744) : Colors.white,
          ),
          title: Text(
            _titles[index],
            style: TextStyle(
              color: selected ? const Color(0xFFFF1744) : Colors.white,
            ),
          ),
          selected: selected,
          onTap: () {
            setState(() => _currentIndex = index);
            _toggleDrawer();
          },
        );
      },
    );
  }

  Widget _buildDrawerFooter() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Divider(color: Colors.white30),
          const Text(
            'developer & programmer;',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 4),
          const Text(
            'Sebastian Lara - RK13',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DonarPage()),
              );
            },
            icon: const Icon(Icons.favorite, color: Colors.greenAccent),
            label: const Text('DONAR', style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
          ),
        ],
      ),
    );
  }

  /// Animated Bottom Navigation Bar
  Widget _buildAnimatedBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_titles.length, (index) {
              bool selected = _currentIndex == index;
              return GestureDetector(
                onTap: () => setState(() => _currentIndex = index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            selected
                                ? const Color(0xFFFF1744)
                                : Colors.transparent,
                      ),
                      child: Icon(
                        _getIcon(index),
                        color: selected ? Colors.black : Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _titles[index],
                      style: TextStyle(
                        fontSize: 12,
                        color:
                            selected ? const Color(0xFFFF1744) : Colors.white70,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.info;
      case 1:
        return Icons.extension;
      case 2:
        return Icons.code;
      case 3:
        return Icons.computer;
      case 4:
        return Icons.build;
      case 5:
        return Icons.favorite;
      default:
        return Icons.device_unknown;
    }
  }

  /// About Dialog
  void _showInfo(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'RK13 Installer',
      applicationVersion: '1.0.1',
      applicationIcon: const Icon(
        Icons.security,
        size: 40,
        color: Color(0xFFFF1744),
      ),
      children: const [
        Text(
          'Una app de herramientas automatizadas para usuarios de Termux. Incluye scripts y accesos rápidos a múltiples repositorios de seguridad, '
          'con una experiencia moderna y fluida.',
        ),
      ],
    );
  }
}

// ============================================================================
// Below are stub page implementations for each section, each with animated headers
// ============================================================================

/// Intro Page
class Rk13IntroPage extends StatelessWidget {
  const Rk13IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PageContainer(
      title: 'Bienvenido a RK13',
      icon: Icons.terminal,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'Explora las mejores herramientas de hacking ético desde tu terminal.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Home Page
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PageContainer(
      title: 'Repositorios',
      icon: Icons.extension,
      child: ListView(
        children: List.generate(
          10,
          (i) => ListTile(
            leading: const Icon(Icons.folder_open),
            title: Text('Repositorio #$i'),
          ),
        ),
      ),
    );
  }
}

/// Learn Python Page
class LearnPythonPage extends StatelessWidget {
  const LearnPythonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PageContainer(
      title: 'Aprende Python',
      icon: Icons.code,
      child: Column(
        children: const [
          Text('Lecciones cortas para dominar Python desde cero.'),
        ],
      ),
    );
  }
}

/// Termux Commands Page
class TermuxCommandsPage extends StatelessWidget {
  const TermuxCommandsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PageContainer(
      title: 'Comandos Termux',
      icon: Icons.computer,
      child: ListView(
        children: List.generate(
          20,
          (i) => ListTile(
            leading: const Icon(Icons.code),
            title: Text('comando_$i - descripción breve'),
          ),
        ),
      ),
    );
  }
}

/// Bash Tools Page
class BashToolsPage extends StatelessWidget {
  const BashToolsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PageContainer(
      title: 'Scripts Bash Tools',
      icon: Icons.build,
      child: ListView(
        children: List.generate(
          10,
          (i) => ListTile(
            leading: const Icon(Icons.script),
            title: Text('script_$i.sh'),
          ),
        ),
      ),
    );
  }
}

/// Donar Page
class DonarPage extends StatelessWidget {
  const DonarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Donar')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.favorite, size: 72, color: Colors.redAccent),
            SizedBox(height: 16),
            Text('Gracias por tu apoyo!', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

/// Shared container widget for page content with fade-in animation
class _PageContainer extends StatefulWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _PageContainer({
    Key? key,
    required this.title,
    required this.icon,
    required this.child,
  }) : super(key: key);

  @override
  __PageContainerState createState() => __PageContainerState();
}

class __PageContainerState extends State<_PageContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(widget.icon, size: 32, color: const Color(0xFFFF1744)),
                const SizedBox(width: 8),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            widget.child,
          ],
        ),
      ),
    );
  }
}

// End of main.dart
