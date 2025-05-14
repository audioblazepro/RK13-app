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
            // Sección Hero
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

            // Descripción detallada
            FadeInUp(
              child: const Text(
                'Imagina automatizar tareas en tu móvil, desarrollar aplicaciones de escritorio y crear GUIs profesionales usando solo Python. Este curso de 19 módulos te lleva de la instalación de Termux a la creación de herramientas de hacking ético, bots y análisis de datos.',
                style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 20),

            // Garantía
            FadeIn(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.greenAccent),
                ),
                child: const Text(
                  'Garantía de 7 días: Prueba el curso sin riesgo. Si no estás satisfecho, te devolvemos el 100% de tu inversión. ¡Aprende y decide con total tranquilidad!',
                  style: TextStyle(color: Colors.greenAccent, fontSize: 16, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Sección de módulos
            const Text(
              'Módulos del Curso',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Expansion tiles para cada módulo
            _ModuleTile(
              title: '1. Introducción',
              icon: FontAwesomeIcons.play,
              description:
                  'Presentación, descarga de Python en Termux y acceso al canal exclusivo de Telegram.',
              items: const [
                'Presentación y bienvenida',
                'Descargando Python',
                'Únete al canal de Telegram',
              ],
            ),
            _ModuleTile(
              title: '2. Primeros Pasos',
              icon: FontAwesomeIcons.robot,
              description:
                  'Configura tu entorno, explora tipos de datos y maneja entradas de usuario.',
              items: const [
                'Introducción a Python',
                'Números I & II',
                'Textos, índices y slicing',
                'Listas y entrada de datos',
                'Instalando Visual Studio Code',
                'Uso básico de VS Code',
                'Ejercicios prácticos',
              ],
            ),
            _ModuleTile(
              title: '3. Operadores y Expresiones',
              icon: FontAwesomeIcons.calculator,
              description:
                  'Domina la lógica booleana y aritmética para crear scripts de automatización profesionales.',
              items: const [
                'Tipo lógico y relacional',
                'Operadores lógicos y de asignación',
                'Ejercicios prácticos',
              ],
            ),
            _ModuleTile(
              title: '4. Control de Flujo',
              icon: FontAwesomeIcons.exchangeAlt,
              description:
                  'Aprende condicionales y bucles para tomar decisiones y repetir acciones en tus programas.',
              items: const [
                'Sentencia if',
                'Bucles while y for',
                'Ejercicios prácticos',
              ],
            ),
            _ModuleTile(
              title: '5. Colecciones',
              icon: FontAwesomeIcons.thList,
              description:
                  'Trabaja con tuplas, listas, diccionarios y aprende estructuras como colas y pilas.',
              items: const [
                'Tuplas, conjuntos y diccionarios',
                'Colas y pilas',
                'Ejercicios prácticos',
              ],
            ),
            _ModuleTile(
              title: '6. Scripts',
              icon: FontAwesomeIcons.fileCode,
              description:
                  'Crea y ejecuta scripts, gestiona archivos de entrada/salida y automatiza procesos.',
              items: const [
                'Entrada y salida de datos',
                'Creación de scripts ejecutables',
              ],
            ),
            _ModuleTile(
              title: '7. Funciones',
              icon: FontAwesomeIcons.code,
              description:
                  'Escribe funciones reutilizables, gestiona parámetros y devuelve valores eficientemente.',
              items: const [
                'Declarar y retornar funciones',
                'Argumentos y parámetros',
                'Funciones avanzadas y ejercicios',
              ],
            ),
            _ModuleTile(
              title: '8. Errores y Excepciones',
              icon: FontAwesomeIcons.exclamationTriangle,
              description:
                  'Maneja excepciones y errores para crear scripts robustos en entornos reales.',
              items: const [
                'Bloques try/except',
                'Errores múltiples',
              ],
            ),
            _ModuleTile(
              title: '9. Programación Orientada a Objetos',
              icon: FontAwesomeIcons.objectGroup,
              description:
                  'Aprende a crear clases, objetos y aplicar herencia y polimorfismo.',
              items: const [
                'Clases y objetos',
                'Métodos especiales',
                'Encapsulamiento',
              ],
            ),
            _ModuleTile(
              title: '10. Módulos y Paquetes',
              icon: FontAwesomeIcons.box,
              description:
                  'Organiza tu código en módulos y distribúyelo con paquetes instalables.',
              items: const [
                'Creación de módulos',
                'Paquetes y distribuciones',
              ],
            ),
            _ModuleTile(
              title: '11. Ficheros',
              icon: FontAwesomeIcons.folderOpen,
              description:
                  'Maneja ficheros de texto y binarios, además de serializar con Pickle.',
              items: const [
                'Lectura/escritura de ficheros',
                'Serialización con Pickle',
              ],
            ),
            _ModuleTile(
              title: '12. Interfaces Gráficas',
              icon: FontAwesomeIcons.desktop,
              description:
                  'Crea ventanas, botones y formularios con Tkinter para herramientas visuales.',
              items: const [
                'Tk root, frames y widgets',
                'Eventos y Popups',
                'Ejercicio: Calculadora',
              ],
            ),
            _ModuleTile(
              title: '13. App con GUI y POO',
              icon: FontAwesomeIcons.mobileAlt,
              description:
                  'Desarrolla aplicaciones móviles con POO y widgets avanzados de Tcl/Tk.',
              items: const [
                'TtkButton y ProgressBar',
                'ttk.Notebook para pestañas',
              ],
            ),
            _ModuleTile(
              title: '14. Bases de Datos SQLite',
              icon: FontAwesomeIcons.database,
              description:
                  'Aprende CRUD básico y manejo de claves primarias en bases de datos locales.',
              items: const [
                'Conexión y consultas SQL',
                'Primary Key y autoincrement',
              ],
            ),
            _ModuleTile(
              title: '15. Funciones Avanzadas',
              icon: FontAwesomeIcons.code,
              description:
                  'Aplica lambdas, filter, map y generadores para manipulación de datos avanzada.',
              items: const [
                'Filter, map y lambda',
                'Generadores I & II',
              ],
            ),
            _ModuleTile(
              title: '16. Documentación y Pruebas',
              icon: FontAwesomeIcons.book,
              description:
                  'Documenta tu proyecto con Pydoc y crea pruebas automáticas con Doctest.',
              items: const [
                'Pydoc y comentarios',
                'Doctest',
              ],
            ),
            _ModuleTile(
              title: '17. Aplicación de Escritorio',
              icon: FontAwesomeIcons.desktop,
              description:
                  'Empaqueta tu aplicación en un ejecutable multiplataforma con PyInstaller.',
              items: const [
                'Generar ejecutable con PyInstaller',
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
