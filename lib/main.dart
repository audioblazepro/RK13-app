import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/rk13_intro_page.dart';
import 'pages/home_page.dart';
import 'pages/learn_python_page.dart';
import 'pages/termux_commands_page.dart';
import 'pages/bash_tools_page.dart';
import 'pages/donar_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Force portrait orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const RK13App());
}

class RK13App extends StatelessWidget {
  const RK13App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RK13 Installer',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFF1744),
        scaffoldBackgroundColor: const Color(0xFF000000),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 1,
          titleTextStyle: TextStyle(
            color: Color(0xFFFF1744),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Color(0xFFFF1744)),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF111111),
          selectedItemColor: Color(0xFFFF1744),
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: true,
        ),
        cardColor: const Color(0xFF1A1A1A),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF1744),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          ),
        ),
      ),
      home: const MainLayout(),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late final AnimationController _animController;
  late final Animation<double> _fadeAnimation;

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
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeIn,
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  IconData _getIcon(int idx) {
    switch (idx) {
      case 0:
        return Icons.info_outline;
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

  void _showInfo() {
    showAboutDialog(
      context: context,
      applicationName: 'RK13 Installer',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(
        Icons.security,
        size: 40,
        color: Color(0xFFFF1744),
      ),
      children: const [
        Text(
          'Accede a herramientas de hacking ético con una interfaz moderna, animaciones suaves y navegación intuitiva.',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
        title: Text(_titles[_currentIndex]),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Sobre esta app',
            onPressed: _showInfo,
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF121212),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFF1A1A1A)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.terminal, size: 48, color: Color(0xFFFF1744)),
                    SizedBox(height: 12),
                    Text(
                      'RK13 Tools',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Hacking ético simplificado.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              ...List.generate(_titles.length, (i) {
                return ListTile(
                  leading: Icon(
                    _getIcon(i),
                    color:
                        _currentIndex == i
                            ? const Color(0xFFFF1744)
                            : Colors.white70,
                  ),
                  title: Text(
                    _titles[i],
                    style: TextStyle(
                      color:
                          _currentIndex == i
                              ? const Color(0xFFFF1744)
                              : Colors.white70,
                      fontWeight:
                          _currentIndex == i
                              ? FontWeight.bold
                              : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    setState(() => _currentIndex = i);
                    Navigator.of(context).pop();
                  },
                );
              }),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton.icon(
                  onPressed: () => setState(() => _currentIndex = 5),
                  icon: const Icon(Icons.favorite, color: Colors.white),
                  label: const Text('DONAR'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() => _currentIndex = i);
          _animController.reset();
          _animController.forward();
        },
        items: List.generate(
          _titles.length,
          (i) => BottomNavigationBarItem(
            icon: Icon(_getIcon(i)),
            label: _titles[i],
          ),
        ),
      ),
    );
  }
}
