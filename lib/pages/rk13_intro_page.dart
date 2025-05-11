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

  Widget _socialButton(String label, String url, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () => _launchUrl(url),
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("RK13 | INIT MODE"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset('assets/images/banner_hack.png', height: 180),
            const SizedBox(height: 20),
            const Text(
              "Bienvenido a RK13",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.redAccent),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Inspirado por leyendas como Kevin Mitnick, Adrian Lamo, Anonymous y Tsutomu Shimomura. RK13 no es solo una app: es un portal para explorar el hacking ético desde Android.",
              style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.4),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text("¿Qué es Termux?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.lightGreen)),
            const SizedBox(height: 10),
            const Text(
              "Termux es un emulador de terminal para Android que proporciona un entorno Linux completo. Permite ejecutar scripts, usar Git, compilar código y más.",
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text("¿Qué es Proot?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
            const SizedBox(height: 10),
            const Text(
              "Proot permite ejecutar distribuciones Linux completas dentro de Termux sin necesidad de root. Puedes correr Ubuntu, Kali Linux y Arch para tareas avanzadas de hacking, desarrollo o pruebas.",
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.redAccent),
              ),
              child: const Text(
                "Ejemplo: Instalar Kali Linux en Termux\n\n"
                "pkg update && pkg install proot-distro\n"
                "proot-distro install kali\n"
                "proot-distro login kali",
                style: TextStyle(fontFamily: 'monospace', color: Colors.greenAccent),
              ),
            ),
            const SizedBox(height: 30),
            const Text("Síguenos para más herramientas:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blueAccent)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                _socialButton("GitHub", "https://github.com/Rk13termux", Icons.code, Colors.deepPurple),
                _socialButton("Telegram", "https://t.me/rk13tools", Icons.send, Colors.blue),
                _socialButton("YouTube", "https://youtube.com/@rk13", Icons.ondemand_video, Colors.red),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
} 
