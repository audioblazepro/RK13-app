import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

class Rk13IntroPage extends StatelessWidget {
  const Rk13IntroPage({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint("No se pudo abrir la URL: $url");
    }
  }

  Widget _buildButton(String title, String url, Color color, IconData icon) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: ElevatedButton.icon(
          onPressed: () => _launchUrl(url),
          icon: Icon(icon),
          label: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ),
    );
  }

  Widget _codeBlock(List<String> lines) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.greenAccent.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: lines
            .asMap()
            .entries
            .map(
              (entry) => RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${entry.key + 1}'.padLeft(2, '0') + '  ',
                      style: const TextStyle(color: Colors.grey, fontFamily: 'monospace'),
                    ),
                    TextSpan(
                      text: entry.value,
                      style: const TextStyle(color: Colors.greenAccent, fontFamily: 'monospace'),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInDown(
              child: Image.asset('assets/images/banner_hack.png', height: 160),
            ),
            const SizedBox(height: 20),
            FadeIn(
              child: Text(
                'Bienvenido a RK13 - Una experiencia de hacking única',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.redAccent.shade200, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            FadeIn(
              duration: const Duration(milliseconds: 1200),
              child: Text(
                '''¿Qué tienen en común Kevin Mitnick, Adrian Lamo y Gary McKinnon?

Todos comenzaron con una chispa de curiosidad. Una chispa que los llevó a romper barreras, desafiar sistemas y entender el lenguaje de las máquinas.

Termux es tu punto de entrada. Conviertes tu Android en una consola Linux.
¿Quieres más poder? Proot lo desbloquea todo: Kali Linux, Ubuntu, Arch.

Python es tu mejor arma. No solo por su poder, sino por su elegancia. Automatiza, analiza, ataca... crea.

''',
                style: const TextStyle(fontSize: 16, color: Colors.white70, height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ),
            _codeBlock([
              "pkg update -y && pkg upgrade -y",
              "pkg install proot-distro -y",
              "proot-distro install kali",
              "proot-distro login kali",
              "apt update && apt install python3 git -y",
            ]),
            const SizedBox(height: 10),
            FadeInUp(
              child: Text(
                '¿Te has preguntado alguna vez...?',
                style: TextStyle(color: Colors.redAccent.shade100, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '''
¿Qué pasaría si pudieras crear tu propio sistema operativo?
¿Y si escribieras una inteligencia artificial desde cero?
¿Podrías rastrear servidores ocultos en la dark web?
''',
              style: TextStyle(color: Colors.white70, fontSize: 15, fontStyle: FontStyle.italic),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 18),
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: _codeBlock([
                "import os",
                "",
                "def escanear():",
                "    os.system('nmap 192.168.0.1/24')",
                "",
                "escanear()",
              ]),
            ),
            const SizedBox(height: 12),
            _buildButton("GitHub", "https://github.com/Rk13termux", Colors.deepPurple, Icons.code),
            _buildButton("Telegram", "https://t.me/Rk13termux", Colors.cyan, Icons.telegram),
            _buildButton("YouTube", "https://youtube.com/@rk13termux", Colors.redAccent, Icons.ondemand_video),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
