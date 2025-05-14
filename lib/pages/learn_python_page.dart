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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Center(
              child: Column(
                children: [
                  FadeInDown(
                    child: FaIcon(FontAwesomeIcons.python, color: Colors.blueAccent, size: 80),
                  ),
                  const SizedBox(height: 12),
                  FadeIn(
                    delay: const Duration(milliseconds: 200),
                    child: const Text(
                      'Curso Profesional Python de Cero a Experto',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.group, color: Colors.white),
                    label: const Text('Estudiantes Activos: ¡Únete Ahora!', style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    ),
                    onPressed: _openAffiliate,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ¿Qué vas a lograr?
            Row(
              children: const [
                FaIcon(FontAwesomeIcons.bullseye, color: Colors.greenAccent),
                SizedBox(width: 10),
                Text(
                  '¿Qué vas a lograr?',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Aprenderás Python, el tercer lenguaje más usado en el mundo. Empresas de todos los sectores buscan desarrolladores expertos.',
              style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 20),

            // Instructor
            Row(
              children: const [
                FaIcon(FontAwesomeIcons.userTie, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Dictado por Brian De Vita',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Text(
              'Programador con 3+ años de experiencia. Ya formó a más de 38,000 alumnos.',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 30),

            // ¿Cómo lo vas a lograr?
            Row(
              children: const [
                FaIcon(FontAwesomeIcons.cogs, color: Colors.orangeAccent),
                SizedBox(width: 10),
                Text(
                  '¿Cómo lo vas a lograr?',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Estructura paso a paso en 19 módulos. Contenido práctico y ameno con ejemplos reales y scripts listos para usar.',
              style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 30),

            // Lo que aprenderás
            Row(
              children: const [
                FaIcon(FontAwesomeIcons.checkCircle, color: Colors.green),
                SizedBox(width: 10),
                Text(
                  'Lo que aprenderás',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const _Bullet(text: 'Conocerás la metodología de Python'),
            const _Bullet(text: 'Desarrollarás aplicaciones y scripts'),
            const _Bullet(text: 'Programación Orientada a Objetos (OOP)'),
            const _Bullet(text: 'Automatización avanzada y bots'),
            const _Bullet(text: 'Análisis de datos y web scraping'),
            const SizedBox(height: 30),

            // Módulos
            Row(
              children: const [
                FaIcon(FontAwesomeIcons.listUl, color: Colors.blueAccent),
                SizedBox(width: 10),
                Text(
                  'Módulos del Curso',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            for (var i = 1; i <= 19; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  '• Módulo $i',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
            const SizedBox(height: 30),

            // Precio y CTA
            Center(
              child: Card(
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  child: Column(
                    children: [
                      const Text(
                        'Aprovecha 55% de descuento hoy',
                        style: TextStyle(color: Colors.redAccent, fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(text: r'$220', style: TextStyle(color: Colors.white54, fontSize: 16, decoration: TextDecoration.lineThrough)),
                            TextSpan(text: '  '),
                            TextSpan(text: r'$100', style: TextStyle(color: Colors.greenAccent, fontSize: 28, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Código de cupón: 032016',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text('Comprar por \$100', style: TextStyle(fontSize: 16)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent[700],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                        ),
                        onPressed: _openAffiliate,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Testimonios
            Row(
              children: const [
                FaIcon(FontAwesomeIcons.quoteLeft, color: Colors.white70),
                SizedBox(width: 10),
                Text(
                  'Testimonios',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const _Testimonial(
              name: 'Roberto Espinosa',
              quote:
                  'Tengo 42 años y nunca pensé que podría programar. Ahora desarrollo mi propio sistema contable.',
            ),
            const _Testimonial(
              name: 'Daniel Lázaro',
              quote:
                  'Excelente capacitación con Brian; aprendí desde cero todo el lenguaje de programación.',
            ),
            const _Testimonial(
              name: 'Eduardo Balvueno',
              quote:
                  'Muy buenas explicaciones claras y fácil de entender; recomendado al 100%.',
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.greenAccent, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

class _Testimonial extends StatelessWidget {
  final String name;
  final String quote;
  const _Testimonial({required this.name, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"$quote"',
            style: const TextStyle(color: Colors.white70, fontStyle: FontStyle.italic, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
