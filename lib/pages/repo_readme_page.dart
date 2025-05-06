import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:clipboard/clipboard.dart';
import 'package:android_intent_plus/android_intent.dart';

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
    const intent = AndroidIntent(
      action: 'android.intent.action.MAIN',
      package: 'com.termux',
      componentName: 'com.termux.app.TermuxActivity',
    );
    try {
      await intent.launch();
    } catch (e) {
      _showSnack("❌ Error al abrir Termux: $e");
    }
  }

  Future<void> _copiarComando() async {
    try {
      final scriptAsset = widget.readmeAsset
          .replaceFirst('assets/readme/', 'assets/scripts/')
          .replaceFirst('.md', '.sh');

      final content = await rootBundle.loadString(scriptAsset);
      await FlutterClipboard.copy(content.trim());
      _showSnack("📋 Comandos copiados al portapapeles");
    } catch (e) {
      _showSnack("❌ Error al copiar comandos: ${e.toString()}");
    }
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
        title: Text(
          widget.repoName,
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white70),
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
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.4,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.terminal),
                    label: const Text("Abrir Termux"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _abrirTermux,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.copy),
                    label: const Text("Copiar Comandos"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _copiarComando,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
