import 'package:flutter/material.dart';
import 'pages/rk13_intro_page.dart';
import 'pages/home_page.dart';
import 'pages/learn_python_page.dart';
import 'pages/termux_commands_page.dart';
import 'pages/bash_tools_page.dart';

void main() {
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
        primaryColor: Colors.redAccent,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.redAccent, fontSize: 20),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.redAccent),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.black,
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
    const Rk13IntroPage(),       // NUEVO: Página de introducción
    HomePage(),
    const LearnPythonPage(),
    const TermuxCommandsPage(),
    const BashToolsPage(),
  ];

  final List<String> _titles = [
    "Bienvenido a RK13",         // Nuevo título
    "Repositorios",
    "Aprende Python",
    "Comandos Termux",
    "Scripts Bash Tools",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.redAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.terminal, size: 48, color: Colors.white),
                  SizedBox(height: 10),
                  Text("RK13 Tools", style: TextStyle(fontSize: 22, color: Colors.white)),
                ],
              ),
            ),
            _buildDrawerItem(Icons.info, "Inicio RK13", 0),
            _buildDrawerItem(Icons.extension, "Repositorios", 1),
            _buildDrawerItem(Icons.code, "Aprende Python", 2),
            _buildDrawerItem(Icons.computer, "Comandos Termux", 3),
            _buildDrawerItem(Icons.build, "Bash Tools", 4),
          ],
        ),
      ),
      body: _pages[_currentIndex],
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        setState(() => _currentIndex = index);
        Navigator.pop(context);
      },
    );
  }
}
