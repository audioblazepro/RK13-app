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

  Widget _buildSocialButton(String title, String url, Color color, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton.icon(
        onPressed: () => _launchUrl(url),
        icon: FaIcon(icon, color: Colors.white),
        label: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 4,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Banner Principal animado
            Stack(
              children: [
                Image.asset('assets/images/intro_background.gif', fit: BoxFit.cover, width: double.infinity, height: 240),
                Container(
                  width: double.infinity,
                  height: 240,
                  color: Colors.black.withOpacity(0.5),
                ),
                Positioned(
                  left: 16,
                  top: 40,
                  child: ElasticInDown(
                    child: Image.asset('assets/images/rk13_logo.png', width: 120),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Cualidades de Termux
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Termux convierte tu móvil en una poderosa terminal Linux. Ligero, rápido y abierto: instala cientos de repos y herramientas de hacking al instante.",
                style: TextStyle(color: Colors.white, fontSize: 16, height: 1.4),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            // Llamado a la acción AIDA para Python
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.grey[850], borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "!Atención: Python abre puertas ilimitadas. Interés: Automatiza tareas. Deseo: Crea soluciones innovadoras. Acción: Comienza hoy y domina programación!",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Galería de imágenes
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  for (int i = 1; i <= 10; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage('assets/images/termux$i.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Explicación extensa Python
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Imagínate creando scripts que lean redes sociales, analicen datos en tiempo real o incluso controlen robots con tu móvil. Python en Termux te permite diseñar desde chatbots inteligentes hasta sistemas de automatización avanzados, todo en un entorno ligero y portátil. Dominar Python abre puertas a carreras en ciberseguridad, análisis de datos y desarrollo de software, generando ingresos recurrentes y libertad profesional.",
                style: TextStyle(color: Colors.white, fontSize: 16, height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 24),
            // Botón aprender Python
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/learn_python'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent[700],
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                'Aprende Python Ahora',
                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 32),
            // Frases inspiradoras
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  Text(
                    '"El conocimiento es la mejor arma" - Chema Alonso',
                    style: TextStyle(color: Colors.white70, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    '"La mejor forma de predecir el futuro es crearlo" - Alan Kay',
                    style: TextStyle(color: Colors.white70, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Llamado a donar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "Apoya nuestro crecimiento: invierte en conocimiento y transforma el futuro, un commit a la vez.",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/donar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      'Donar y Apoyar',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Botones redes sociales
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildSocialButton('GitHub', 'https://github.com/Rk13termux', Colors.blue, FontAwesomeIcons.github),
                  _buildSocialButton('Instagram', 'https://instagram.com/Rk13termux', Color(0xFFE4405F), FontAwesomeIcons.instagram),
                  _buildSocialButton('Telegram', 'https://t.me/Rk13termux', Colors.cyan, FontAwesomeIcons.telegram),
                  _buildSocialButton('YouTube', 'https://youtube.com/@rk13termux', Colors.redAccent, FontAwesomeIcons.youtube),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
