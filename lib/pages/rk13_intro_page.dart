import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class Rk13IntroPage extends StatefulWidget {
  const Rk13IntroPage({super.key});

  @override
  State<Rk13IntroPage> createState() => _Rk13IntroPageState();
}

class _Rk13IntroPageState extends State<Rk13IntroPage> {
  bool _termuxInstalado = false;

  @override
  void initState() {
    super.initState();
    _verificarTermux();
  }

  Future<void> _verificarTermux() async {
    final uri = Uri.parse('intent://#Intent;package=com.termux;end');
    final disponible = await canLaunchUrl(uri);
    setState(() {
      _termuxInstalado = disponible;
    });
  }

  Future<void> _abrirTermux() async {
    final uri = Uri.parse('intent://#Intent;package=com.termux;end');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      _mostrarToast("❌ Termux no está instalado.");
    }
  }

  Future<void> _abrirFdroid() async {
    final uri = Uri.parse('https://f-droid.org/en/packages/com.termux/');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      _mostrarToast("❌ No se pudo abrir F-Droid");
    }
  }

  void _mostrarToast(String mensaje) {
    Fluttertoast.showToast(
      msg: mensaje,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "👋 Bienvenido a RK13",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "RK13 es una plataforma para automatizar instalaciones, scripts, y herramientas útiles dentro de Termux. "
            "Te ayuda a gestionar paquetes, aprender Python, y ejecutar scripts desde una interfaz moderna y profesional.",
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Icon(
                _termuxInstalado ? Icons.check_circle : Icons.warning,
                color: _termuxInstalado ? Colors.green : Colors.orange,
              ),
              const SizedBox(width: 8),
              Text(
                _termuxInstalado
                    ? "Termux está instalado"
                    : "Termux no detectado",
                style: TextStyle(
                  fontSize: 16,
                  color: _termuxInstalado ? Colors.green : Colors.orangeAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.open_in_new),
            label: const Text("Instalar Termux desde F-Droid"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: _abrirFdroid,
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            icon: const Icon(Icons.terminal),
            label: const Text("Abrir Termux"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed:
                _termuxInstalado
                    ? _abrirTermux
                    : () => _mostrarToast("Instala Termux primero."),
          ),
          const SizedBox(height: 24),
          const Divider(color: Colors.white24),
          const SizedBox(height: 12),
          const Text(
            "➡️ ¿Qué sigue?",
            style: TextStyle(fontSize: 18, color: Colors.redAccent),
          ),
          const SizedBox(height: 8),
          const Text(
            "1. Instala Termux.\n"
            "2. Abre RK13 y accede a la sección de Repositorios.\n"
            "3. Copia y ejecuta scripts directamente.\n"
            "4. Explora la sección Aprende Python para comenzar tu camino en la programación.",
            style: TextStyle(fontSize: 15, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
