import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'utils/script_installer.dart';
import 'pages/rk13_intro_page.dart';
import 'pages/home_page.dart';
import 'pages/learn_python_page.dart';
import 'pages/termux_commands_page.dart';
import 'pages/bash_tools_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _handlePermissions();
  runApp(const RK13App());
}

Future<void> _handlePermissions() async {
  var status = await Permission.manageExternalStorage.status;
  if (!status.isGranted) {
    status = await Permission.manageExternalStorage.request();
    if (!status.isGranted) {
      await openAppSettings();
      return;
    }
  }

  if (status.isGranted) {
    await ScriptInstaller.initScripts();
  }
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
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.redAccent,
        canvasColor: Colors.black,
        cardColor: Colors.grey[900],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 4,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.redAccent),
          titleTextStyle: TextStyle(
            color: Colors.redAccent,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
          bodyLarge: TextStyle(color: Colors.white70, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.redAccent),
        drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        listTileTheme: const ListTileThemeData(iconColor: Colors.redAccent),
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
  ];

  final List<String> _titles = [
    "Bienvenido a RK13",
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
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Sobre esta app',
            onPressed: () => _mostrarInfo(context),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.redAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.terminal, size: 48, color: Colors.white),
                  SizedBox(height: 10),
                  Text("RK13 Tools",
                      style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("Instala y explora herramientas de hacking ético.",
                      style: TextStyle(fontSize: 12, color: Colors.white70)),
                ],
              ),
            ),
            for (var i = 0; i < _titles.length; i++)
              _buildDrawerItem(_getIcon(i), _titles[i], i),
          ],
        ),
      ),
      body: _pages[_currentIndex],
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
      default:
        return Icons.device_unknown;
    }
  }

  ListTile _buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon, color: _currentIndex == index ? Colors.redAccent : Colors.white),
      title: Text(title, style: TextStyle(color: _currentIndex == index ? Colors.redAccent : Colors.white)),
      selected: _currentIndex == index,
      onTap: () {
        setState(() => _currentIndex = index);
        Navigator.pop(context);
      },
    );
  }

  void _mostrarInfo(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'RK13 Installer',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(Icons.security, size: 40, color: Colors.redAccent),
      children: [
        const Text(
          'Una app de herramientas automatizadas para usuarios de Termux. '
          'Incluye scripts y accesos rápidos a más de 30 repositorios de seguridad.',
        ),
      ],
    );
  }
}
