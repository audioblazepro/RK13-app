import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'learn_python_page.dart';
import 'donar_page.dart';

// Rk13IntroPage final v5 — static black background, embedded galleries, persuasive AIDA copy, linked pages

class Rk13IntroPage extends StatefulWidget {
  const Rk13IntroPage({Key? key}) : super(key: key);

  @override
  _Rk13IntroPageState createState() => _Rk13IntroPageState();
}

class _Rk13IntroPageState extends State<Rk13IntroPage> {
  String? _zoomImagePath;

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('No se pudo abrir: $url');
    }
  }

  void _openZoom(String asset) {
    setState(() => _zoomImagePath = asset);
  }

  void _closeZoom() {
    setState(() => _zoomImagePath = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  _buildBanner(),
                  const SizedBox(height: 24),
                  _buildTermuxSection(),
                  const SizedBox(height: 24),
                  _buildAIDASection(),
                  const SizedBox(height: 24),
                  _buildGallerySection(),
                  const SizedBox(height: 24),
                  _buildPythonSectionPart1(),
                  const SizedBox(height: 24),
                  _buildPythonSectionPart2(),
                  const SizedBox(height: 24),
                  _buildPythonSectionPart3(),
                  const SizedBox(height: 24),
                  _buildLearnButton(),
                  const SizedBox(height: 24),
                  _buildQuotesSection(),
                  const SizedBox(height: 24),
                  _buildDonateSection(),
                  const SizedBox(height: 24),
                  _buildSocialRow(),
                  const SizedBox(height: 40),
                  _buildFooter(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          if (_zoomImagePath != null) _buildZoomOverlay(),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/intro_background.gif',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
        ),
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.black.withOpacity(0.5),
        ),
        Positioned(
          left: 16,
          top: 16,
          child: Image.asset(
            'assets/images/rk13_logo.png',
            width: 80,
            height: 80,
          ),
        ),
      ],
    );
  }

  Widget _buildTermuxSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Termux + Python en Android',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Convierte tu teléfono en tu herramienta más poderosa. Instala, automatiza y crea scripts en cuestión de segundos.',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildAIDASection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.redAccent, width: 1.2),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            height: 1.6,
          ),
          children: <TextSpan>[
            const TextSpan(
              text:
                '🚨 Atención: ¿Te imaginas programar sin límites directamente desde tu móvil? Nuestro curso convierte tu dispositivo en un laboratorio creativo sin configuraciones complicadas.',
            ),
            const TextSpan(
              text:
                '\n\n🛠️ Interés: Accede a guías prácticas paso a paso para conectar APIs, extraer datos de sitios web y controlar sistemas remotos con Python. Domina librerías esenciales como Requests, BeautifulSoup y Paramiko.',
            ),
            const TextSpan(
              text:
                '\n\n🔥 Deseo: Siente la emoción de crear soluciones que automatizan tareas diarias y la libertad de ofrecer servicios de automatización profesional desde tu teléfono.',
            ),
            const TextSpan(
              text:
                '\n\n⚡ Acción: Pulsa "Aprende Python Ahora" y desbloquea acceso inmediato a todos los módulos. Comienza hoy tu viaje hacia el dominio de la programación móvil.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGallerySection() {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final path = 'assets/images/termux${i + 1}.png';
          return GestureDetector(
            onTap: () => _openZoom(path),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                path,
                fit: BoxFit.cover,
                width: 120,
                height: 140,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPythonSectionPart1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Python en Termux - Parte 1',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _buildGallerySection(),
        const SizedBox(height: 8),
        ...List.generate(
          5,
          (i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              '- Punto ${i + 1}: Introducción a Requests y consumo de APIs.',
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPythonSectionPart2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Python en Termux - Parte 2',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _buildGallerySection(),
        const SizedBox(height: 8),
        ...List.generate(
          5,
          (i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              '- Punto ${i + 6}: Scraping con BeautifulSoup y manejo de HTML.',
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPythonSectionPart3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Python en Termux - Parte 3',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _buildGallerySection(),
        const SizedBox(height: 8),
        ...List.generate(
          5,
          (i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              '- Punto ${i + 11}: Automatización SSH con Paramiko.',
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLearnButton() {
    return ElevatedButton(
      onPressed: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => const LearnPythonPage())),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text('Aprende Python Ahora', style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }

  Widget _buildQuotesSection() {
    return Column(
      children: const [
        Text(
          '"El conocimiento es la mejor arma" - Chema Alonso',
          style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic),
        ),
        SizedBox(height: 6),
        Text(
          '"La mejor forma de predecir el futuro es crearlo" - Alan Kay',
          style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _buildDonateSection() {
    return ElevatedButton(
      onPressed: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => const DonarPage())),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text('Donar y Apoyar', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildSocialRow() {
    final list = [
      {'icon': FontAwesomeIcons.github, 'url': 'https://github.com/Rk13termux'},
      {'icon': FontAwesomeIcons.instagram, 'url': 'https://instagram.com/Rk13termux'},
      {'icon': FontAwesomeIcons.telegram, 'url': 'https://t.me/Rk13termux'},
      {'icon': FontAwesomeIcons.youtube, 'url': 'https://youtube.com/@rk13termux'},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: list.map((item) {
        return GestureDetector(
          onTap: () => _launchUrl(item['url'] as String),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.redAccent, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: FaIcon(item['icon'] as IconData,
                  color: Colors.redAccent, size: 24),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Text(
        '© 2025 Rk13Termux',
        style: TextStyle(color: Colors.white24, fontSize: 12),
      ),
    );
  }

  Widget _buildZoomOverlay() {
    return Positioned.fill(
      child: Material(
        color: Colors.black.withOpacity(0.8),
        child: Stack(
          children: [
            Center(
              child: Image.asset(_zoomImagePath!, fit: BoxFit.contain),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                onTap: _closeZoom,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
