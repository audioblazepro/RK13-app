import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_apps/device_apps.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Rk13IntroPage extends StatefulWidget {
  const Rk13IntroPage({super.key});

  @override
  State<Rk13IntroPage> createState() => _Rk13IntroPageState();
}

class _Rk13IntroPageState extends State<Rk13IntroPage> {
  bool termuxInstalado = false;

  @override
  void initState() {
    super.initState();
    verificarTermux();
  }

  Future<void> verificarTermux() async {
    final instalado = await DeviceApps.isAppInstalled('com.termux');
    setState(() => termuxInstalado = instalado);
  }

  Future<void> abrirFDroid() async {
    final url = Uri.parse('https://f-droid.org/packages/com.termux/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> abrirTermux() async {
    const intentUri = 'intent://#Intent;package=com.termux;end';
    final uri = Uri.parse(intentUri);
    if (!await launchUrl(uri)) {
      mostrarToast("❌ No se pudo abrir Termux");
    }
  }

  void mostrarToast(String mensaje) {
    Fluttertoast.showToast(
      msg: mensaje,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(Icons.terminal, size: 80, color: Colors.redAccent),
          const SizedBox(height: 20),
          const Text(
            "Bienvenido a RK13",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "RK13 es una herramienta avanzada para facilitar la instalación y gestión de scripts, lenguajes y configuraciones automatizadas desde Termux.\n\nInstala herramientas con solo tocar un botón.",
            style: TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Card(
            color: Colors.grey[900],
            child: ListTile(
              title: const Text("¿Termux está instalado?", style: TextStyle(color: Colors.white)),
              subtitle: Text(
                termuxInstalado ? "✅ Termux detectado" : "❌ No detectado",
                style: TextStyle(color: termuxInstalado ? Colors.green : Colors.red),
              ),
              trailing: Icon(termuxInstalado ? Icons.check_circle : Icons.warning, color: termuxInstalado ? Colors.green : Colors.red),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.download),
            label: const Text("Instalar Termux desde F-Droid"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: abrirFDroid,
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            icon: const Icon(Icons.open_in_new),
            label: const Text("Abrir Termux"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: abrirTermux,
          ),
          const SizedBox(height: 30),
          const Text(
            "Una vez Termux esté instalado, regresa y comienza a instalar tus repositorios.",
            style: TextStyle(color: Colors.white60),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
