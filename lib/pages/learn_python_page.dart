import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LearnPythonPage extends StatelessWidget {
  const LearnPythonPage({super.key});

  Future<void> _openAffiliate() async {
    final uri = Uri.parse('https://www.hotmart.com/affiliate/course/python-pro?aff=TU_ID');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Curso Pro de Python'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Banner animado
            FadeInDown(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/python_banner.gif',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Título y descripción corta
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: const Text(
                'Conviértete en un experto en Python',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: const Text(
                'Domina desde lo básico hasta la automatización avanzada en Termux y más.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Características del curso
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: const [
                _Feature(icon: FontAwesomeIcons.terminal, text: 'Termux Integration'),
                _Feature(icon: FontAwesomeIcons.robot, text: 'Bots & Automation'),
                _Feature(icon: FontAwesomeIcons.database, text: 'Data Analysis'),
                _Feature(icon: FontAwesomeIcons.cloud, text: 'Web Scraping'),
                _Feature(icon: FontAwesomeIcons.laptopCode, text: 'Dev Tools'),
              ],
            ),
            const SizedBox(height: 24),
            // Precio y CTA
            Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: Column(
                  children: [
                    const Text(
                      'Oferta Especial',
                      style: TextStyle(color: Colors.redAccent, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '\\$500',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          TextSpan(text: '  '),
                          TextSpan(
                            text: '\\$400',
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _openAffiliate,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent[700],
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text(
                        'Comprar Curso por \$400',
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Testimonial breve
            FadeIn(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '"Este curso me llevó de novato a freelance en 4 semanas." - Juan P.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Botón volver
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_back, color: Colors.white70),
              label: const Text('Volver', style: TextStyle(color: Colors.white70)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white70),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  final IconData icon;
  final String text;
  const _Feature({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        children: [
          FaIcon(icon, color: Colors.redAccent, size: 28),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
