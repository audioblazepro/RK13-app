import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:path_provider/path_provider.dart';
import 'package:clipboard/clipboard.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class RepoReadmePage extends StatefulWidget {
  final String repoName;
  final String scriptAssetPath;
  final String readmeAsset;
  final String githubUrl;

  const RepoReadmePage({
    required this.repoName,
    required this.scriptAssetPath,
    required this.readmeAsset,
    required this.githubUrl,
    super.key,
  });

  @override
  State<RepoReadmePage> createState() => _RepoReadmePageState();
}

class _RepoReadmePageState extends State<RepoReadmePage> {
  String readmeContent = "Cargando README...";
  bool cargando = false;
  bool exito = false;
  String? installedPath;

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
      setState(() => readmeContent = "❌ Error al cargar README:\n$e");
    }
  }

  Future<String> _installScript() async {
    final dir = await getApplicationDocumentsDirectory();
    final targetDir = Directory('${dir.path}/scripts');
    if (!await targetDir.exists()) {
      await targetDir.create(recursive: true);
    }

    final scriptName = widget.scriptAssetPath.split("/").last;
    final targetPath = "${targetDir.path}/$scriptName";
    final scriptFile = File(targetPath);

    if (!await scriptFile.exists()) {
      final bytes = await rootBundle.load(widget.scriptAssetPath);
      await scriptFile.writeAsBytes(bytes.buffer.asUint8List());

      try {
        await Process.run('chmod', ['+x', scriptFile.path]);
      } catch (_) {
        // chmod podría fallar si no está soportado, ignorar silenciosamente
      }
    }

    return scriptFile.path;
  }

  Future<void> _copiarRutaComando() async {
    setState(() {
      cargando = true;
      exito = false;
    });

    try {
      final path = await _installScript();
      final comando = 'bash "$path"';
      await FlutterClipboard.copy(comando);
      setState(() {
        cargando = false;
        exito = true;
        installedPath = path;
      });
      _mostrarPush("\u2713 Ruta copiada: $comando", Colors.green);
    } catch (e) {
      setState(() {
        cargando = false;
        exito = false;
      });
      _mostrarPush("❌ Error: $e", Colors.red);
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
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.95),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(mensaje,
                style: const TextStyle(color: Colors.white, fontSize: 15)),
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
    if (!await canLaunchUrl(uri)) {
      _mostrarPush("❌ GitHub URL inválida", Colors.red);
      return;
    }
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(widget.repoName), backgroundColor: Colors.black),
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
          if (cargando)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(
                minHeight: 5,
                backgroundColor: Colors.black,
                color: Colors.redAccent,
              ),
            ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: Icon(
                    cargando
                        ? Icons.hourglass_top
                        : exito
                            ? Icons.check_circle
                            : Icons.download,
                  ),
                  label: Text(
                    cargando
                        ? "Descargando..."
                        : exito
                            ? "\u2713 Copiado"
                            : "Instalar",
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: exito ? Colors.green : Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: cargando ? null : _copiarRutaComando,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.terminal),
                  label: const Text("Abrir Termux"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
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
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
