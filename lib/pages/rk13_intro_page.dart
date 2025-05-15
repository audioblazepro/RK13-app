import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'learn_python_page.dart';
import 'donar_page.dart';

class Rk13IntroPage extends StatefulWidget {
  const Rk13IntroPage({super.key});

  @override
  State<Rk13IntroPage> createState() => _Rk13IntroPageState();
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

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('No se pudo abrir la URL: $url');
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
    return Stack(
      children: [
        Positioned.fill(child: _buildAnimatedOverlay()),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildBanner(),
                const SizedBox(height: 24),
                _buildSection(_buildTermuxSection()),
                const SizedBox(height: 24),
                _buildSection(_buildAIDASection()),
                const SizedBox(height: 24),
                _buildSection(_buildGallerySection()),
                const SizedBox(height: 24),
                _buildSection(_buildLearnButton()),
                const SizedBox(height: 24),
                _buildSection(_buildDonateButton()),
                const SizedBox(height: 24),
                _buildSection(_buildSocialRow()),
                const SizedBox(height: 40),
                _buildFooter(),
              ],
            ),
          ),
        ),
        if (_zoomImagePath != null) _buildZoomOverlay(),
      ],
    );
  }

  Widget _buildAnimatedOverlay() {
    return AnimatedBuilder(
      animation: _bgController,
      builder: (context, child) {
        final alpha = (_bgController.value * 0.15 + 0.05) * 255;
        return Container(color: Colors.redAccent.withAlpha(alpha.toInt()));
      },
    );
  }

  Widget _buildSection(Widget child) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }

  Widget _buildBanner() {
    final w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ElasticInDown(
          child: Image.asset(
            'assets/images/intro_banner.png',
            width: w,
            height: w * 0.4,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        Container(
          width: w,
          height: w * 0.4,
          color: const Color.fromRGBO(0, 0, 0, 0.5),
        ),
        Positioned(
          left: w * 0.05,
          top: w * 0.05,
          child: ZoomIn(
            child: Image.asset(
              'assets/images/rk13_logo.png',
              width: w * 0.15,
              height: w * 0.15,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTermuxSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'RK13-APP V-TC-13',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Transforma tu móvil en una terminal Linux avanzada. Instala paquetes, automatiza tareas y desarrolla scripts donde quieras.',
          style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.4),
        ),
      ],
    );
  }

  Widget _buildAIDASection() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.6),
        children: const [
          TextSpan(
            text:
                '🚨 Atención: Hábitos rígidos terminan hoy. Nuestro método te lleva a experto Python en Termux.',
          ),
          TextSpan(
            text:
                '\n\n🛠️ Interés: Aprende con ejemplos prácticos: APIs y automatización.',
          ),
          TextSpan(
            text:
                '\n\n🔥 Deseo: Crea herramientas que ahorran horas y ofrecen servicios profesionales.',
          ),
        ],
      ),
    );
  }

  Widget _buildGallerySection() {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (c, i) {
          final a = 'assets/images/termux${i + 1}.png';
          return GestureDetector(
            onTap: () => _openZoom(a),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                a,
                width: 120,
                height: 160,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLearnButton() {
    return Center(
      child: ElevatedButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LearnPythonPage()),
            ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Aprende Python Ahora',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildDonateButton() {
    return Center(
      child: ElevatedButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DonarPage()),
            ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Donar y Apoyar',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildSocialRow() {
    final items = [
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          items.map((item) {
            final url = item['url'] as String;
            return GestureDetector(
              onTap: () => _launchUrl(url),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
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
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Text(
        '© 2025 Rk13Termux - Todos los derechos reservados',
        style: TextStyle(color: Colors.white24, fontSize: 12),
      ),
    );
  }

  Widget _buildZoomOverlay() {
    return Positioned.fill(
      child: Material(
        color: Colors.black.withAlpha(200),
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
                  decoration: const BoxDecoration(
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
