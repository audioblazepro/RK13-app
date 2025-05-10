import 'dart:io';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class ScriptInstaller {
  static Future<bool> _solicitarPermisos() async {
    final status = await Permission.manageExternalStorage.request();
    return status.isGranted;
  }

  static Future<void> guardarScript(String scriptFile) async {
    final permisosOk = await _solicitarPermisos();
    if (!permisosOk) {
      throw Exception("Permiso de almacenamiento denegado");
    }

    final baseDir = Directory('/storage/emulated/0/termuxcode');
    if (!await baseDir.exists()) {
      await baseDir.create(recursive: true);
    }

    final filePath = '${baseDir.path}/$scriptFile';
    final file = File(filePath);
    if (await file.exists()) return;

    final data = await rootBundle.load('assets/scripts/$scriptFile');
    await file.writeAsBytes(data.buffer.asUint8List());
  }
}
