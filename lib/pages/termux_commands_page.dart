import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TermuxCommandsPage extends StatelessWidget {
  const TermuxCommandsPage({super.key});

  final List<Map<String, String>> comandos = const [
    {
      "comando": "pkg update && pkg upgrade",
      "descripcion":
          "Actualiza la lista de paquetes e instala actualizaciones.",
    },
    {
      "comando": "pkg install git",
      "descripcion":
          "Instala Git para clonar repositorios desde GitHub u otras fuentes.",
    },
    {
      "comando": "termux-setup-storage",
      "descripcion":
          "Permite el acceso al almacenamiento interno del dispositivo.",
    },
    {
      "comando": "pkg install python",
      "descripcion": "Instala el lenguaje de programación Python.",
    },
    {
      "comando": "pkg install curl",
      "descripcion": "Permite hacer solicitudes HTTP desde la terminal.",
    },
    {
      "comando": "pkg install nano",
      "descripcion":
          "Instala el editor de texto Nano para editar archivos desde Termux.",
    },
    {
      "comando": "pkg install neofetch",
      "descripcion": "Muestra información del sistema de forma atractiva.",
    },
    {
      "comando": "pkg install wget",
      "descripcion":
          "Herramienta para descargar archivos desde internet vía terminal.",
    },
    {
      "comando": "pkg install openssh",
      "descripcion":
          "Instala herramientas SSH para conexiones seguras a servidores remotos.",
    },
    {
      "comando": "pkg install tsu",
      "descripcion": "Habilita acceso root (si tu dispositivo está rooteado).",
    },
  ];

  void copiarAlPortapapeles(BuildContext context, String comando) {
    Clipboard.setData(ClipboardData(text: comando));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("📋 Copiado: $comando")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: comandos.length,
        itemBuilder: (context, index) {
          final cmd = comandos[index];
          return Card(
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                cmd["comando"]!,
                style: const TextStyle(
                  color: Colors.greenAccent,
                  fontFamily: 'monospace',
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  cmd["descripcion"]!,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.copy, color: Colors.redAccent),
                onPressed: () => copiarAlPortapapeles(context, cmd["comando"]!),
              ),
            ),
          );
        },
      ),
    );
  }
}
