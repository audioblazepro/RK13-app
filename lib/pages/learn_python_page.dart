import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LearnPythonPage extends StatelessWidget {
  const LearnPythonPage({super.key});

  Future<void> _abrirCurso() async {
    final uri = Uri.parse("https://www.learnpython.org/");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 100, color: Colors.redAccent),
            const SizedBox(height: 20),
            const Text(
              "¿Listo para convertirte en desarrollador Python?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Python es uno de los lenguajes más poderosos, versátiles y solicitados en el mundo de la programación. Desde desarrollo web hasta inteligencia artificial, todo comienza aquí.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.redAccent),
              ),
              child: const Text(
                "🧠 Aprende desde cero\n🚀 Aplica desde el primer día\n💼 Prepárate para trabajos reales\n📱 Compatible con Termux y móvil",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.greenAccent, fontSize: 16),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.play_circle_fill),
              label: const Text("Empezar a aprender"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: _abrirCurso,
            ),
            const SizedBox(height: 20),
            const Text(
              "Recurso recomendado: learnpython.org",
              style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
