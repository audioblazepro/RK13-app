import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Rk13IntroPage final — Complete corrected code

class Rk13IntroPage extends StatefulWidget {
  const Rk13IntroPage({Key? key}) : super(key: key);

  @override
  _Rk13IntroPageState createState() => _Rk13IntroPageState();
}

class _Rk13IntroPageState extends State<Rk13IntroPage> with SingleTickerProviderStateMixin {
  late AnimationController _bgController;
  String? _zoomImagePath;

  @override
  void initState() {
    super.initState();
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _bgController.dispose();
    super.dispose();
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('No se pudo abrir: \$url');
    }
  }

  void _openZoom(String asset) {
    setState(() {
      _zoomImagePath = asset;
    });
  }

  void _closeZoom() {
    setState(() {
      _zoomImagePath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(child: _buildAnimatedOverlay()),
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

  Widget _buildAnimatedOverlay() {
    return AnimatedBuilder(
      animation: _bgController,
      builder: (context, child) {
        final alpha = (_bgController.value * 0.2 + 0.1) * 255;
        return Container(
          color: Colors.redAccent.withAlpha(alpha.toInt()),
        );
      },
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
          child: ElasticInDown(
            child: Image.asset('assets/images/rk13_logo.png', width: 80, height: 80),
          ),
        ),
      ],
    );
  }

  Widget _buildTermuxSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInUp(
          child: Text(
            'Termux + Python on Android',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 8),
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: Text(
            '''Convierte tu móvil en una terminal Linux.
Ligero, rápido y potente: automatiza, hackea y desarrolla.''',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 1.4,
            ),
            textAlign: TextAlign.left,
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
      child: ElasticInLeft(
        child: Text(
          '''🚨 Atención: Instalación fácil en Termux
🛠️ Interés: Python, scripts, bots
🔥 Deseo: Automatiza tus tareas
⚡ Acción: ¡Empieza ahora!''',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            height: 1.6,
          ),
          textAlign: TextAlign.left,
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
          final path = 'assets/images/termux\${i+1}.png';
          return GestureDetector(
            onTap: () => _openZoom(path),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(path, fit: BoxFit.cover, width: 120, height: 140),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPythonSectionPart1() {
    return ZoomIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Python en Termux - Parte 1',
            style: TextStyle(color: Colors.redAccent, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...List.generate(
            5,
            (i) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                '- Contenido detallado punto \${i+1}: explicación extendida y ejemplos de uso de requests.',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPythonSectionPart2() {
    return ZoomIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Python en Termux - Parte 2',
            style: TextStyle(color: Colors.redAccent, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...List.generate(
            5,
            (i) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                '- Contenido detallado punto \${i+6}: tutorial sobre uso de BeautifulSoup y parsing HTML.',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPythonSectionPart3() {
    return ZoomIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Python en Termux - Parte 3',
            style: TextStyle(color: Colors.redAccent, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...List.generate(
            10,
            (i) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                '- Contenido detallado punto \${i+11}: ejemplo de automatización con paramiko.',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearnButton() {
    return Bounce(
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/learn_python'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text('Aprende Python Ahora', style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }

  Widget _buildQuotesSection() {
    return Column(
      children: const [
        Text('"El conocimiento es la mejor arma" - Chema Alonso', style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic)),
        SizedBox(height: 6),
        Text('"La mejor forma de predecir el futuro es crearlo" - Alan Kay', style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic)),
      ],
    );
  }

  Widget _buildDonateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Apoya el proyecto con tu donación', style: TextStyle(color: Colors.white, fontSize: 14)),
        const SizedBox(height: 8),
        ShakeX(
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/donar'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            child: const Text('Donar y Apoyar', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
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
            child: Center(child: FaIcon(item['icon'] as IconData, color: Colors.redAccent, size: 24)),
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
