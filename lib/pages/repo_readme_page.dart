import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clipboard/clipboard.dart';
import 'package:android_intent_plus/android_intent.dart';

class RepoReadmePage extends StatefulWidget {
  final String repoName;
  final String assetPath;
  final String readmeAsset;
  final String installCommand;
  final String githubUrl;

  const RepoReadmePage({
    required this.repoName,
    required this.assetPath,
    required this.readmeAsset,
    required this.installCommand,
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

  void _mostrarPush(String mensaje, Color color) {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder:
          (_) => Positioned(
            bottom: 90,
            left: 30,
            right: 30,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: color.withOpacity(0.6), blurRadius: 12),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.info, color: Colors.white),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        mensaje,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 3), () => entry.remove());
  }

  Future<void> _copiarComandoConAnimacion() async {
    setState(() {
      cargando = true;
      exito = false;
    });

    await Future.delayed(const Duration(seconds: 1));

    try {
      final contenido = await rootBundle.loadString(widget.assetPath);
      await FlutterClipboard.copy(contenido);

      setState(() {
        cargando = false;
        exito = true;
      });

      _mostrarPush("📋 Comando copiado. Abre Termux y pégalo.", Colors.green);
    } catch (e) {
      setState(() {
        cargando = false;
        exito = false;
      });

      _mostrarPush("❌ Error al copiar comando", Colors.red);
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
      _mostrarPush("❌ No se pudo abrir Termux", Colors.redAccent);
    }
  }

  Future<void> _abrirGithub() async {
    final uri = Uri.parse(widget.githubUrl);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      _mostrarPush("❌ No se pudo abrir GitHub", Colors.orange);
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
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
              ),
              child: Markdown(
                data: readmeContent,
                styleSheet: MarkdownStyleSheet.fromTheme(
                  Theme.of(context),
                ).copyWith(
                  p: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.5,
                    height: 1.6,
                    fontFamily: 'monospace',
                  ),
                  code: const TextStyle(
                    color: Colors.greenAccent,
                    fontFamily: 'monospace',
                  ),
                  h1: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  h2: const TextStyle(color: Colors.blueAccent, fontSize: 18),
                ),
              ),
            ),
          ),
          if (cargando)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(
                minHeight: 5,
                backgroundColor: Colors.red[900],
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
                        : Icons.copy,
                  ),
                  label: Text(
                    cargando
                        ? "Descargando..."
                        : exito
                        ? "🟢 Éxito"
                        : "Instalar",
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: exito ? Colors.green : Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: cargando ? null : _copiarComandoConAnimacion,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _abrirGithub,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
