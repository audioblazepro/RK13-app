import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Rk13IntroPage extends StatelessWidget {
  const Rk13IntroPage({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint("No se pudo abrir la URL: \$url");
    }
  }

  Widget _buildDownloadButton(String title, String url, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton.icon(
        onPressed: () => _launchUrl(url),
        icon: const Icon(Icons.download),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Bienvenido a RK13")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "¿Listo para comenzar el viaje?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.redAccent),
            ),
            const SizedBox(height: 12),
            const Text(
              "RK13 es una herramienta pensada para quienes desean adentrarse en el mundo del hacking ético, la automatización y la programación. Termux es tu puerta de entrada. Es una terminal potente que transforma tu teléfono Android en una auténtica máquina de desarrollo Linux.",
              style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            const Text(
              "¿Por qué aprender Python?",
              style: TextStyle(fontSize: 18, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Python es el lenguaje favorito de los hackers y desarrolladores. Su simplicidad, poder y versatilidad lo hacen ideal para scripts de automatización, análisis de datos, seguridad informática y más. Imagina crear tus propias herramientas, automatizar procesos o analizar redes desde tu móvil. Todo es posible si aprendes a programar.",
              style: TextStyle(color: Colors.white60, fontSize: 15, height: 1.5),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "No necesitas ser un experto. Solo curiosidad. Lo que aprendas hoy puede cambiar tu mundo mañana. ¿Te atreves a mirar más allá del sistema?",
                style: TextStyle(color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Cómo instalar Termux correctamente:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.greenAccent),
            ),
            const SizedBox(height: 12),
            _buildDownloadButton("Descargar F-Droid", "https://f-droid.org/", Colors.deepPurple),
            _buildDownloadButton("Descargar Termux (F-Droid)", "https://f-droid.org/en/packages/com.termux/", Colors.teal),
            _buildDownloadButton("Termux:Boot", "https://f-droid.org/en/packages/com.termux.boot/", Colors.blue),
            _buildDownloadButton("Termux:API", "https://f-droid.org/en/packages/com.termux.api/", Colors.orange),
            _buildDownloadButton("Acode (Editor de Código)", "https://play.google.com/store/apps/details?id=com.foxdebug.acodefree", Colors.indigo),
            _buildDownloadButton("App GitHub", "https://play.google.com/store/apps/details?id=com.github.android", Colors.redAccent),
            const SizedBox(height: 20),
            const Text(
              "Después de instalar Termux, regresa aquí y comienza a instalar tus repositorios favoritos con RK13.",
              style: TextStyle(color: Colors.white38, fontSize: 14, fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
