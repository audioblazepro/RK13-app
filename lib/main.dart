import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'utils/script_installer.dart';
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
      home: const PermissionAndInitScreen(),
    );
  }
}

class PermissionAndInitScreen extends StatefulWidget {
  const PermissionAndInitScreen({super.key});

  @override
  State<PermissionAndInitScreen> createState() => _PermissionAndInitScreenState();
}

class _PermissionAndInitScreenState extends State<PermissionAndInitScreen> {
  bool _loading = true;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    final status = await Permission.manageExternalStorage.request();
    if (status.isGranted) {
      await ScriptInstaller.initScripts();
      setState(() => _loading = false);
    } else {
      setState(() {
        _loading = false;
        _permissionDenied = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Colors.redAccent),
        ),
      );
    }

    if (_permissionDenied) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Permiso denegado',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => openAppSettings(),
                child: const Text('Abrir configuración'),
              ),
            ],
          ),
        ),
      );
    }

    return const MainLayout();
  }
}
