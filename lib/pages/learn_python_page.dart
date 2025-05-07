import 'package:flutter/material.dart';

class LearnPythonPage extends StatelessWidget {
  const LearnPythonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.code, color: Colors.orange, size: 80),
            const SizedBox(height: 20),
            const Text(
              "Aprende Python",
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Explora recursos, tutoriales y comandos para aprender Python desde Termux.",
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.open_in_new),
              label: const Text("Ver curso básico"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              onPressed: () {
                // Abre un enlace educativo si deseas agregarlo
              },
            ),
          ],
        ),
      ),
    );
  }
}
