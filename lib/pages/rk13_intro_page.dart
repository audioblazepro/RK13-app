import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'learn_python_page.dart';
import 'donar_page.dart';
import 'termux_install.dart';

class Rk13IntroPage extends StatefulWidget {
  const Rk13IntroPage({super.key});

  @override
  State<Rk13IntroPage> createState() => Rk13IntroPageState();
}

class Rk13IntroPageState extends State<Rk13IntroPage> {
  String? _zoomImagePath;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('No se pudo abrir la URL: $url');
    }
  }

  void _openZoom(String asset) => setState(() => _zoomImagePath = asset);
  void _closeZoom() => setState(() => _zoomImagePath = null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                _buildBanner(),
                const SizedBox(height: 24),
                _buildSection(child: _buildTermuxSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildAIDASection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildGallerySection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildTermuxExclusiveSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildTermuxInstallSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildPythonAIDASection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildCommandsSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildPackagesSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildVirtualenvSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildCronSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildGitIntegrationSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildSecurityToolsSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildSSHSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildShellCustomizationSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildPerformanceTipsSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildCommunityResourcesSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildLearnButton()),
                const SizedBox(height: 24),
                _buildSection(child: _buildQuotesSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildDonateSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildSocialRow()),
                const SizedBox(height: 40),
                _buildFooter(),
                const SizedBox(height: 20),
                if (_zoomImagePath != null) _buildZoomOverlay(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required Widget child}) {
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
            color: Color.fromARGB(255, 255, 0, 0),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '[ ADVERTENCIA ] Tu móvil está a punto de convertirse en una máquina de hackeo. '
          'Transforma tu dispositivo en una terminal Linux ultra-potente, capaz de ejecutar scripts, '
          'automatizar ataques y desplegar herramientas de pentesting. Con RK13, tendrás el poder '
          'de un laboratorio completo de hacking en tu bolsillo. Olvídate de las limitaciones - '
          'programa en Python, despliega servidores, ejecuta exploits y domina el arte del pentesting '
          'móvil. ¿Estás listo para unirte a la élite del hacking? El poder está en tus manos. 🔥⚡',
          style: TextStyle(
            color: Color.fromARGB(179, 255, 255, 255),
            fontSize: 16,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildAIDASection() {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.white, fontSize: 15, height: 1.6),
        children: [
          TextSpan(
            text:
                '🧠 El Poder de la Programación:\n'
                'Todo a tu alrededor es binario (0s y 1s). Tu smartphone, igual que un interruptor de luz: '
                'encendido (1) o apagado (0). Millones de estos switches crean la magia digital que usas cada día.',
          ),
          TextSpan(
            text:
                '\n\n💫 El Futuro es Cuántico:\n'
                'Mientras las computadoras actuales procesan bits, las cuánticas usarán qubits, '
                'resolviendo en segundos lo que hoy toma años. Imagina desbloquear todos los secretos '
                'de la naturaleza con algoritmos cuánticos.',
          ),
          TextSpan(
            text:
                '\n\n🎮 Programar es Como Jugar:\n'
                'Si puedes armar LEGO, puedes programar. Cada pieza es una instrucción: '
                '"si llueve (condición) → abre paraguas (acción)". Así de simple es dar órdenes '
                'a una computadora.',
          ),
          TextSpan(
            text:
                '\n\n⚡ Tu Superpoder:\n'
                'Imagina controlar luces, crear robots, automatizar tareas... '
                'Todo lo que puedas imaginar, puedes programarlo. El límite es tu creatividad. '
                '¿Listo para iniciar tu viaje hacia el futuro digital?',
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
          final asset = 'assets/images/termux${i + 1}.png';
          return GestureDetector(
            onTap: () => _openZoom(asset),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                asset,
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

  Widget _buildTermuxExclusiveSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '🚀 TERMUX: Tu Centro de Comando Móvil',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            '💼 Para Profesionales y Empresas:\n'
            '• Terminal Linux completa en tu bolsillo: ejecuta servidores, APIs y bases de datos.\n'
            '• Automatiza backups, monitoreo y despliegues desde cualquier lugar.\n'
            '• Integración con sistemas empresariales vía SSH y APIs.\n\n'
            '🛠️ Herramientas Potentes:\n'
            '• Gestiona servidores remotos desde la playa.\n'
            '• Programa en Python, Node.js, Ruby mientras viajas.\n'
            '• Ejecuta scripts de pentesting en tiempo real.\n'
            '• Analiza redes y sistemas desde tu smartphone.\n\n'
            '🎯 Casos de Uso:\n'
            '• DevOps: Monitoreo 24/7 de infraestructura.\n'
            '• SysAdmin: Respuesta rápida a incidentes.\n'
            '• Desarrollador: Coding desde cualquier lugar.\n'
            '• Seguridad: Auditorías on-the-go.',
            style: TextStyle(color: Colors.white, fontSize: 14, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _buildTermuxInstallSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          '¿Quieres instalar Termux?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        const Text(
          'Descarga la versión oficial desde F-Droid para comenzar tu viaje en el desarrollo móvil.',
          style: TextStyle(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TermuxInstallPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Instalar Ahora',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPythonAIDASection() {
    return const Text(
      '🚀 Python en tu móvil, sin instalaciones tediosas.\n\n'
      '🔍 Automatiza tareas, analiza datos y crea bots con líneas de código.\n\n'
      '💡 Materializa ideas y ofrece servicios desde Termux.\n\n'
      '🔥 Pulsa “Aprende Python Ahora” y convierte tu teléfono en tu mejor herramienta.',
      style: TextStyle(color: Colors.white, fontSize: 14, height: 1.6),
    );
  }

  Widget _buildCommandsSection() => _buildBox('Comandos Esenciales', [
    '- pkg install python',
    '- pkg install git',
    '- apt update && apt upgrade',
    '- ls, cd, mv, cp',
  ]);

  Widget _buildPackagesSection() => _buildBox('Paquetes Populares', [
    '- nmap',
    '- hydra',
    '- metasploit',
    '- termux-api',
  ]);

  Widget _buildVirtualenvSection() => _buildBox('Entornos Virtuales', [
    '- pip install virtualenv',
    '- virtualenv venv',
    '- source venv/bin/activate',
    '- deactivate',
  ]);

  Widget _buildCronSection() => _buildBox('Automatización con Cron', [
    '- crontab -e',
    '- 0 * * * * script.sh',
    '- :wq guardar y salir',
  ]);

  Widget _buildGitIntegrationSection() => _buildBox('Integración con Git', [
    '- git clone <url>',
    '- git add . && git commit',
    '- git push origin main',
    '- Configurar SSH',
  ]);

  Widget _buildSecurityToolsSection() =>
      _buildBox('Herramientas de Seguridad', [
        '- nmap -sV <IP>',
        '- hydra -l admin -P pass',
        '- sqlmap -u "<url>" --batch',
        '- msfconsole',
      ]);

  Widget _buildSSHSection() => _buildBox('Acceso Remoto / SSH', [
    '- pkg install openssh',
    '- sshd',
    '- ssh user@<IP>',
    '- ssh-copy-id user@<IP>',
  ]);

  Widget _buildShellCustomizationSection() =>
      _buildBox('Personalización del Shell', [
        '- pkg install zsh',
        '- pkg install oh-my-zsh',
        '- Configura ~/.zshrc',
        '- Agrega temas y plugins',
      ]);

  Widget _buildPerformanceTipsSection() => _buildBox('Tips de Rendimiento', [
    '- termux-wake-lock',
    '- Ajusta Governor',
    '- Cierra apps de fondo',
    '- Usa termux-api scripts',
  ]);

  Widget _buildCommunityResourcesSection() =>
      _buildBox('Comunidad & Recursos', [
        '- termux.com/community',
        '- reddit.com/r/termux',
        '- t.me/termuxgroup',
        '- github.com/termux',
      ]);

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

  Widget _buildDonateSection() {
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
    final items = <Map<String, dynamic>>[
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
    return const Center(
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
                    color: Color.fromARGB(255, 255, 0, 0),
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

  Widget _buildBox(String title, List<String> lines) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 255, 0, 0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          for (var l in lines)
            Text(l, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
