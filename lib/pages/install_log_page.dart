import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:clipboard/clipboard.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/file_helper.dart';
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
  String scriptContent = '';

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

      scriptPath = await guardarYCopiarScript(widget.repo.name, widget.repo.assetPath);

      final contenido = await rootBundle.loadString(widget.repo.assetPath);
      scriptContent = contenido;

      final logFile = File('$dir/rk13_logs.txt');
      await logFile.writeAsString("🛠️ Instalación iniciada...\n");

      setState(() {
        logContent = "✅ Script copiado a Termux Boot:\n$scriptPath\n\nPuedes ejecutar desde Termux si lo prefieres.";
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
    if (log.contains("pkg") || log.contains("python") || log.contains("node")) return 0.6;
    return 0.2;
  }

  Future<void> abrirTermuxManual() async {
    final uri = Uri.parse('intent://#Intent;package=com.termux;scheme=android-app;end');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('❌ No se pudo abrir Termux')),
      );
    }
  }

  Future<void> copiarScriptAlPortapapeles(BuildContext context) async {
    await FlutterClipboard.copy(scriptContent);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('📋 Script copiado al portapapeles')),
    );
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
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.terminal),
                  label: const Text("Abrir Termux"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: abrirTermuxManual,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.copy),
                  label: const Text("Copiar Script"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () => copiarScriptAlPortapapeles(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.close),
              label: const Text("Cerrar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
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
