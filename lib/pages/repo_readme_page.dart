import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:clipboard/clipboard.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoReadmePage extends StatefulWidget {
  final String repoName;
  final String readmeAsset;
  final String installCommand;

  const RepoReadmePage({
    required this.repoName,
    required this.readmeAsset,
    required this.installCommand,
    Key? key,
  }) : super(key: key);

  @override
  State<RepoReadmePage> createState() => _RepoReadmePageState();
}

class _RepoReadmePageState extends State<RepoReadmePage> {
  String readmeContent = "Cargando README...";

  @override
  void initState() {
    super.initState();
    _loadReadme();
  }

  Future<void> _loadReadme() async {
    try {
      final content = await rootBundle.loadString(widget.readmeAsset);
      setState(() {
        readmeContent = content;
      });
    } catch (e) {
      setState(() {
        readmeContent = "❌ Error al cargar README: $e";
      });
    }
  }

  Future<void> _abrirTermux() async {
    final termuxUri = Uri.parse('termux://');
    final fallbackUri = Uri.parse('https://f-droid.org/packages/com.termux/');

    if (await canLaunchUrl(termuxUri)) {
      await launchUrl(termuxUri, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
      _showSnack("⚠️ Termux no está instalado. Redirigiendo a F-Droid.");
    }
  }

  Future<void> _copiarComando() async {
    await FlutterClipboard.copy(widget.installCommand);
    _showSnack("📋 Comando copiado al portapapeles");
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
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
                  onPressed: _abrirTermux,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.copy),
                  label: const Text("Copiar Comando"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _copiarComando,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
