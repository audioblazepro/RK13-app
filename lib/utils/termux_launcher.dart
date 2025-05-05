import 'dart:io';

Future<void> abrirTermux() async {
  try {
    final result = await Process.run('am', [
      'start',
      '-n',
      'com.termux/.app.TermuxActivity',
    ]);

    print("Termux lanzado: ${result.exitCode}");
  } catch (e) {
    print("❌ No se pudo abrir Termux: $e");
  }
}
