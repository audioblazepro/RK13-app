import 'dart:io';

Future<void> abrirTermuxConScript(String scriptPath) async {
  try {
    await Process.run('am', [
      'start',
      '-n',
      'com.termux/.app.TermuxActivity',
      '-d',
      'file://$scriptPath',
    ]);
  } catch (e) {
    print('❌ Termux no pudo abrirse: $e');
  }
}
