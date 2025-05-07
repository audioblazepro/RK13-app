import 'package:flutter/material.dart';

class TermuxCommandsPage extends StatelessWidget {
  const TermuxCommandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final comandos = [
      "pkg update && pkg upgrade",
      "pkg install git",
      "pkg install python",
      "termux-setup-storage",
      "pkg install curl",
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Comandos útiles para Termux",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          ...comandos.map((cmd) => Card(
                color: Colors.grey[900],
                child: ListTile(
                  title: Text(cmd, style: const TextStyle(color: Colors.greenAccent)),
                  trailing: const Icon(Icons.copy, color: Colors.redAccent),
                  onTap: () {
                    // Aquí podrías copiar al portapapeles
                  },
                ),
              )),
        ],
      ),
    );
  }
}
