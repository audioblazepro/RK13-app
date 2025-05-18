import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'learn_python_page.dart';
import 'donar_page.dart';
import 'termux_install.dart';
import 'package:flutter/services.dart';

// ...resto de imports
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
                _buildSection(child: _buildPythonPackagesSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildPythonSecToolsSection()),
                const SizedBox(height: 24),
                _buildSection(child: _buildVirtualenvSection()),
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
          child: SizedBox(
            width: w,
            height: w * 0.45,
            child: Image.asset(
              'assets/images/intro_banner.png',
              width: w,
              height: w * 0.45,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        Positioned(
          left: w * 0.05, // Changed from right to left
          top: w * 0.15,
          child: ZoomIn(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/rk13_logo.png',
                width: w * 0.18,
                height: w * 0.18,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTermuxSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'RK13-APP V-TC-13',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 0, 0),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: '[ ADVERTENCIA ] ',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'Integración avanzada de subsistemas Linux en Android.\n\n'
                    'Características técnicas:\n'
                    '• Kernel Linux: Acceso directo a syscalls y API nativa\n'
                    '• Shell: Bash/ZSH con autocompletado y scripting\n'
                    '• Networking: Soporte TCP/IP, DNS, SSL/TLS\n'
                    '• Package Manager: APT con +1000 paquetes optimizados\n'
                    '• Runtime: Python3, Node.js, Ruby y más\n'
                    '• Storage: Acceso a filesystem Android y ext4\n'
                    '• Security: AppArmor profiles y SELinux policies\n\n'
                    'Capacidades:\n'
                    '• Pentesting: Nmap, Metasploit, Wireshark\n'
                    '• Development: Git, Docker, VSCode Server\n'
                    '• Automation: Cron, systemd, supervisord\n'
                    '• Cryptography: OpenSSL, GPG, hash tools\n\n'
                    '¿Preparado para el poder del computing móvil? 🔥⚡',
                style: const TextStyle(
                  color: Color.fromARGB(179, 255, 255, 255),
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAIDASection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '🚀 PROGRAMACIÓN: EL ARTE DE CREAR EL FUTURO',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 0, 0),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        RichText(
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
        ),
      ],
    );
  }

  Widget _buildGallerySection() {
    final ScrollController scrollController = ScrollController();

    // Auto-scroll animation with better timing
    void autoScroll() {
      if (!scrollController.hasClients) return;

      final double maxScroll = scrollController.position.maxScrollExtent;
      final double currentScroll = scrollController.offset;

      if (currentScroll >= maxScroll) {
        // Scroll back to start
        scrollController.animateTo(
          0,
          duration: const Duration(seconds: 30), // Slower scroll
          curve: Curves.easeInOut, // Smoother animation
        );
      } else {
        // Scroll to end
        scrollController.animateTo(
          maxScroll,
          duration: const Duration(seconds: 30), // Slower scroll
          curve: Curves.easeInOut, // Smoother animation
        );
      }
    }

    // Initialize auto-scroll with proper cleanup
    void startAutoScroll() {
      autoScroll();
      scrollController.addListener(() {
        if (scrollController.hasClients &&
            (scrollController.position.pixels ==
                    scrollController.position.maxScrollExtent ||
                scrollController.position.pixels == 0)) {
          Future.delayed(
            const Duration(seconds: 2),
            autoScroll,
          ); // Add pause between scrolls
        }
      });
    }

    // Start auto-scroll after build with proper error handling
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        startAutoScroll();
      } catch (e) {
        debugPrint('Error starting auto-scroll: $e');
      }
    });

    return SizedBox(
      height: 200,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(), // Add bounce effect
        itemCount: 10,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final asset = 'assets/images/termux${index + 1}.png';
          return GestureDetector(
            onTap: () => _openZoom(asset),
            child: Hero(
              tag: asset,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    asset,
                    width: 150,
                    height: 200,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '🚀 DOMINA PYTHON Y CONQUISTA LA ERA DE LA IA',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          '💰 Python: Tu Camino al Éxito Digital\n\n'
          '🤖 La IA genera código, pero ¿quién lo revisa y optimiza? Los desarrolladores Python ganan \$70-150k/año '
          'porque entienden la lógica real detrás del código.\n\n'
          '🔄 Freelancing desde tu móvil: Automatiza procesos, crea bots de trading, desarrolla APIs. '
          'Cobra por resolver problemas reales mientras otros siguen pegados a la oficina.\n\n'
          '🎯 La IA es tu asistente, Python tu lenguaje: Los equipos necesitan devs que sepan comunicar '
          'y traducir ideas a código limpio. La colaboración humana sigue siendo insuperable.\n\n'
          '⚡ Transforma ideas en ingresos: Crea tu primer script hoy, véndelo mañana. '
          'Python + Termux = Tu oficina móvil para ganar desde cualquier lugar.',
          style: TextStyle(color: Colors.white, fontSize: 14, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildPythonHackingSection() => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.black87,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(76),
          blurRadius: 8,
          spreadRadius: 2,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '🔥 DOMINA EL ARTE DEL HACKING CON PYTHON',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        // Virtual Environment Section
        _buildHackingSubSection(
          '🛡️ CONFIGURA TU LABORATORIO DE HACKING',
          [
            '⚡ Entorno Virtual Aislado y Seguro',
            '🔒 Dependencias Controladas y Versionadas',
            '🚀 Activación con un Solo Comando',
            '♻️ Fácil Reset y Reconfiguración',
          ],
          'assets/images/venv_setup.png',
        ),

        const SizedBox(height: 24),

        // Python Arsenal Section
        _buildHackingSubSection('⚔️ ARSENAL DE HERRAMIENTAS LETALES', [
          '🌐 Requests: Infiltración HTTP Silenciosa',
          '📡 Scapy: Forja Paquetes a Voluntad',
          '🕷️ BeautifulSoup4: Web Scraping Invisible',
          '🔑 Paramiko: Control SSH Total',
          '🔐 PyCryptodome: Cifrado Militar',
          '🎯 Shodan: Reconocimiento Global',
        ], 'assets/images/hacking_tools.png'),

        const SizedBox(height: 24),

        // Security Tools Section
        _buildHackingSubSection('�️ HERRAMIENTAS DE ÉLITE', [
          '🔍 theHarvester: OSINT Avanzado',
          '🌍 Impacket: Dominio de Protocolos',
          '🤖 Mechanize: Automatización Sigilosa',
          '📡 DNSPython: Reconocimiento DNS',
          '🔒 Cryptography: Arsenal Criptográfico',
          '🎯 Python-Nmap: Escaneo Profesional',
        ], 'assets/images/security_tools.png'),
      ],
    ),
  );

  Widget _buildHackingSubSection(
    String title,
    List<String> features,
    String imagePath,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...features.map(
          (feature) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              feature,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ],
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
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.redAccent.withAlpha(25), // Fixed deprecated withOpacity
            Colors.black,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.redAccent.withAlpha(76), // Fixed deprecated withOpacity
        ),
      ),
      child: Column(
        children: [
          const Text(
            "💡 ¿Sabías que...",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          // Removed const from Text with string interpolation
          Text(
            "Con solo \$1 USD ayudas a mantener vivo este proyecto?\n"
            "Tu donación = Más herramientas gratis para la comunidad.",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "☕ Es menos que un café,\n"
            "🚀 pero impulsa miles de desarrolladores",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
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
            icon: const Icon(Icons.favorite, color: Colors.white),
            // Removed const from Text with string interpolation
            label: Text(
              'Donar \$1 USD',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "🔒 100% Seguro • ⚡ Simple y Rápido",
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ],
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
        color: Colors.black.withOpacity(0.9),
        child: Stack(
          fit: StackFit.expand, // Added to ensure full screen coverage
          children: [
            // Centered image with proper sizing
            Center(
              child: Hero(
                tag: _zoomImagePath!,
                child: Image.asset(
                  _zoomImagePath!,
                  fit: BoxFit.contain,
                  width:
                      MediaQuery.of(context).size.width *
                      0.9, // 90% of screen width
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            // Close button
            Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                onTap: _closeZoom,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: _closeZoom,
                  ),
                ),
              ),
            ),
            // Tap anywhere to close
            Positioned.fill(
              child: GestureDetector(
                onTap: _closeZoom,
                behavior: HitTestBehavior.translucent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBoxWithCode(String title, List<String> items, String code) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 255, 0, 0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
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
                ...items.map(
                  (l) => Text(l, style: const TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black87,
              border: Border(
                top: BorderSide(
                  color: const Color.fromARGB(255, 255, 0, 0).withOpacity(0.3),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '📝 Ejemplo:',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy, color: Colors.white54),
                      onPressed:
                          () => Clipboard.setData(ClipboardData(text: code)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  code,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 255, 0),
                    fontFamily: 'monospace',
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
