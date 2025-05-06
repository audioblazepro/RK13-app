import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:clipboard/clipboard.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoReadmePage extends StatefulWidget {
  final String repoName;
  final String readmeAsset;
  final String scriptAsset;

  const RepoReadmePage({
    required this.repoName,
    required this.readmeAsset,
    required this.scriptAsset,
    Key? key,
  }) : super(key: key);

  @override
  State<RepoReadmePage> createState() => _RepoReadmePageState();
}

class _RepoReadmePageState extends State<RepoReadmePage>
    with TickerProviderStateMixin {
  String readmeContent = "Cargando README...";
  String feedbackText = '';
  Color progressColor = Colors.red;
  double progressValue = 0.0;
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _loadReadme();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  Future<void> _loadReadme() async {
    try {
      final content = await rootBundle.loadString(widget.readmeAsset);
      setState(() => readmeContent = content);
    } catch (e) {
      setState(() => readmeContent = "❌ Error al cargar README: $e");
    }
  }

  Future<void> _instalar() async {
    setState(() {
      feedbackText = "📦 Ejecutando instalación...";
      progressColor = Colors.red;
      progressValue = 0.0;
    });

    _progressController.forward(from: 0.0);

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      feedbackText = "✅ Instalación simulada completada.";
      progressColor = Colors.green;
      progressValue = 1.0;
    });
  }

  Future<void> _copiarComando() async {
    try {
      final script = await rootBundle.loadString(widget.scriptAsset);
      await FlutterClipboard.copy(script);
      _mostrarSnackbar("📋 Comando copiado. Pégalo en Termux.");
    } catch (e) {
      _mostrarSnackbar("❌ No se pudo copiar el comando: $e");
    }
  }

  void _mostrarSnackbar(String mensaje) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _abrirTermux() async {
    final intentUri = Uri.parse("intent://#Intent;package=com.termux;end");

    try {
      if (await canLaunchUrl(intentUri)) {
        await launchUrl(intentUri);
      } else {
        _mostrarSnackbar("⚠️ Termux no está instalado.");
      }
    } catch (e) {
      _mostrarSnackbar("❌ No se pudo abrir Termux: $e");
    }
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.repoName,
          style: const TextStyle(color: Colors.greenAccent),
        ),
        iconTheme: const IconThemeData(color: Colors.greenAccent),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(
                  readmeContent,
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 14,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            ),
          ),
          if (feedbackText.isNotEmpty)
            Column(
              children: [
                Text(
                  feedbackText,
                  style: TextStyle(color: progressColor),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(
                    value: progressValue,
                    color: progressColor,
                    backgroundColor: Colors.grey[800],
                  ),
                ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.system_update_alt),
                    label: const Text("Instalar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: progressValue == 1.0
                          ? Colors.green
                          : Colors.redAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: _instalar,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.copy),
                    label: const Text("Copiar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: _copiarComando,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.terminal),
              label: const Text("Abrir Termux"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              onPressed: _abrirTermux,
            ),
          ),
        ],
      ),
    );
  }
}
