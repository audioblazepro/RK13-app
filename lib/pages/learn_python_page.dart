import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LearnPythonPage extends StatelessWidget {
  const LearnPythonPage({super.key});

  Future<void> _openAffiliate() async {
    final uri = Uri.parse('https://go.hotmart.com/F99702791W?ap=7ba0');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openTelegram() async {
    final uri = Uri.parse('https://t.me/Rk13termux');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Curso Profesional Python'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Center(
              child: Column(
                children: [
                  FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    child: FaIcon(FontAwesomeIcons.python, color: Colors.blueAccent, size: 80),
                  ),
                  const SizedBox(height: 12),
                  FadeIn(
                    child: const Text(
                      'Curso Profesional Python de Cero a Experto',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: ElevatedButton.icon(
                      onPressed: _openTelegram,
                      icon: const FaIcon(FontAwesomeIcons.telegram, color: Colors.white),
                      label: const Text('Únete al Canal Privado', style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0088cc),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Detailed Persuasive Copy
            FadeInUp(
              child: const Text(
                'Imagina automatizar tareas en tu móvil, desarrollar aplicaciones de escritorio y crear GUIs profesionales usando solo Python. Este curso de 19 módulos te lleva de la instalación de Termux a la creación de herramientas de hacking ético, bots y análisis de datos.',
                style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 20),

            // Modules Section
            const Text(
              'Módulos del Curso',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // ExpansionTiles for each module...
            _ModuleTile(
              title: '1. Introducción',
              icon: FontAwesomeIcons.play,
              description: 'Presentación, descarga de Python y canal de Telegram.',
              items: const ['Presentación y bienvenida', 'Descargando Python', 'Únete al canal de Telegram'],
            ),
            _ModuleTile(
              title: '2. Primeros Pasos',
              icon: FontAwesomeIcons.robot,
              description: 'Configura tu entorno, explora números, texto y listas.',
              items: const ['Introducción a Python', 'Números I & II', 'Textos, slicing', 'Listas y entrada', 'Instala VS Code', 'Ejercicios'],
            ),
            _ModuleTile(
              title: '3. Operadores y Expresiones',
              icon: FontAwesomeIcons.calculator,
              description: 'Lógica booleana y aritmética para scripts avanzados.',
              items: const ['Operadores lógicos', 'Relacionales', 'Asignación', 'Ejercicios'],
            ),
            _ModuleTile(
              title: '4. Control de Flujo',
              icon: FontAwesomeIcons.exchangeAlt,
              description: 'Condicionales y bucles para decisiones y automatizaciones.',
              items: const ['Sentencia if', 'Bucles while/for', 'Ejercicios'],
            ),
            _ModuleTile(
              title: '5. Colecciones',
              icon: FontAwesomeIcons.thList,
              description: 'Listas, tuplas, diccionarios y estructuras de datos.',
              items: const ['Tuplas', 'Conjuntos', 'Diccionarios', 'Colas y pilas'],
            ),
            _ModuleTile(
              title: '6. Scripts',
              icon: FontAwesomeIcons.fileCode,
              description: 'Gestión de archivos y automatización de procesos.',
              items: const ['Entrada/Salida', 'Scripts ejecutables'],
            ),
            _ModuleTile(
              title: '7. Funciones',
              icon: FontAwesomeIcons.code,
              description: 'Modularidad y reutilización con funciones.',
              items: const ['Declarar/retornar', 'Argumentos', 'Funciones avanzadas'],
            ),
            _ModuleTile(
              title: '8. Errores y Excepciones',
              icon: FontAwesomeIcons.exclamationTriangle,
              description: 'Manejo de excepciones para robustez.',
              items: const ['try/catch', 'Errores múltiples'],
            ),
            _ModuleTile(
              title: '9. POO',
              icon: FontAwesomeIcons.objectGroup,
              description: 'Clases, objetos, herencia y polimorfismo.',
              items: const ['Clases y objetos', 'Herencia', 'Polimorfismo'],
            ),
            _ModuleTile(
              title: '10. Módulos y Paquetes',
              icon: FontAwesomeIcons.box,
              description: 'Organiza y distribuye tu código.',
              items: const ['Módulos', 'Paquetes'],
            ),
            _ModuleTile(
              title: '11. Ficheros',
              icon: FontAwesomeIcons.folderOpen,
              description: 'Lectura, escritura y serialización Pickle.',
              items: const ['Textos', 'Binarios', 'Pickle'],
            ),
            _ModuleTile(
              title: '12. Interfaces Gráficas',
              icon: FontAwesomeIcons.desktop,
              description: 'Crea GUIs con Tkinter.',
              items: const ['Ventanas', 'Widgets', 'Ejercicio calculadora'],
            ),
            _ModuleTile(
              title: '13. App con GUI y POO',
              icon: FontAwesomeIcons.mobileAlt,
              description: 'Apps profesionales con POO y ttk.',
              items: const ['TtkButton', 'ProgressBar', 'Notebook'],
            ),
            _ModuleTile(
              title: '14. SQLite',
              icon: FontAwesomeIcons.database,
              description: 'Bases de datos locales con Python.',
              items: const ['CRUD', 'Autoincrement'],
            ),
            _ModuleTile(
              title: '15. Funciones Avanzadas',
              icon: FontAwesomeIcons.brain,
              description: 'Lambdas, filter, map y generadores.',
              items: const ['Lambda', 'Filter & Map', 'Generadores'],
            ),
            _ModuleTile(
              title: '16. Documentación y Pruebas',
              icon: FontAwesomeIcons.book,
              description: 'Pydoc y Doctest para calidad de código.',
              items: const ['Pydoc', 'Doctest'],
            ),
            _ModuleTile(
              title: '17. Escritorio',
              icon: FontAwesomeIcons.desktop,
              description: 'Empaqueta con PyInstaller.',
              items: const ['Generar ejecutable'],
            ),
            const SizedBox(height: 30),

            // Gallery Section
            const Text(
              'Galería de Código',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  final img = 'assets/images/code${index + 1}.png';
                  return GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        backgroundColor: Colors.transparent,
                        insetPadding: EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(img, fit: BoxFit.contain),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: InkWell(
                                onTap: () => Navigator.of(context).pop(),
                                child: const FaIcon(FontAwesomeIcons.timesCircle, color: Colors.white, size: 28),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),

            // Persuasive CTA
            Center(
              child: Pulse(
                infinite: true,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    children: [
                      TextSpan(
                        text: '¡Explota tu creatividad! ',
                        style: TextStyle(color: Colors.orangeAccent, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '''
Un programador Python puede ganar hasta US\$7,000 al mes plasmando ideas innovadoras en scripts y aplicaciones.

Este curso te da las llaves: domina automatización, hacking ético y desarrollo profesional.''',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
                      ),
                      TextSpan(
                        text: 'Un programador Python puede ganar hasta US\$7,000 al mes plasmando ideas.
Completa este curso y toma el control de tu futuro.',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Bounce(
                infinite: true,
                child: ElevatedButton.icon(
                  onPressed: _openAffiliate,
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  label: const Text('Comprar por \$100', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent[700],
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 8,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _ModuleTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final List<String> items;
  const _ModuleTile({required this.title, required this.icon, required this.description, required this.items});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Colors.white,
      iconColor: Colors.greenAccent,
      title: Row(
        children: [
          FaIcon(icon, color: Colors.white70, size: 20),
          const SizedBox(width: 10),
          Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(description, style: const TextStyle(color: Colors.white70)),
        ),
        for (var item in items)
          ListTile(
            leading: const Icon(Icons.check, color: Colors.greenAccent),
            title: Text(item, style: const TextStyle(color: Colors.white)),
          ),
      ],
    );
  }
}
