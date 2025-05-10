import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ScriptInstaller {
  static Future<bool> saveScript(String scriptName) async {
    try {
      final hasPermission = await _requestStoragePermission();
      if (!hasPermission) return false;

      final directory = Directory('/storage/emulated/0/termuxcode');
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      final scriptFile = File('${directory.path}/$scriptName');
      if (!await scriptFile.exists()) {
        final byteData = await rootBundle.load('assets/scripts/$scriptName');
        await scriptFile.writeAsBytes(byteData.buffer.asUint8List());
        // Android ejecutará los scripts directamente en Termux, no requiere setExecutable en este contexto
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> _requestStoragePermission() async {
    final status = await Permission.manageExternalStorage.request();
    return status.isGranted;
  }
}
