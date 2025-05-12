import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Rk13IntroPage extends StatelessWidget {
  const Rk13IntroPage({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint("No se pudo abrir la URL: $url");
    }
  }

  Widget _buildButton(String title, String url, Color color, IconData icon, {bool white = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: ElevatedButton.icon(
        onPressed: () => _launchUrl(url),
        icon: Icon(icon, color: white ? Colors.black : Colors.white),
        label: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: white ? Colors.black : Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: white ? Colors.white : color,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 6,
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
        color: Colors.black.withOpacity(0.7),
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
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(color: Colors.black.withOpacity(0.85)),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInDown(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Image.asset('assets/images/banner_hack.png', height: 140),
                  ),
                ),
                FadeIn(
                  child: Text(
                    'Bienvenido a RK13 - Potencia Hacking Total',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, color: Colors.redAccent.shade200, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 12),
                FadeIn(
                  duration: const Duration(milliseconds: 1100),
                  child: const Text(
                    '''Explora las herramientas que han definido generaciones de hackers. Desde análisis de red con Python hasta el control total de entornos Linux en Android.

Con RK13 y Termux, tu teléfono es más que un dispositivo. Es tu nuevo laboratorio.

Instala distribuciones completas, escanea redes, automatiza tareas, entrena IA... y todo desde tu bolsillo.
''',
                    style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.6),
                    textAlign: TextAlign.justify,
                  ),
                ),
                _codeBlock([
                  "pkg update && pkg upgrade -y",
                  "pkg install proot-distro -y",
                  "proot-distro install kali",
                  "proot-distro login kali",
                  "apt install python3 git nmap -y",
                ]),
                const SizedBox(height: 20),
                FadeInUp(
                  child: const Text(
                    'Preguntas que despiertan tu mente:',
                    style: TextStyle(color: Colors.redAccent, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '''¿Eres capaz de programar un bot que rastree patrones sospechosos en tiempo real?
¿Y si diseñas tu propia herramienta de explotación?
¿Qué tal simular un ataque DDoS en un entorno virtual?''',
                  style: TextStyle(color: Colors.white70, fontSize: 15, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                FadeIn(
                  duration: const Duration(milliseconds: 900),
                  child: const Text(
                    'Aprender Python es la llave maestra.',
                    style: TextStyle(fontSize: 18, color: Colors.amber, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                _codeBlock([
                  "import requests",
                  "response = requests.get('https://api.ipify.org')",
                  "print(\"Tu IP publica es:\", response.text)",
                ]),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    _buildButton("GitHub", "https://github.com/Rk13termux", Colors.white, FontAwesomeIcons.github, white: true),
                    _buildButton("Facebook", "https://facebook.com/Rk13termux", Color(0xFF1877F2), FontAwesomeIcons.facebook),
                    _buildButton("Instagram", "https://instagram.com/Rk13termux", Color(0xFFE4405F), FontAwesomeIcons.instagram),
                    _buildButton("Telegram", "https://t.me/Rk13termux", Colors.cyan, FontAwesomeIcons.telegram),
                    _buildButton("YouTube", "https://youtube.com/@rk13termux", Colors.redAccent, FontAwesomeIcons.youtube),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
