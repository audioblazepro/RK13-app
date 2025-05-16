import 'package:flutter/material.dart';
import 'dart:ui';
import 'pages/rk13_intro_page.dart';
import 'pages/home_page.dart';
import 'pages/learn_python_page.dart';
import 'pages/termux_commands_page.dart';
import 'pages/bash_tools_page.dart';
import 'pages/donar_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RK13App());
}

/// Colores centrales de la app
class AppColors {
  static const black = Color(0xFF000000);
  static const overlay = Color(0xAA000000);
  static const red = Color(0xFFFF1744);
  static const redAccent = Colors.redAccent;
  static const white = Colors.white;
  static const white70 = Colors.white70;
}

/// Tema global Dark
class AppTheme {
  static ThemeData get dark {
    final base = ThemeData.dark();
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.black,
      canvasColor: AppColors.black,
      primaryColor: AppColors.red,
      cardColor: AppColors.black.withAlpha(128),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.red),
        titleTextStyle: TextStyle(
          color: AppColors.red,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.red,
        onPrimary: AppColors.white,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          height: 1.5,
        ),
        bodyLarge: TextStyle(color: AppColors.white70, fontSize: 18),
      ),
      iconTheme: const IconThemeData(color: AppColors.red),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          foregroundColor: AppColors.white,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.red,
        textColor: AppColors.white,
        selectedColor: AppColors.red,
      ),
    );
  }
}

class RK13App extends StatelessWidget {
  const RK13App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RK13 Installer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const MainLayout(),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  static const _titles = <String>[
    'Bienvenido a RK13',
    'Repositorios',
    'Aprende Python',
    'Comandos Termux',
    'Scripts Bash Tools',
  ];

  static const _icons = <IconData>[
    Icons.info,
    Icons.extension,
    Icons.code,
    Icons.computer,
    Icons.build,
  ];

  final _pages = <Widget>[
    const Rk13IntroPage(),
    HomePage(),
    const LearnPythonPage(),
    const TermuxCommandsPage(),
    const BashToolsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Sobre esta app',
            onPressed: () => _showAbout(context),
          ),
        ],
      ),
      drawer: AppDrawer(
        selectedIndex: _currentIndex,
        titles: _titles,
        icons: _icons,
        onItemTap: (index) {
          setState(() => _currentIndex = index);
          Navigator.pop(context);
        },
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.red,
        unselectedItemColor: AppColors.white70,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          for (int i = 0; i < _titles.length; i++)
            BottomNavigationBarItem(icon: Icon(_icons[i]), label: _titles[i]),
        ],
      ),
    );
  }

  void _showAbout(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'RK13 Installer',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(
        Icons.security,
        size: 40,
        color: AppColors.red,
      ),
      children: const [
        Text(
          'Una app de herramientas automatizadas para usuarios de Termux. '
          'Incluye scripts y accesos rápidos a más de 30 repositorios de seguridad.',
        ),
      ],
    );
  }
}

/// Drawer personalizado con encabezado de usuario
class AppDrawer extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final List<IconData> icons;
  final ValueChanged<int> onItemTap;

  const AppDrawer({
    super.key,
    required this.selectedIndex,
    required this.titles,
    required this.icons,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(color: AppColors.overlay),
          ),
          Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: AppColors.black),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: AppColors.red,
                  child: const Icon(
                    Icons.terminal,
                    size: 36,
                    color: AppColors.white,
                  ),
                ),
                accountName: const Text(
                  'RK13 Tools',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: const Text('Hacking ético & scripts'),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: titles.length,
                  itemBuilder: (context, i) {
                    final selected = i == selectedIndex;
                    return ListTile(
                      leading: Icon(
                        icons[i],
                        color: selected ? AppColors.red : AppColors.white,
                      ),
                      title: Text(
                        titles[i],
                        style: TextStyle(
                          color: selected ? AppColors.red : AppColors.white,
                        ),
                      ),
                      selected: selected,
                      onTap: () => onItemTap(i),
                    );
                  },
                ),
              ),
              const Divider(color: AppColors.white70),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'developer & programmer;',
                      style: TextStyle(color: AppColors.white70),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Sebastián Lara - RK13',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const DonarPage()),
                        );
                      },
                      icon: const Icon(Icons.favorite, color: AppColors.white),
                      label: const Text('DONAR'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
