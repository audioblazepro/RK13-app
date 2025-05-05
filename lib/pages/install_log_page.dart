import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InstallLogPage extends StatefulWidget {
  final String scriptPath; // Ej: 'assets/scripts/install_node.sh'

  const InstallLogPage({required this.scriptPath, Key? key}) : super(key: key);

  @override
  _InstallLogPageState createState() => _InstallLogPageState();
}

class _InstallLogPageState extends State<InstallLogPage> {
  String logContent = "🛠️ Instalación iniciada...";
  double progreso = 0.1;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _iniciarInstalacion();
    _timer = Timer.periodic(Duration(seconds: 2), (_) => _leerLogs());
  }

  Future<void> _iniciarInstalacion() async {
    try {
      // Cargar el script desde assets
      final contenido = await rootBundle.loadString(widget.scriptPath);

      final scriptPath = '/storage/emulated/0/Download/command.sh';
      final logPath = '/storage/emulated/0/Download/logs.txt';

      final scriptFile = File(scriptPath);
      final logFile = File(logPath);

      // Escribir el log inicial
      await logFile.writeAsString("🛠️ Instalación iniciada...\n");

      // Escribir el script a ejecutar
      await scriptFile.writeAsString('''#!/data/data/com.termux/files/usr/bin/bash
$contenido
echo "✅ Instalación completa" >> "$logPath"
''');

      // Ejecutar Termux con el script
      await Process.run('am', [
        'start',
        '-a',
        'com.termux.RUN_COMMAND',
        '-n',
        'com.termux/.app.TermuxActivity',
        '--es',
        'com.termux.RUN_COMMAND_PATH',
        scriptPath,
        '--ez',
        'com.termux.RUN_COMMAND_BACKGROUND',
        'false',
      ]);
    } catch (e) {
      setState(() {
        logContent = "❌ Error al ejecutar instalación: $e";
      });
    }
  }

  Future<void> _leerLogs() async {
    final logFile = File('/storage/emulated/0/Download/logs.txt');
    if (await logFile.exists()) {
      final contenido = await logFile.readAsString();
      setState(() {
        logContent = contenido;
        progreso = _calcularProgreso(contenido);
      });
    }
  }

  double _calcularProgreso(String log) {
    if (log.contains("✅ Instalación completa")) return 1.0;
    if (log.contains("npm") || log.contains("pkg") || log.contains("git")) return 0.6;
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
        title: Text("Instalando..."),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: progreso,
              backgroundColor: Colors.grey[800],
              color: Colors.redAccent,
              minHeight: 6,
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                color: Colors.grey[900],
                child: SingleChildScrollView(
                  child: Text(
                    logContent,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      color: Colors.greenAccent,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.check),
              label: Text("Cerrar"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
