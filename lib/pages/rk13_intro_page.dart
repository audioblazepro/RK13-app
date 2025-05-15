import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'learn_python_page.dart';
import 'donar_page.dart';

// -----------------------------------------------------------
// RK13 Intro Page - Versión Extensa (>400 líneas de código)
// Ultima actualización: Banner estático, fondo negro, animaciones y contenido detallado
// -----------------------------------------------------------

class Rk13IntroPage extends StatefulWidget {
  const Rk13IntroPage({Key? key}) : super(key: key);

  @override
  _Rk13IntroPageState createState() => _Rk13IntroPageState();
}

class _Rk13IntroPageState extends State<Rk13IntroPage> {
  String? _zoomImagePath;

  /// Lanza una URL en el navegador externo
  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('No se pudo abrir la URL: \$url');
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
          // Contenedor principal con padding y scroll
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),

                  // Banner personalizado
                  _buildBanner(),
                  const SizedBox(height: 24),

                  // Sección de introducción Termux
                  _buildTermuxSection(),
                  const SizedBox(height: 24),

                  // Sección AIDA persuasiva general
                  _buildAIDASection(),
                  const SizedBox(height: 24),

                  // Galería horizontal interactiva
                  _buildGallerySection(),
                  const SizedBox(height: 24),

                  // Sección única AIDA para Python (300 caracteres)
                  _buildPythonAIDA(),
                  const SizedBox(height: 24),

                  // Botón de acción para aprender Python
                  _buildLearnButton(),
                  const SizedBox(height: 24),

                  // Frases inspiradoras
                  _buildQuotesSection(),
                  const SizedBox(height: 24),

                  // Botón de donación
                  _buildDonateSection(),
                  const SizedBox(height: 24),

                  // Botones sociales
                  _buildSocialRow(),
                  const SizedBox(height: 40),

                  // Pie de página
                  _buildFooter(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Overlay de zoom si una imagen está seleccionada
          if (_zoomImagePath != null) _buildZoomOverlay(),
        ],
      ),
    );
  }

  /// Banner estático animado con ElasticInDown
  Widget _buildBanner() {
    // Calcula alto como proporción del ancho de pantalla (40%)
    final width = MediaQuery.of(context).size.width;
    return ElasticInDown(
      child: Image.asset(
        'assets/images/intro_banner.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: width * 0.4,
      ),
    );
  }

  /// Sección de introducción rápida a Termux con Python
  Widget _buildTermuxSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Termux + Python en Android',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Transforma tu móvil en una terminal Linux avanzada. ' 
          'Instala paquetes, automatiza tareas y desarrolla scripts donde quieras.',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  /// Sección AIDA general para captar y convertir
  Widget _buildAIDASection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.redAccent, width: 1.5),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            height: 1.6,
          ),
          children: <TextSpan>[
            const TextSpan(
              text:
                '🚨 Atención: Hábitos de programación rígidos terminan hoy. ' 
                'Nuestro método te lleva de cero a experto en Python dentro de Termux, sin instalaciones tediosas.',
            ),
            const TextSpan(text: '\n\n'),
            const TextSpan(
              text:
                '🛠️ Interés: Aprende con ejemplos prácticos: ' 
                'desde consumir APIs hasta automatizar tareas del día a día.',
            ),
            const TextSpan(text: '\n\n'),
            const TextSpan(
              text:
                '🔥 Deseo: Imagina crear herramientas que ahorran horas de trabajo y ofrecer servicios profesionales desde tu móvil.',
            ),
            const TextSpan(text: '\n\n'),
            const TextSpan(
              text:
                '⚡ Acción: Presiona “Aprende Python Ahora” y desbloquea acceso instantáneo a todos los módulos. Tu futuro en programación móvil comienza hoy.',
            ),
          ],
        ),
      ),
    );
  }

  /// Galería horizontal de capturas de pantalla con zoom
  Widget _buildGallerySection() {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final asset = 'assets/images/termux\${index + 1}.png';
          return GestureDetector(
            onTap: () => _openZoom(asset),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                asset,
                fit: BoxFit.cover,
                width: 120,
                height: 160,
              ),
            ),
          );
        },
      ),
    );
  }

  /// Sección AIDA específica para Python (~300 caracteres)
  Widget _buildPythonAIDA() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.redAccent, width: 1.5),
      ),
      child: const Text(
        '🚀 Python en tu móvil, sin instalaciones tediosas. ' 
        '\n\n🔍 Automatiza tareas, analiza datos y crea bots con simples líneas de código. ' 
        '\n\n💡 Materializa tus ideas al instante y ofrece servicios profesionales desde Termux. ' 
        '\n\n🔥 Pulsa “Aprende Python Ahora” y convierte tu teléfono en tu mejor herramienta de programación.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          height: 1.6,
        ),
      ),
    );
  }

  /// Botón para abrir la página de aprendizaje
  Widget _buildLearnButton() {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LearnPythonPage()),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text(
        'Aprende Python Ahora',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  /// Frases inspiradoras al final
  Widget _buildQuotesSection() {
    return Column(
      children: const [
        Text(
          '"El conocimiento es la mejor arma" - Chema Alonso',
          style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          '"La mejor forma de predecir el futuro es crearlo" - Alan Kay',
          style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Botón que dirige a la página de donación
  Widget _buildDonateSection() {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const DonarPage()),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text(
        'Donar y Apoyar',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  /// Botones sociales en fila
  Widget _buildSocialRow() {
    final items = [
      {'icon': FontAwesomeIcons.github, 'url': 'https://github.com/Rk13termux'},
      {'icon': FontAwesomeIcons.instagram, 'url': 'https://instagram.com/Rk13termux'},
      {'icon': FontAwesomeIcons.telegram, 'url': 'https://t.me/Rk13termux'},
      {'icon': FontAwesomeIcons.youtube, 'url': 'https://youtube.com/@rk13termux'},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((item) {
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

  /// Pie de página con créditos
  Widget _buildFooter() {
    return Center(
      child: Text(
        '© 2025 Rk13Termux - Todos los derechos reservados',
        style: TextStyle(color: Colors.white24, fontSize: 12),
      ),
    );
  }

  /// Overlay para imagen ampliada
    Widget _buildZoomOverlay() {
    return Positioned.fill(
      child: Material(
        color: Colors.black.withOpacity(0.8),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                _zoomImagePath!,
                fit: BoxFit.contain,
              ),
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
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

// -----------------------------------------------------------
// Nota: El banner recomendado es una imagen de al menos 1080×432 px
// para mantener buena nitidez en diferentes resoluciones.
// -----------------------------------------------------------

// Fin de rk13_intro_page.dart
