import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'learn_python_page.dart';
import 'donar_page.dart';

/// -----------------------------------------------------------
/// RK13 Intro Page - Versión Extensa con Secciones Termux
/// -----------------------------------------------------------
/// Asegúrate de declarar en pubspec.yaml:
/// 
/// flutter:
///   assets:
///     - assets/images/intro_banner.png
///     - assets/images/rk13_logo.png
///     - assets/images/termux1.png
///     - assets/images/termux2.png
///     - assets/images/termux3.png
///     - assets/images/termux4.png
///     - assets/images/termux5.png
///     - assets/images/termux6.png
///     - assets/images/termux7.png
///     - assets/images/termux8.png
///     - assets/images/termux9.png
///     - assets/images/termux10.png
/// -----------------------------------------------------------

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
                  _buildPythonAIDASection(),
                  const SizedBox(height: 24),
                  _buildCommandsSection(),
                  const SizedBox(height: 24),
                  _buildPackagesSection(),
                  const SizedBox(height: 24),
                  _buildVirtualenvSection(),
                  const SizedBox(height: 24),
                  _buildCronSection(),
                  const SizedBox(height: 24),
                  _buildGitIntegrationSection(),
                  const SizedBox(height: 24),
                  _buildSecurityToolsSection(),
                  const SizedBox(height: 24),
                  _buildSSHSection(),
                  const SizedBox(height: 24),
                  _buildShellCustomizationSection(),
                  const SizedBox(height: 24),
                  _buildPerformanceTipsSection(),
                  const SizedBox(height: 24),
                  _buildCommunityResourcesSection(),
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

  /// Banner estático con logo animado
  Widget _buildBanner() {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ElasticInDown(
          child: Image.asset(
            'assets/images/intro_banner.png',
            fit: BoxFit.cover,
            width: width,
            height: width * 0.4,
          ),
        ),
        Container(
          width: width,
          height: width * 0.4,
          color: Colors.black.withOpacity(0.5),
        ),
        Positioned(
          left: width * 0.05,
          top: width * 0.05,
          child: ElasticInDown(
            child: Image.asset(
              'assets/images/rk13_logo.png',
              width: width * 0.15,
              height: width * 0.15,
            ),
          ),
        ),
      ],
    );
  }

  /// Introducción Termux + Python
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

  /// Sección AIDA general
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
          style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.6),
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
                  '🔥 Deseo: Imagina crear herramientas que ahorran horas de trabajo '
                  'y ofrecer servicios profesionales desde tu móvil.',
            ),
            const TextSpan(text: '\n\n'),
            const TextSpan(
              text:
                  '⚡ Acción: Presiona “Aprende Python Ahora” y desbloquea acceso inmediato '
                  'a todos los módulos. Tu futuro en programación móvil comienza hoy.',
            ),
          ],
        ),
      ),
    );
  }

  /// Galería horizontal de capturas
  Widget _buildGallerySection() {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final asset = 'assets/images/termux${index + 1}.png';
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

  /// AIDA específica para Python (~300 caracteres)
  Widget _buildPythonAIDASection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.redAccent, width: 1.5),
      ),
      child: const Text(
        '🚀 Python en tu móvil, sin instalaciones tediosas.\n\n'
        '🔍 Automatiza tareas, analiza datos y crea bots con simples líneas de código.\n\n'
        '💡 Materializa tus ideas al instante y ofrece servicios profesionales desde Termux.\n\n'
        '🔥 Pulsa “Aprende Python Ahora” y convierte tu teléfono en tu mejor herramienta.',
        style: TextStyle(color: Colors.white, fontSize: 14, height: 1.6),
      ),
    );
  }

  /// Sección: Comandos Esenciales de Termux
  Widget _buildCommandsSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Comandos Esenciales', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text('- pkg install python   (Instala Python)', style: TextStyle(color: Colors.white)),
          Text('- pkg install git      (Instala Git)', style: TextStyle(color: Colors.white)),
          Text('- apt update & upgrade (Actualiza paquetes)', style: TextStyle(color: Colors.white)),
          Text('- ls, cd, mv, cp       (Navegación básica)', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  /// Sección: Paquetes Populares
  Widget _buildPackagesSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Paquetes Populares', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text('- nmap             (Exploración de redes)', style: TextStyle(color: Colors.white)),
          Text('- hydra            (Ataques de fuerza bruta)', style: TextStyle(color: Colors.white)),
          Text('- metasploit       (Framework de explotación)', style: TextStyle(color: Colors.white)),
          Text('- termux-api       (Integración con Android)', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  /// Sección: Entornos Virtuales
  Widget _buildVirtualenvSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Entornos Virtuales', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text('- pip install virtualenv', style: TextStyle(color: Colors.white)),
          Text('- virtualenv venv         ', style: TextStyle(color: Colors.white)),
          Text('- source venv/bin/activate', style: TextStyle(color: Colors.white)),
          Text('- deactivate              ', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  /// Sección: Automatización con Cron
  Widget _buildCronSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Automatización con Cron', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text('- crontab -e          (Editar tareas)', style: TextStyle(color: Colors.white)),
          Text('- 0 * * * * script.sh (Cada hora)', style: TextStyle(color: Colors.white)),
          Text('- :wq guardar y salir ', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  /// Sección: Integración con GitHub
  Widget _buildGitIntegrationSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text('Integración con Git', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
        SizedBox(height: 6),
        Text('- git clone <url>          ', style: TextStyle(color: Colors.white)),
        Text('- git add . && git commit ', style: TextStyle(color: Colors.white)),
        Text('- git push origin main    ', style: TextStyle(color: Colors.white)),
        Text('- Configurar SSH          ', style: TextStyle(color: Colors.white)),
      ]),
    );
  }

  /// Sección: Herramientas de Seguridad
  Widget _buildSecurityToolsSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text('Herramientas de Seguridad', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
        SizedBox(height: 6),
        Text('- nmap  -sV <IP>         ', style: TextStyle(color: Colors.white)),
        Text('- hydra -l admin -P pass ', style: TextStyle(color: Colors.white)),
        Text('- sqlmap -u "<url>" --batch', style: TextStyle(color: Colors.white)),
        Text('- msfconsole            ', style: TextStyle(color: Colors.white)),
      ]),
    );
  }

  /// Sección: Acceso Remoto / SSH
  Widget _buildSSHSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text('Acceso Remoto / SSH', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
        SizedBox(height: 6),
        Text('- pkg install openssh       ', style: TextStyle(color: Colors.white)),
        Text('- sshd                     ', style: TextStyle(color: Colors.white)),
        Text('- ssh user@<IP>            ', style: TextStyle(color: Colors.white)),
        Text('- ssh-copy-id user@<IP>    ', style: TextStyle(color: Colors.white)),
      ]),
    );
  }

  /// Sección: Personalización del Shell
  Widget _buildShellCustomizationSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text('Personalización del Shell', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
        SizedBox(height: 6),
        Text('- pkg install zsh           ', style: TextStyle(color: Colors.white)),
        Text('- pkg install oh-my-zsh     ', style: TextStyle(color: Colors.white)),
        Text('- Configura ~/.zshrc        ', style: TextStyle(color: Colors.white)),
        Text('- Agrega temas y plugins    ', style: TextStyle(color: Colors.white)),
      ]),
    );
  }

  /// Sección: Tips de Rendimiento y Batería
  Widget _buildPerformanceTipsSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text('Tips de Rendimiento', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
        SizedBox(height: 6),
        Text('- termux-wake-lock        ', style: TextStyle(color: Colors.white)),
        Text('- Ajusta Governor en Android', style: TextStyle(color: Colors.white)),
        Text('- Cierra apps de fondo    ', style: TextStyle(color: Colors.white)),
        Text('- Usa termux-api scripts  ', style: TextStyle(color: Colors.white)),
      ]),
    );
  }

  /// Sección: Comunidad y Recursos
  Widget _buildCommunityResourcesSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text('Comunidad & Recursos', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
        SizedBox(height: 6),
        Text('- Foro oficial: termux.com/community', style: TextStyle(color: Colors.white)),
        Text('- Subreddit: reddit.com/r/termux', style: TextStyle(color: Colors.white)),
        Text('- Telegram: t.me/termuxgroup', style: TextStyle(color: Colors.white)),
        Text('- GitHub: github.com/termux', style: TextStyle(color: Colors.white)),
      ]),
    );
  }

  /// Botón para abrir LearnPythonPage
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
      child: const Text('Aprende Python Ahora', style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }

  /// Frases inspiradoras
  Widget _buildQuotesSection() {
    return Column(
      children: const [
        Text('"El conocimiento es la mejor arma" - Chema Alonso', style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic), textAlign: TextAlign.center),
        SizedBox(height: 8),
        Text('"La mejor forma de predecir el futuro es crearlo" - Alan Kay', style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic), textAlign: TextAlign.center),
      ],
    );
  }

  /// Botón para abrir DonarPage
  Widget _buildDonateSection() {
    return ElevatedButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DonarPage())),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text('Donar y Apoyar', style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }

  /// Fila de iconos sociales
  Widget _buildSocialRow() {
    final items = [
      {'icon': FontAwesomeIcons.github,   'url': 'https://github.com/Rk13termux'},
      {'icon': FontAwesomeIcons.instagram,'url': 'https://instagram.com/Rk13termux'},
      {'icon': FontAwesomeIcons.telegram, 'url': 'https://t.me/Rk13termux'},
      {'icon': FontAwesomeIcons.youtube,  'url': 'https://youtube.com/@rk13termux'},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((item) {
        return GestureDetector(
          onTap: () => _launchUrl(item['url'] as String),
          child: Container(
            width: 50, height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.redAccent, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: FaIcon(item['icon'] as IconData, color: Colors.redAccent, size: 24),
            ),
          ),
        );
      }).toList(),
    );
  }

  /// Pie de página
  Widget _buildFooter() {
    return Center(child: Text('© 2025 Rk13Termux - Todos los derechos reservados', style: TextStyle(color: Colors.white24, fontSize: 12)));
  }

  /// Overlay para zoom de imagen
  Widget _buildZoomOverlay() {
    return Positioned.fill(
      child: Material(
        color: Colors.black.withOpacity(0.8),
        child: Stack(
          children: [
            Center(child: Image.asset(_zoomImagePath!, fit: BoxFit.contain)),
            Positioned(
              top: 40, right: 20,
              child: GestureDetector(
                onTap: _closeZoom,
                child: Container(  
                  width: 40, height: 40,
                  decoration: BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
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
