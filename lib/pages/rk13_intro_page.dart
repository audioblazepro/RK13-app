import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Rk13IntroPage extends StatelessWidget {
  const Rk13IntroPage({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint("No se pudo abrir la URL: $url");
    }
  }

  Widget _buildDownloadButton(String title, String url, Color color, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton.icon(
        onPressed: () => _launchUrl(url),
        icon: Icon(icon),
        label: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 5,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget _codeSnippet(String code) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.redAccent),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          code,
          style: const TextStyle(
            fontFamily: 'Courier',
            fontSize: 14,
            color: Colors.greenAccent,
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
        ),
      ),
    );
  }

  Widget _sectionText(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("RK13 | HACKING MODE"),
        backgroundColor: Colors.redAccent.shade700,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _sectionTitle("Bienvenido al mundo hacker", Colors.redAccent),
            _sectionText(
              "Termux no es solo una app. Es una terminal que convierte tu Android en una máquina de guerra digital. Y para dominar este universo… necesitas hablar su idioma.",
            ),
            _sectionTitle("¿Por qué Python?", Colors.lightBlueAccent),
            _sectionText(
              "Python es simple, poderoso y versátil. Ideal para automatización, bots, análisis de redes, IA y más. Hablar con máquinas empieza aquí.",
            ),
            _codeSnippet('''
# Script para listar archivos en Termux
import os

def listar():
    os.system("ls")

listar()
'''),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[900],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "No necesitas experiencia, solo coraje. Cada línea de código es una llave. Ábrela.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white),
              ),
            ),
            _sectionTitle("Descargas esenciales", Colors.greenAccent),
            _buildDownloadButton("F-Droid (Repositorios libres)", "https://f-droid.org/", Colors.deepPurple, Icons.security),
            _buildDownloadButton("Termux (desde F-Droid)", "https://f-droid.org/en/packages/com.termux/", Colors.teal, Icons.terminal),
            _buildDownloadButton("Termux:Boot", "https://f-droid.org/en/packages/com.termux.boot/", Colors.blue, Icons.restart_alt),
            _buildDownloadButton("Termux:API", "https://f-droid.org/en/packages/com.termux.api/", Colors.orange, Icons.settings_remote),
            _buildDownloadButton("Editor Acode", "https://play.google.com/store/apps/details?id=com.foxdebug.acodefree", Colors.indigo, Icons.code),
            _buildDownloadButton("GitHub App", "https://play.google.com/store/apps/details?id=com.github.android", Colors.redAccent, Icons.cloud),
            _sectionText("Instala, abre Termux, ejecuta tu primer script y despierta tu mente hacker."),
            _codeSnippet('''
# Bot básico en Termux con Python
import time

while True:
    print("Hola desde el núcleo")
    time.sleep(3)
'''),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
