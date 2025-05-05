import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/file_helper.dart';
import '../utils/termux_launcher.dart';
import '../models/repo_model.dart';

class InstallLogPage extends StatefulWidget {
  final RepoModel repo;

  const InstallLogPage({required this.repo, Key? key}) : super(key: key);

  @override
  State<InstallLogPage> createState() => _InstallLogPageState();
}

class _InstallLogPageState extends State<InstallLogPage>
    with SingleTickerProviderStateMixin {
  String logContent = "📦 Preparando instalación...";
  double progreso = 0.05;
  late Timer _timer;
  late AnimationController _animationController;

  final String dir = '/storage/emulated/0/Download';
  String scriptPath = '';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _iniciarInstalacion();
    _timer = Timer.periodic(const Duration(seconds: 2), (_) => _leerLogs());
  }

  Future<void> _iniciarInstalacion() async {
    try {
      final permiso = await Permission.manageExternalStorage.request();
      if (!permiso.isGranted) {
        setState(() => logContent = "❌ Permiso de almacenamiento denegado");
        return;
      }

      // Guarda y copia el script a ~/.termux/boot/start_<repo>.sh
      scriptPath = await guardarYCopiarScript(widget.repo.name, widget.repo.assetPath);

      final logFile = File('$dir/rk13_logs.txt');
      await logFile.writeAsString("🛠️ Instalación iniciada...\n");

      // Abrir Termux directamente
      await abrirTermux();

      setState(() {
        logContent = "✅ Script copiado a Termux Boot:\n$scriptPath\n\nAbre Termux o reinicia para que se ejecute.";
      });
    } catch (e) {
      setState(() {
        logContent = "❌ Error: $e";
      });
    }
  }

  Future<void> _leerLogs() async {
    final logFile = File('$dir/rk13_logs.txt');
    if (await logFile.exists()) {
      final content = await logFile.readAsString();
      setState(() {
        logContent = content;
        progreso = _calcularProgreso(content);
      });
    }
  }

  double _calcularProgreso(String log) {
    if (log.contains("✅")) return 1.0;
    if (log.contains("pkg") || log.contains("python") || log.contains("node"))
      return 0.6;
    return 0.2;
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Instalando..."),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (_, __) => LinearProgressIndicator(
              value: progreso < 1.0 ? _animationController.value * progreso : progreso,
              backgroundColor: Colors.grey[900],
              color: Colors.redAccent,
              minHeight: 5,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Text(
                  logContent,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    color: Colors.greenAccent,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.close),
              label: const Text("Cerrar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
