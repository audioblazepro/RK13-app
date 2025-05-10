import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clipboard/clipboard.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/script_installer.dart';

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
    final granted = await _pedirPermiso();
    if (!granted) return;

    setState(() {
      isSaving = true;
      isSaved = false;
    });

    try {
      await ScriptInstaller.guardarScript(widget.scriptFile);
      setState(() {
        isSaving = false;
        isSaved = true;
      });
      _mostrarToast("✅ Script guardado correctamente", Colors.green);
    } catch (e) {
      setState(() => isSaving = false);
      _mostrarToast("❌ Error al guardar script", Colors.red);
    }
  }

  Future<bool> _pedirPermiso() async {
    final status = await Permission.manageExternalStorage.request();
    if (status.isGranted) return true;
    _mostrarToast("Permiso de almacenamiento denegado", Colors.orange);
    return false;
  }

  Future<void> _copiarComando() async {
    final ruta = "/storage/emulated/0/termuxcode/${widget.scriptFile}";
    await FlutterClipboard.copy("bash $ruta");
    _mostrarToast("📋 Comando copiado: bash $ruta", Colors.blue);
  }

  void _mostrarToast(String mensaje, Color color) {
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
    } catch (_) {
      _mostrarToast("❌ No se pudo abrir Termux", Colors.orange);
    }
  }

  Future<void> _abrirGithub() async {
    final uri = Uri.parse(widget.githubUrl);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      _mostrarToast("❌ No se pudo abrir GitHub", Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(widget.repoName)),
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
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: isSaving
                      ? ElevatedButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.hourglass_top),
                          label: const Text("Guardando..."),
                        )
                      : isSaved
                          ? ElevatedButton.icon(
                              onPressed: _copiarComando,
                              icon: const Icon(Icons.copy),
                              label: const Text("Copiar bash"),
                            )
                          : ElevatedButton.icon(
                              onPressed: _guardarScript,
                              icon: const Icon(Icons.download),
                              label: const Text("Instalar"),
                            ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.terminal),
                  tooltip: "Abrir Termux",
                  onPressed: _abrirTermux,
                ),
                IconButton(
                  icon: const Icon(Icons.link),
                  tooltip: "Ver GitHub",
                  onPressed: _abrirGithub,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
