import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LearnPythonPage extends StatelessWidget {
  const LearnPythonPage({super.key});

  Future<void> _openAffiliate() async {
    final uri = Uri.parse('https://www.hotmart.com/affiliate/course/python-pro?aff=TU_ID');
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
            // Módulos con ExpansionTile
            const Text(
              'Módulos del Curso',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // 1 Intro
            _ModuleTile(
              title: '1. Introducción',
              icon: FontAwesomeIcons.play,
              description:
                  'Presentación, descarga de Python y únete al canal oficial de Telegram para obtener recursos exclusivos.',
              items: const [
                'Presentación y bienvenida',
                'Descargando Python',
                'Únete al canal de Telegram',
              ],
            ),
            // 2 Primeros Pasos
            _ModuleTile(
              title: '2. Primeros Pasos',
              icon: FontAwesomeIcons.robot,
              description:
                  'Configura tu entorno y aprende las bases de Python: números, texto y estructuras de datos.',
              items: const [
                'Introducción a Python',
                'Números I & II',
                'Textos, índices y slicing',
                'Listas y entrada de datos',
                'Instalando y usando VS Code',
                'Ejercicios prácticos',
              ],
            ),
            // 3 Operadores
            _ModuleTile(
              title: '3. Operadores y Expresiones',
              icon: FontAwesomeIcons.calculator,
              description:
                  'Comprende lógica booleana y aritmética avanzada para scripts de automatización y hacking.',
              items: const [
                'Tipo lógico y relacional',
                'Operadores lógicos y de asignación',
                'Ejercicios prácticos',
              ],
            ),
            // 4 Control de flujo
            _ModuleTile(
              title: '4. Control de Flujo',
              icon: FontAwesomeIcons.exchangeAlt,
              description:
                  'Crea scripts inteligentes con condicionales y bucles para automatizar tareas en Termux.',
              items: const [
                'Sentencia if',
                'Bucle while & for',
                'Ejercicios prácticos',
              ],
            ),
            // 5 Colecciones
            _ModuleTile(
              title: '5. Colecciones',
              icon: FontAwesomeIcons.thList,
              description:
                  'Maneja datos masivos con tuplas, conjuntos y diccionarios, fundamentales en ciberseguridad.',
              items: const [
                'Tuplas, conjuntos y diccionarios',
                'Colas y pilas',
                'Ejercicios prácticos',
              ],
            ),
            // 6 Scripts
            _ModuleTile(
              title: '6. Scripts',
              icon: FontAwesomeIcons.fileCode,
              description:
                  'Aprende a leer y escribir archivos, crear scripts ejecutables y automatizar flujos.',
              items: const [
                'Entrada y salida',
                'Creación de scripts',
              ],
            ),
            // 7 Funciones
            _ModuleTile(
              title: '7. Funciones',
              icon: FontAwesomeIcons.function,
              description:
                  'Modulariza tu código con funciones; clave en desarrollo profesional y pruebas de pentesting.',
              items: const [
                'Declarar y retornar',
                'Argumentos y parámetros',
                'Funciones avanzadas y ejercicios',
              ],
            ),
            // 8 Errores y Excepciones
            _ModuleTile(
              title: '8. Errores y Excepciones',
              icon: FontAwesomeIcons.exclamationTriangle,
              description:
                  'Gestiona excepciones para scripts robustos, imprescindible en entornos de producción.',
              items: const [
                'Manejo de excepciones',
                'Errores múltiples',
              ],
            ),
            // 9 POO
            _ModuleTile(
              title: '9. Programación Orientada a Objetos',
              icon: FontAwesomeIcons.objectGroup,
              description:
                  'Diseña aplicaciones escalables usando clases, herencia y polimorfismo.',
              items: const [
                'Clases y objetos',
                'Métodos especiales',
                'Encapsulamiento',
              ],
            ),
            //10 Módulos y paquetes
            _ModuleTile(
              title: '10. Módulos y Paquetes',
              icon: FontAwesomeIcons.box,
              description:
                  'Organiza tu código en módulos y distribúyelo fácilmente con paquetes.',
              items: const [
                'Módulos básicos',
                'Paquetes y distribuciones',
              ],
            ),
            //11 Ficheros
            _ModuleTile(
              title: '11. Ficheros',
              icon: FontAwesomeIcons.folderOpen,
              description:
                  'Manipula archivos y datos serializados con Pickle para automatización y análisis.',
              items: const [
                'Lectura/escritura de ficheros',
                'Serialización con Pickle',
              ],
            ),
            //12 Interfaces Gráficas
            _ModuleTile(
              title: '12. Interfaces Gráficas',
              icon: FontAwesomeIcons.desktop,
              description:
                  'Crea GUIs para herramientas de hacking con Tkinter: ventanas, botones y formularios.',
              items: const [
                'Tk root y frames',
                'Widgets: Button, Listbox, Popups',
                'Ejercicios de calculadora',
              ],
            ),
            //13 App Gráfica
            _ModuleTile(
              title: '13. App con GUI y POO',
              icon: FontAwesomeIcons.mobileAlt,
              description:
                  'Desarrolla apps completas con diseño profesional y POO.',
              items: const [
                'TtkButtons y ProgressBar',
                'Páginas con ttk.Notebook',
              ],
            ),
            //14 Bases de datos
            _ModuleTile(
              title: '14. Bases de Datos SQLite',
              icon: FontAwesomeIcons.database,
              description:
                  'Integra Python con SQLite para crear herramientas de gestión de datos.',
              items: const [
                'CRUD básico',
                'Primary Key y autoincrement',
              ],
            ),
            //15 Funciones avanzadas
            _ModuleTile(
              title: '15. Funciones Avanzadas',
              icon: FontAwesomeIcons.code,
              description:
                  'Potencia tu código con lambdas, filter, map y generadores.',
              items: const [
                'Filter, map y lambda',
                'Generadores',
              ],
            ),
            //16 Documentación y pruebas
            _ModuleTile(
              title: '16. Documentación y Pruebas',
              icon: FontAwesomeIcons.book,
              description:
                  'Documenta y prueba tu código con Pydoc y Doctest para calidad profesional.',
              items: const [
                'Pydoc',
                'Doctest',
              ],
            ),
            //17 Aplicación de Escritorio
            _ModuleTile(
              title: '17. Aplicación de Escritorio',
              icon: FontAwesomeIcons.desktop,
              description:
                  'Empaqueta tu aplicación en un ejecutable independiente.',
              items: const [
                'Generar ejecutable',
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Comprar por \$100 hoy', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent[700],
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: _openAffiliate,
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
