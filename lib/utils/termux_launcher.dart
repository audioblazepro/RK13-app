import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/foundation.dart';

Future<void> abrirTermux() async {
  try {
    final intent = AndroidIntent(
      action: 'android.intent.action.MAIN',
      package: 'com.termux',
      componentName: 'com.termux.app.TermuxActivity',
      flags: <int>[
        Flag.FLAG_ACTIVITY_NEW_TASK,
        Flag.FLAG_ACTIVITY_CLEAR_TOP,
      ],
    );
    await intent.launch();
  } catch (e) {
    debugPrint("❌ No se pudo abrir Termux: $e");
  }
}
