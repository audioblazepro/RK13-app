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
  bool copied = false;
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
      setState(() => readmeContent = "❌ Error al cargar README: \$e");
    }
  }

  Future<void> _instalar() async {
    setState(() {
      feedbackText = "📦 Descargando comando...";
      progressColor = Colors.red;
      progressValue = 0.0;
    });

    _progressController.forward(from: 0.0);
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      feedbackText = "🟢 ¡Éxito!";
      progressColor = Colors.green;
      progressValue = 1.0;
    });
  }

  Future<void> _copiarComando() async {
    try {
      final script = await rootBundle.loadString(widget.scriptAsset);
      await FlutterClipboard.copy(script);
      _mostrarSnackbar("📋 Comando copiado. Abre Termux y presiona Enter.");
    } catch (e) {
      _mostrarSnackbar("❌ Error al copiar comandos: \$e");
    }
  }

  void _mostrarSnackbar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  Future<void> _abrirTermux() async {
    const packageName = 'com.termux';
    final intent = Uri.parse("intent://#Intent;package=\$packageName;end");

    if (await canLaunchUrl(intent)) {
      await launchUrl(intent);
    } else {
      _mostrarSnackbar("❌ Termux no encontrado.");
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
        title: Text(widget.repoName, style: const TextStyle(color: Colors.greenAccent)),
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
                Text(feedbackText, style: TextStyle(color: progressColor)),
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
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.system_update_alt),
                  label: const Text("Install Now"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        progressValue == 1.0 ? Colors.green : Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _instalar,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.copy),
                  label: const Text("Copiar Comandos"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _copiarComando,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            icon: const Icon(Icons.terminal),
            label: const Text("Abrir Termux"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: _abrirTermux,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
