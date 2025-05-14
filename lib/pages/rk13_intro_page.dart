import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Main intro page with hacker-style animations and neon accents
class Rk13IntroPage extends StatefulWidget {
  const Rk13IntroPage({super.key});

  @override
  _Rk13IntroPageState createState() => _Rk13IntroPageState();
}

class _Rk13IntroPageState extends State<Rk13IntroPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Animation controller for looping neon glow
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Launch external URLs
  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint("No se pudo abrir la URL: \$url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Animated hacker background
          Positioned.fill(child: _buildAnimatedBackground()),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildBannerSection(),
                const SizedBox(height: 32),
                _buildFeaturesSection(),
                const SizedBox(height: 32),
                _buildAIDASection(),
                const SizedBox(height: 32),
                _buildGallerySection(),
                const SizedBox(height: 32),
                _buildPythonExplanation(),
                const SizedBox(height: 32),
                _buildLearnPythonButton(),
                const SizedBox(height: 48),
                _buildQuotesSection(),
                const SizedBox(height: 48),
                _buildDonateSection(),
                const SizedBox(height: 48),
                _buildSocialIconsRow(),
                const SizedBox(height: 64),
                _buildFooter(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Animated grid-like background with neon effect
  Widget _buildAnimatedBackground() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final glow = (_controller.value * 0.5) + 0.5;
        return CustomPaint(
          painter: _GridPainter(glow: glow),
        );
      },
    );
  }

  /// Top banner with logo and overlay
  Widget _buildBannerSection() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/intro_background.gif',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 260,
        ),
        Container(
          width: double.infinity,
          height: 260,
          color: Colors.black.withOpacity(0.7),
        ),
        Positioned(
          left: 24,
          top: 48,
          child: ElasticInDown(
            child: Image.asset(
              'assets/images/rk13_logo.png',
              width: 140,
              height: 140,
            ),
          ),
        ),
      ],
    );
  }

  /// Features section showcasing Termux + Python power
  Widget _buildFeaturesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          FadeIn(
            duration: const Duration(milliseconds: 1200),
            child: Text(
              "⚙️ Termux + Python = Poder Total",
              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 22,
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            child: Text(
              "Transforma tu dispositivo Android en una terminal Linux avanzada; instala paquetes, automatiza tareas y desarrolla scripts desde la palma de tu mano.",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              FeatureCard(
                icon: FontAwesomeIcons.terminal,
                title: 'Shell Terminal',
                description: 'Acceso completo a bash, zsh y más. Personaliza tu prompt.',
              ),
              FeatureCard(
                icon: FontAwesomeIcons.cogs,
                title: 'Automatización',
                description: 'Scripts en Python para scraping, bots y herramientas.',
              ),
              FeatureCard(
                icon: FontAwesomeIcons.lock,
                title: 'Ciberseguridad',
                description: 'Prueba herramientas de pentesting en tu Android.',
              ),
              FeatureCard(
                icon: FontAwesomeIcons.brain,
                title: 'Análisis de Datos',
                description: 'Usa pandas, numpy y matplotlib directo en Termux.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// AIDA call-to-action block
  Widget _buildAIDASection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.greenAccent, width: 1.5),
        ),
        child: ElasticInLeft(
          child: Text(
            "🚨 Atención: Abre Termux\n🛠️ Interés: Instala python-pip\n🔥 Deseo: Crea bots avanzados\n⚡ Acción: Empieza ahora y domina la terminal!",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              height: 1.6,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }

  /// Horizontal gallery of Termux screenshots
  Widget _buildGallerySection() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return FadeIn(
            duration: Duration(milliseconds: 1000 + (index * 100)),
            child: GalleryItem(
              imagePath: 'assets/images/termux\${index + 1}.png',
            ),
          );
        },
      ),
    );
  }

  /// Detailed Python explanation section
  Widget _buildPythonExplanation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ZoomIn(
        duration: const Duration(milliseconds: 1200),
        child: Column(
          children: const [
            Text(
              "Imagina desarrollar chatbots, analizar datos en vivo o controlar dispositivos IoT con Python en Termux", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 12),
            Text(NUITKA
              "Domina librerías como requests, BeautifulSoup, paramiko y crea desde scripts de automatización hasta herramientas de hacking ético.",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  /// Button to navigate to Python learning
  Widget _buildLearnPythonButton() {
    return ElasticIn(
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/learn_python'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent[700],
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 6,
        ),
        child: const Text(
          '💻 Aprende Python Ahora',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'monospace',
          ),
        ),
      ),
    );
  }

  /// Inspirational quotes section
  Widget _buildQuotesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          FadeInUp(
            child: Text(
              '"El conocimiento es la mejor arma" - Chema Alonso',
              style: TextStyle(
                color: Colors.greenAccent[100],
                fontStyle: FontStyle.italic,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              '"La mejor forma de predecir el futuro es crearlo" - Alan Kay',
              style: TextStyle(
                color: Colors.greenAccent[100],
                fontStyle: FontStyle.italic,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  /// Donation call-to-action
  Widget _buildDonateSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Bounce(
            child: Text(
              "Apoya nuestro crecimiento: invierte en conocimiento, un commit a la vez.",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            duration: const Duration(milliseconds: 800),
          ),
          const SizedBox(height: 16),
          ShakeX(
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/donar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 6,
              ),
              child: const Text(
                '🙏 Donar y Apoyar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            duration: const Duration(milliseconds: 1000),
          ),
        ],
      ),
    );
  }

  /// Row of square social icon buttons
  Widget _buildSocialIconsRow() {
    final items = [
      {'icon': FontAwesomeIcons.github, 'url': 'https://github.com/Rk13termux'},
      {'icon': FontAwesomeIcons.instagram, 'url': 'https://instagram.com/Rk13termux'},
      {'	icon': FontAwesomeIcons.telegram, 'url': 'https://t.me/Rk13termux'},
      {'icon': FontAwesomeIcons.youtube, 'url': 'https://youtube.com/@rk13termux'},
    ];
    return Wrap(
      spacing: 24,
      alignment: WrapAlignment.center,
      children: items.map((item) {
        return NeonSquareButton(
          icon: item['icon'] as IconData,
          onTap: () => _launchUrl(item['url'] as String),
        );
      }).toList(),
    );
  }

  /// Footer credits
  Widget _buildFooter() {
    return const Text(
      '© 2025 Rk13Termux - All Rights Reserved',
      style: TextStyle(
        color: Colors.white30,
        fontSize: 12,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Custom painter for grid background
typedef Glow = double;
class _GridPainter extends CustomPainter {
  final Glow glow;
  _GridPainter({required this.glow});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent.withOpacity(0.1)
      ..strokeWidth = 1;
    final step = 20.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
    // Outer neon glow
    final glowPaint = Paint()
      ..color = Colors.greenAccent.withOpacity(glow * 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawRect(Offset.zero & size, glowPaint);
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) {
    return oldDelegate.glow != glow;
  }
}

/// Card for feature display
class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ShakeX(
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.greenAccent, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, color: Colors.greenAccent, size: 36),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      duration: const Duration(milliseconds: 800),
    );
  }
}

/// Gallery item widget
typedef Path = String;
class GalleryItem extends StatelessWidget {
  final String imagePath;

  const GalleryItem({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.greenAccent, width: 1),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// Neon square button for social icons
class NeonSquareButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const NeonSquareButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  _NeonSquareButtonState createState() => _NeonSquareButtonState();
}

class _NeonSquareButtonState extends State<NeonSquareButton> with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: FadeIn(
        duration: const Duration(milliseconds: 800),
        child: AnimatedBuilder(
          animation: _animController,
          builder: (context, child) {
            final glow = (_animController.value * 0.5) + 0.5;
            return Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.greenAccent.withOpacity(glow), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withOpacity(glow * 0.7),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Center(
                child: FaIcon(
                  widget.icon,
                  color: Colors.greenAccent,
                  size: 28,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// End of rk13_intro_page.dart
