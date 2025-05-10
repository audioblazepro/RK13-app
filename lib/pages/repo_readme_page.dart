import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clipboard/clipboard.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class RepoReadmePage extends StatefulWidget {
  final String repoName;
  final String scriptFile;
  final String readmeAsset;
  final String githubUrl;

  const RepoReadmePage({
    required this.repoName,
    required this.scriptFile,
    required this.readmeAsset,
    required this.githubUrl,
    super.key,
  });

  @override
  State<RepoReadmePage> createState() => _RepoReadmePageState();
}

class _RepoReadmePageState extends State<RepoReadmePage> {
  String readmeContent = "Cargando README...";
  bool isSaving = false;
  bool isSaved = false;
  bool isCopied = false;

  @override
  void initState() {
    super.initState();
    _loadReadme();
  }

  Future<void> _loadReadme() async {
    try {
      final content = await rootBundle.loadString(widget.readmeAsset);
      setState(() => readmeContent = content);
    } catch (e) {
      setState(() => readmeContent = "❌ Error al cargar README: $e");
    }
  }

  Future<void> _guardarScript() async {
    setState(() {
      isSaving = true;
      isSaved = false;
      isCopied = false;
    });

    await Future.delayed(const Duration(seconds: 1));

    try {
      final directory = await getApplicationDocumentsDirectory();
      final scriptDir = Directory("${directory.path}/scripts");
      if (!await scriptDir.exists()) {
        await scriptDir.create(recursive: true);
      }

      final scriptData = await rootBundle.load("assets/scripts/${widget.scriptFile}");
      final scriptFile = File("${scriptDir.path}/${widget.scriptFile}");
      await scriptFile.writeAsBytes(scriptData.buffer.asUint8List());

      setState(() {
        isSaving = false;
        isSaved = true;
      });
    } catch (e) {
      setState(() {
        isSaving = false;
        isSaved = false;
      });
      _mostrarPush("❌ Error al guardar script", Colors.redAccent);
    }
  }

  Future<void> _copiarComando() async {
    final comando = 'bash ~/Android/data/com.rk13.rk13app/files/scripts/${widget.scriptFile}';
    try {
      await FlutterClipboard.copy(comando);
      setState(() => isCopied = true);
      _mostrarPush("📋 Copiado. Abre Termux y pégalo.", Colors.green);
    } catch (e) {
      _mostrarPush("❌ Error al copiar", Colors.red);
    }
  }

  void _mostrarPush(String mensaje, Color color) {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (_) => Positioned(
        bottom: 90,
        left: 30,
        right: 30,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: color.withOpacity(0.95),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.info, color: Colors.white),
                const SizedBox(width: 10),
                Expanded(child: Text(mensaje, style: const TextStyle(color: Colors.white))),
              ],
            ),
          ),
        ),
      ),
    );
    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 3), () => entry.remove());
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
      _mostrarPush("❌ No se pudo abrir Termux", Colors.orange);
    }
  }

  Future<void> _abrirGithub() async {
    final uri = Uri.parse(widget.githubUrl);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      _mostrarPush("❌ No se pudo abrir GitHub", Colors.deepOrange);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.repoName),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.redAccent.withOpacity(0.4)),
              ),
              child: Markdown(
                data: readmeContent,
                styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                  p: const TextStyle(color: Colors.white, fontSize: 15, height: 1.6, fontFamily: 'monospace'),
                  code: const TextStyle(color: Colors.greenAccent),
                  h1: const TextStyle(color: Colors.redAccent, fontSize: 22),
                  h2: const TextStyle(color: Colors.blueAccent, fontSize: 18),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: isSaving
                        ? ElevatedButton.icon(
                            key: const ValueKey("saving"),
                            onPressed: null,
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                            icon: const Icon(Icons.download),
                            label: const Text("Descargando..."),
                          )
                        : isSaved
                            ? ElevatedButton.icon(
                                key: const ValueKey("copiar"),
                                onPressed: _copiarComando,
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                icon: const Icon(Icons.copy),
                                label: const Text("Copiar"),
                              )
                            : ElevatedButton.icon(
                                key: const ValueKey("instalar"),
                                onPressed: _guardarScript,
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                icon: const Icon(Icons.download),
                                label: const Text("Instalar"),
                              ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.terminal),
                    label: const Text("Abrir Termux"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: _abrirTermux,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.code),
                    label: const Text("GitHub"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: _abrirGithub,
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
