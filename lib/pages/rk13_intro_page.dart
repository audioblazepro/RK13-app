import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'learn_python_page.dart';
import 'donar_page.dart';

class Rk13IntroPage extends StatefulWidget {
  const Rk13IntroPage({Key? key}) : super(key: key);

  @override
  _Rk13IntroPageState createState() => _Rk13IntroPageState();
}

class _Rk13IntroPageState extends State<Rk13IntroPage>
    with SingleTickerProviderStateMixin {
  String? _zoomImagePath;
  late final AnimationController _bgController;

  @override
  void initState() {
    super.initState();
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _bgController.dispose();
    super.dispose();
  }

  /// Lanza una URL en el navegador externo
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('No se pudo abrir la URL: $url');
    }
  }

  /// Abre vista ampliada de imagen de galería
  void _openZoom(String asset) {
    setState(() {
      _zoomImagePath = asset;
    });
  }

  /// Cierra vista ampliada de imagen
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
                  _buildTermuxExclusiveSection(),
                  const SizedBox(height: 24),
                  _buildPythonSection(),
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

  // Background red pulse overlay
  Widget _buildAnimatedOverlay() {
    return AnimatedBuilder(
      animation: _bgController,
      builder: (context, child) {
        final alpha = (_bgController.value * 0.2 + 0.1) * 255;
        return Container(color: Colors.redAccent.withAlpha(alpha.toInt()));
      },
    );
  }

  // Top banner with crisp GIF and smaller logo
  Widget _buildBanner() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/intro_background.gif',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
          filterQuality: FilterQuality.high,
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
            child: Image.asset(
              'assets/images/rk13_logo.png',
              width: 100,
              height: 100,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ],
    );
  }

  // TERMUX section
  Widget _buildTermuxSection() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInUp(
            child: const Text(
              'Termux + Python on Android',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: const Text(
              'Convierte tu móvil en una terminal Linux. Ligero, rápido y potente: automatiza, hackea y desarrolla.',
              style: TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  // AIDA
  Widget _buildAIDASection() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(12),
      child: ElasticInLeft(
        child: const Text(
          '🚨 Atención: Instalación fácil en Termux\n🛠️ Interés: Python, scripts, bots\n🔥 Deseo: Automatiza tus tareas\n⚡ Acción: ¡Empieza ahora!',
          style: TextStyle(color: Colors.white, fontSize: 14, height: 1.6),
        ),
      ),
    );
  }

  // Gallery with zoom
  Widget _buildGallerySection() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 140,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
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
                  filterQuality: FilterQuality.high,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Exclusive Termux section
  Widget _buildTermuxExclusiveSection() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '¿Qué es Termux? Qué puedes hacer y quién lo utiliza',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '• Termux es un emulador de terminal Linux para Android, usado por desarrolladores, pentesters y entusiastas del código abierto.\n'
            '• Automatiza tareas con scripts, analiza redes, y despliega herramientas de seguridad.\n'
            '• Ejemplo: con \`ssh user@192.168.1.10\` conecta tu móvil a una máquina Kali Linux en PCI.\n'
            '• Poder completo: desde Python hasta Ansible, todo desde tu APK RK13.',
            style: TextStyle(color: Colors.white, fontSize: 14, height: 1.6),
          ),
        ],
      ),
    );
  }

  // Python detailed section
  Widget _buildPythonSection() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(12),
      child: ZoomIn(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                '- Idea ${index + 1}: usa requests para APIs en Termux',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Learn Python button
  Widget _buildLearnButton() {
    return Bounce(
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/learn_python'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          'Aprende Python Ahora',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  // Quotes
  Widget _buildQuotesSection() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: const [
          Text(
            '"El conocimiento es la mejor arma" - Chema Alonso',
            style: TextStyle(
              color: Colors.white54,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 6),
          Text(
            '"La mejor forma de predecir el futuro es crearlo" - Alan Kay',
            style: TextStyle(
              color: Colors.white54,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Donate
  Widget _buildDonateSection() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Apoya el proyecto con tu donación',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          ShakeX(
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/donar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Donar y Apoyar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Social row
  Widget _buildSocialRow() {
    final list = [
      {'icon': FontAwesomeIcons.github, 'url': 'https://github.com/Rk13termux'},
      {
        'icon': FontAwesomeIcons.instagram,
        'url': 'https://instagram.com/Rk13termux',
      },
      {'icon': FontAwesomeIcons.telegram, 'url': 'https://t.me/Rk13termux'},
      {
        'icon': FontAwesomeIcons.youtube,
        'url': 'https://youtube.com/@rk13termux',
      },
    ];
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            list.map((item) {
              return GestureDetector(
                onTap: () => _launchUrl(item['url'] as String),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.redAccent, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: FaIcon(
                      item['icon'] as IconData,
                      color: Colors.redAccent,
                      size: 24,
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  // Footer
  Widget _buildFooter() {
    return Center(
      child: Text(
        '© 2025 Rk13Termux',
        style: TextStyle(color: Colors.white24, fontSize: 12),
      ),
    );
  }

  // Zoom overlay
  Widget _buildZoomOverlay() {
    return Positioned.fill(
      child: Material(
        color: Colors.black.withOpacity(0.8),
        child: Stack(
          children: [
            Center(child: Image.asset(_zoomImagePath!, fit: BoxFit.contain)),
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
