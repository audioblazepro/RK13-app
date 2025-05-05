import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/termux_launcher.dart'; // importá la función que ya hicimos

class InstallLogPage extends StatefulWidget {
  final String scriptPath; // ruta del asset: ej. assets/scripts/install_node.sh

  const InstallLogPage({required this.scriptPath, Key? key}) : super(key: key);

  @override
  _InstallLogPageState createState() => _InstallLogPageState();
}

class _InstallLogPageState extends State<InstallLogPage> {
  String logContent = "📦 Preparando instalación...";
  double progreso = 0.1;
  late Timer _timer;

  final String logPath = '/storage/emulated/0/Download/logs.txt';
  final String scriptDest = '/storage/emulated/0/Download/command.sh';

  @override
  void initState() {
    super.initState();
    _iniciarInstalacion();
    _timer = Timer.periodic(const Duration(seconds: 2), (_) => _leerLogs());
  }

  Future<void> _iniciarInstalacion() async {
    try {
      await _pedirPermisos();

      // Cargar el script desde assets
      final contenido = await rootBundle.loadString(widget.scriptPath);

      final scriptFile = File(scriptDest);
      final logFile = File(logPath);

      // Guardar el script con shebang y log final
      await logFile.writeAsString("🛠️ Instalación iniciada...\n");

      await scriptFile.writeAsString('''#!/data/data/com.termux/files/usr/bin/bash
$contenido
echo "✅ Instalación completa" >> "$logPath"
''');

      await scriptFile.setExecutable(true);

      // Ejecutar en Termux
      await abrirTermuxConScript(scriptDest);
    } catch (e) {
      setState(() {
        logContent = "❌ Error al ejecutar instalación:\n$e";
      });
    }
  }

  Future<void> _pedirPermisos() async {
    final status = await Permission.manageExternalStorage.request();
    if (!status.isGranted) {
      await openAppSettings();
      throw 'Permiso de almacenamiento denegado';
    }
  }

  Future<void> _leerLogs() async {
    final logFile = File(logPath);
    if (await logFile.exists()) {
      final content = await logFile.readAsString();
      setState(() {
        logContent = content;
        progreso = _calcularProgreso(content);
      });
    }
  }

  double _calcularProgreso(String log) {
    if (log.contains("✅ Instalación completa")) return 1.0;
    if (log.contains("pkg") || log.contains("node") || log.contains("python")) return 0.6;
    return 0.2;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Instalando..."),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: progreso,
              backgroundColor: Colors.grey[800],
              color: Colors.redAccent,
              minHeight: 6,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                color: Colors.grey[900],
                child: SingleChildScrollView(
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
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.check),
              label: const Text("Cerrar"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
