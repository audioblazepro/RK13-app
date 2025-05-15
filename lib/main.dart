import 'package:flutter/material.dart';
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

class RK13App extends StatelessWidget {
  const RK13App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RK13 Installer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF000000),
        primaryColor: const Color(0xFFFF1744),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Color(0xFFFF1744)),
          titleTextStyle: TextStyle(
            color: Color(0xFFFF1744),
            fontSize: 22,
            fontWeight: FontWeight.bold,
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

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

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

  void _showInfo(BuildContext ctx) {
    showAboutDialog(
      context: ctx,
      applicationName: 'RK13 Installer',
      applicationVersion: '1.0.1',
      applicationIcon: const Icon(
        Icons.security,
        size: 40,
        color: Color(0xFFFF1744),
      ),
      children: const [
        Text(
          'Una app de herramientas automatizadas para usuarios de Termux. '
          'Incluye scripts y accesos rápidos a múltiples repositorios de seguridad.',
        ),
      ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Sobre esta app',
            onPressed: () => _showInfo(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.terminal, size: 48, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'RK13 Tools',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Instala y explora herramientas de hacking ético.',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            for (int i = 0; i < _titles.length; i++)
              ListTile(
                leading: Icon(
                  _getIcon(i),
                  color:
                      _currentIndex == i
                          ? const Color(0xFFFF1744)
                          : Colors.white,
                ),
                title: Text(
                  _titles[i],
                  style: TextStyle(
                    color:
                        _currentIndex == i
                            ? const Color(0xFFFF1744)
                            : Colors.white,
                  ),
                ),
                selected: _currentIndex == i,
                onTap: () {
                  setState(() => _currentIndex = i);
                  Navigator.pop(context);
                },
              ),
            const Divider(color: Colors.white38, height: 1),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.greenAccent),
              title: const Text('Donar', style: TextStyle(color: Colors.white)),
              onTap: () {
                setState(() => _currentIndex = 5);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFFF1744),
        unselectedItemColor: Colors.white,
        onTap: (i) => setState(() => _currentIndex = i),
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
