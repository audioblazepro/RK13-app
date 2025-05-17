import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermuxInstallPage extends StatelessWidget {
  const TermuxInstallPage({super.key});

  Future<void> _launchTermuxDownload() async {
    const url = 'https://f-droid.org/packages/com.termux/';
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('No se pudo abrir la URL de descarga de Termux');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Instalar Termux'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchTermuxDownload,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
          child: const Text(
            'Descargar Termux (F-Droid)',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
