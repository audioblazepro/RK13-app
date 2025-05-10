import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HackerIntroPage extends StatelessWidget {
  const HackerIntroPage({super.key});

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
        label: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 6,
        ),
      ),
    );
  }

  Widget _codeSnippet(String code) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Text(
        code,
        style: const TextStyle(
          fontFamily: 'Courier',
          fontSize: 14,
          color: Colors.greenAccent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("INICIO | MUNDO HACKER"),
        backgroundColor: Colors.red[800],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Despierta tu mente hacker",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.redAccent),
            ),
            const SizedBox(height: 10),
            const Text(
              "Termux es más que una app, es la puerta de entrada a un universo donde tu celular se convierte en una terminal de poder. Como hacker moderno, tu primera herramienta es el conocimiento… y Python es el lenguaje de esa revolución.",
              style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),
            const Text(
              "¿Por qué Python?",
              style: TextStyle(fontSize: 18, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "Aprender a hablar con las máquinas es más fácil de lo que parece. Python es el idioma que entiende la inteligencia artificial, los scripts automatizados y la seguridad informática. Hablar es programar. Programar es crear.",
              style: TextStyle(color: Colors.white60, fontSize: 15),
            ),
            _codeSnippet('''
# Script básico en Python para automatizar una tarea
import os

def listar_directorios():
    os.system("ls")

listar_directorios()
'''),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.red[900],
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                "No necesitas experiencia. Solo curiosidad. Cada línea de código es una llave a un nuevo mundo. ¿Te atreves a construir el tuyo?",
                style: TextStyle(color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "INSTALACIÓN HACKER: Paso a paso",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.greenAccent),
            ),
            const SizedBox(height: 12),
            _buildDownloadButton("F-Droid (Repositorios libres)", "https://f-droid.org/", Colors.deepPurple, Icons.security),
            _buildDownloadButton("Termux (desde F-Droid)", "https://f-droid.org/en/packages/com.termux/", Colors.teal, Icons.terminal),
            _buildDownloadButton("Termux:Boot", "https://f-droid.org/en/packages/com.termux.boot/", Colors.blue, Icons.restart_alt),
            _buildDownloadButton("Termux:API", "https://f-droid.org/en/packages/com.termux.api/", Colors.orange, Icons.settings_remote),
            _buildDownloadButton("Editor de código Acode", "https://play.google.com/store/apps/details?id=com.foxdebug.acodefree", Colors.indigo, Icons.code),
            _buildDownloadButton("GitHub App", "https://play.google.com/store/apps/details?id=com.github.android", Colors.redAccent, Icons.cloud),
            const SizedBox(height: 20),
            const Text(
              "Una vez instalado Termux, abre tu primera terminal y ejecuta tu primer script. Desde ahí, el universo digital es tuyo.",
              style: TextStyle(color: Colors.white38, fontSize: 14, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            _codeSnippet('''
# Crear un bot en Python desde Termux
import time

while True:
    print("Hola desde Termux")
    time.sleep(3)
'''),
          ],
        ),
      ),
    );
  }
}
