import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class TermuxInstallPage extends StatelessWidget {
  const TermuxInstallPage({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('No se pudo abrir la URL: $url');
    }
  }

  Widget _buildButton(String text, String url, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () => _launchUrl(url),
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.redAccent,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildCommandCard(String command, String description) {
    return Card(
      color: Colors.black87,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                command,
                style: const TextStyle(
                  color: Colors.green,
                  fontFamily: 'monospace',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.copy, color: Colors.white),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: command));
              },
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            description,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Termux Guide'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🚀 Terminal Emulator para Android',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Termux es un emulador de terminal Android y aplicación de entorno Linux que funciona directamente sin necesidad de root o configuración.',
              style: TextStyle(color: Colors.white, height: 1.5),
            ),
            const SizedBox(height: 24),

            // Ficha técnica
            _buildSection('📱 Especificaciones Técnicas', [
              'Versión: 0.118.0',
              'Licencia: GPL v3.0',
              'Tamaño: ~100MB instalado',
              'Android mínimo: 7.0+',
              'Arquitecturas: arm, arm64, x86_64',
            ]),

            // Empresas que usan Termux
            _buildSection('🏢 Usado por Empresas', [
              'Google - Desarrollo y testing',
              'Facebook - Debugging móvil',
              'Microsoft - WSL testing',
              'Red Hat - Linux development',
              'Ubuntu - Mobile testing',
            ]),

            // Performance
            _buildSection('⚡ Rendimiento', [
              'Inicio: < 2 segundos',
              'Memoria: 50-100MB base',
              'CPU: Uso mínimo en idle',
              'Storage: 250MB-1GB según paquetes',
              'Network: Soporte completo TCP/IP',
            ]),

            const SizedBox(height: 24),
            // Botones de acción
            Center(
              child: Column(
                children: [
                  _buildButton(
                    '📥 Instalar Termux',
                    'https://f-droid.org/packages/com.termux/',
                  ),
                  _buildButton(
                    '📚 Wiki Oficial',
                    'https://wiki.termux.com',
                    color: Colors.blue[700],
                  ),
                  _buildButton(
                    '💻 GitHub',
                    'https://github.com/termux/termux-app',
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            // Comandos iniciales
            const Text(
              '🚀 Primeros Pasos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildCommandCard(
              'termux-setup-storage',
              'Permite acceso al almacenamiento interno',
            ),
            _buildCommandCard(
              'pkg update && pkg upgrade',
              'Actualiza todos los paquetes',
            ),
            _buildCommandCard(
              'pkg install python git nodejs',
              'Instala herramientas esenciales',
            ),

            const SizedBox(height: 24),
            // Paquetes recomendados
            _buildSection('📦 Paquetes Esenciales', [
              'python - Desarrollo y scripting',
              'git - Control de versiones',
              'nodejs - JavaScript runtime',
              'openssh - Conexiones seguras',
              'vim - Editor de texto avanzado',
            ]),

            const SizedBox(height: 32),
            // Call to Action
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.1),
                border: Border.all(color: Colors.redAccent),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Text(
                    '🔥 ¡Potencia tu Terminal!',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Accede a más de 1,000 paquetes y herramientas. '
                    'Convierte tu Android en una estación de trabajo Linux.',
                    style: TextStyle(color: Colors.white, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  _buildButton(
                    'Ver Repositorios',
                    'https://packages.termux.org',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                const Icon(Icons.arrow_right, color: Colors.redAccent),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
