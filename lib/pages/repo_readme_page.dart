import 'dart:io';
import 'dart:ui';
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
      setState(() => readmeContent = "❌ Error al cargar el README: $e");
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
      _mostrarToast("✅ Script guardado en /storage/emulated/0/termuxcode", Colors.green);
    } catch (e) {
      setState(() => isSaving = false);
      _mostrarToast("❌ Error al guardar script", Colors.redAccent);
    }
  }

  Future<bool> _pedirPermiso() async {
    final status = await Permission.manageExternalStorage.request();
    if (status.isGranted) return true;

    _mostrarToast("Permiso de almacenamiento denegado", Colors.orange);
    return false;
  }

  Future<void> _copiarComando() async {
    final path = "/storage/emulated/0/termuxcode/${widget.scriptFile}";
    await FlutterClipboard.copy("bash $path");
    _mostrarToast("📋 Comando copiado: bash $path", Colors.blueAccent);
  }

  void _mostrarToast(String mensaje, Color color) {
    final overlay = Overlay.of(context);
    if (overlay == null) return;

    final entry = OverlayEntry(
      builder: (_) => Positioned(
        bottom: 90,
        left: 24,
        right: 24,
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
                const Icon(Icons.info_outline, color: Colors.white),
                const SizedBox(width: 12),
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.repoName),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black, // Fondo negro sólido
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.redAccent.withOpacity(0.5)),
                  ),
                  child: Markdown(
                    data: readmeContent,
                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                      p: const TextStyle(color: Colors.white, fontSize: 15, height: 1.6, fontFamily: 'monospace'),
                      code: const TextStyle(color: Colors.greenAccent, fontFamily: 'Courier'),
                      h1: const TextStyle(color: Colors.redAccent, fontSize: 22),
                      h2: const TextStyle(color: Colors.blueAccent, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: isSaving ? null : (isSaved ? _copiarComando : _guardarScript),
                        icon: Icon(isSaving
                            ? Icons.hourglass_empty
                            : isSaved
                                ? Icons.copy
                                : Icons.download),
                        label: Text(isSaving
                            ? "Guardando..."
                            : isSaved
                                ? "Copiar bash"
                                : "Instalar"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.terminal, color: Colors.greenAccent),
                      tooltip: "Abrir Termux",
                      onPressed: _abrirTermux,
                    ),
                    IconButton(
                      icon: const Icon(Icons.link, color: Colors.blueAccent),
                      tooltip: "Ver GitHub",
                      onPressed: _abrirGithub,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
