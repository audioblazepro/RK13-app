import 'dart:io';

Future<void> abrirTermuxConScript(String scriptPath) async {
  try {
    final result = await Process.run('am', [
      'start',
      '-a',
      'com.termux.RUN_COMMAND',
      '-n',
      'com.termux/.app.TermuxActivity',
      '--es',
      'com.termux.RUN_COMMAND_PATH',
      scriptPath,
      '--ez',
      'com.termux.RUN_COMMAND_BACKGROUND',
      'false',
    ]);

    if (result.exitCode != 0) {
      print('❌ Fallo al abrir Termux: ${result.stderr}');
    }
  } catch (e) {
    print('❌ Error ejecutando Termux: $e');
  }
}
