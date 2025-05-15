import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'learn_python_page.dart';
import 'donar_page.dart';

// -----------------------------------------------------------
// RK13 Intro Page - Versión Extensa con Secciones Termux
// -----------------------------------------------------------

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

  void _openZoom(String asset) => setState(() => _zoomImagePath = asset);
  void _closeZoom() => setState(() => _zoomImagePath = null);

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
                  _buildPythonAIDA(),
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

  Widget _buildBanner() {
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

  Widget _buildTermuxSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Termux + Python en Android',
          style: TextStyle(color: Colors.redAccent, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Transforma tu móvil en una terminal Linux avanzada. Instala paquetes, automatiza tareas y desarrolla scripts donde quieras.',
          style: const TextStyle(color: Colors.white70, fontSize: 16, height: 1.4),
        ),
      ],
    );
  }

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
            const TextSpan(text: '🚨 Atención: Hábitos de programación rígidos terminan hoy...'),
            const TextSpan(text: '\n\n🛠️ Interés: Aprende con ejemplos prácticos...'),
            const TextSpan(text: '\n\n🔥 Deseo: Imagina crear herramientas que ahorran horas...'),
            const TextSpan(text: '\n\n⚡ Acción: Presiona “Aprende Python Ahora” y desbloquea acceso...'),
          ],
        ),
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
        itemBuilder: (context, index) {
          final asset = 'assets/images/termux\${index + 1}.png';
          return GestureDetector(
            onTap: () => _openZoom(asset),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(asset, fit: BoxFit.cover, width: 120, height: 160),
            ),
          );
        },
      ),
    );
  }

  /// AIDA específica de Python (~300 caracteres)
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
        '\n\n🔥 Pulsa “Aprende Python Ahora” y convierte tu teléfono en tu mejor herramienta.',
        style: TextStyle(color: Colors.white, fontSize: 14, height: 1.6),
      ),
    );
  }

  // --------------------------------------------
  // Secciones adicionales de Termux
  // --------------------------------------------

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
          Text('- pkg install python (Instala Python)', style: TextStyle(color: Colors.white)),
          Text('- pkg install git (Instala Git)', style: TextStyle(color: Colors.white)),
          Text('- apt update && apt upgrade (Actualiza paquetes)', style: TextStyle(color: Colors.white)),
          Text('- ls, cd, mv, cp (Comandos básicos de navegación)', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

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
          Text('- nmap (Exploración de redes)', style: TextStyle(color: Colors.white)),
          Text('- hydra (Ataques de fuerza bruta)', style: TextStyle(color: Colors.white)),
          Text('- metasploit (Framework de explotación)', style: TextStyle(color: Colors.white)),
          Text('- termux-api (Integración con Android)', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

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
          Text('- pip install virtualenv', style: TextStyle(color: Colors.white)),
          Text('- virtualenv venv', style: TextStyle(color: Colors.white)),
          Text('- source venv/bin/activate', style: TextStyle(color: Colors.white)),
          Text('- deactivate (Salir del entorno)', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

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
          Text('- crontab -e (Editar tareas)', style: TextStyle(color: Colors.white)),
          Text('- 0 * * * * python script.py (Cada hora)', style: TextStyle(color: Colors.white)),
          Text('- Guardar y salir para aplicar cambios', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

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
        Text('- git clone <repo_url>', style: TextStyle(color: Colors.white)),
        Text('- git add . && git commit -m "msg"', style: TextStyle(color: Colors.white)),
        Text('- git push origin main', style: TextStyle(color: Colors.white)),
        Text('- Configurar SSH para autenticación', style: TextStyle(color: Colors.white)),
      ]),
    );
  }

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
        Text('- nmap -sV <IP> (Escaneo de puertos)', style: TextStyle(color: Colors.white)),
        Text('- hydra -l admin -P passlist.txt ssh://<IP>', style: TextStyle(color: Colors.white)),
        Text('- sqlmap -u "<URL>" --batch', style: TextStyle(color: Colors.white)),
        Text('- msfconsole (Iniciar Metasploit)', style: TextStyle(color: Colors.white)),
      ]),
    );
  }

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
        Text('- pkg install openssh', style: TextStyle(color: Colors.white)),
        Text('- sshd (Iniciar servidor)', style: TextStyle(color: Colors.white)),
        Text('- ssh user@<IP> (Conexión remota)', style: TextStyle(color: Colors.white)),
        Text('- ssh-copy-id user@<IP> (Copiar llave pública)', style: TextStyle(color: Colors.white)),
      ]),
    );
  }

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
        Text('- pkg install zsh', style: TextStyle(color: Colors.white)),
        Text('- pkg install oh-my-zsh', style: TextStyle(color: Colors.white)),        Text('- Configura ~/.zshrc con alias útiles', style: TextStyle(color: Colors.white)),
        Text('- Agrega temas y plugins de tu preferencia', style: TextStyle(color: Colors.white)),
      ]),
    );
  }

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
        Text('- termux-wake-lock (Evita suspensión)', style: TextStyle(color: Colors.white)),
        Text('- Ajusta CPU Governor desde Android settings', style: TextStyle(color: Colors.white)),
        Text('- Usa termux-telephony-call para scripts', style: TextStyle(color: Colors.white)),
        Text('- Cierra apps en background para más RAM', style: TextStyle(color: Colors.white)),
      ]),
    );
  }

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
        Text('- Foro oficial: termux.com/community', style: TextStyle(color: Colors.white)),        Text('- Subreddit: reddit.com/r/termux', style: TextStyle(color: Colors.white)),
        Text('- Canal Telegram: t.me/termuxgroup', style: TextStyle(color: Colors.white)),
        Text('- Repos GitHub: github.com/termux', style: TextStyle(color: Colors.white)),
      ]),
    );
  }

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

  Widget _buildQuotesSection() {
    return Column(
      children: const [
        Text('"El conocimiento es la mejor arma" - Chema Alonso', style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic), textAlign: TextAlign.center),
        SizedBox(height: 8),
        Text('"La mejor forma de predecir el futuro es crearlo" - Alan Kay', style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic), textAlign: TextAlign.center),
      ],
    );
  }

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
            width: 50, height: 50,
            decoration: BoxDecoration(border: Border.all(color: Colors.redAccent, width: 2), borderRadius: BorderRadius.circular(8)),
            child: Center(child: FaIcon(item['icon'] as IconData, color: Colors.redAccent, size: 24)),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFooter() {
    return Center(child: Text('© 2025 Rk13Termux - Todos los derechos reservados', style: TextStyle(color: Colors.white24, fontSize: 12)));
  }

  Widget _buildZoomOverlay() {
    return Positioned.fill(child: Material(color: Colors.black.withOpacity(0.8), child: Stack(children: [
      Center(child: Image.asset(_zoomImagePath!, fit: BoxFit.contain)),
      Positioned(top: 40, right: 20, child: GestureDetector(onTap: _closeZoom, child: Container(width: 40, height: 40, decoration: BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle), child: const Icon(Icons.close, color: Colors.white))),
    ])));
  }
}

// -----------------------------------------------------------
// Nota: El banner recomendado es una imagen de al menos 1080×432 px
// -----------------------------------------------------------
