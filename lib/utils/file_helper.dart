import 'dart:io';
import 'package:flutter/services.dart';

Future<String> guardarScriptTemporal(String repoName, String assetPath) async {
  final contenido = await rootBundle.loadString(assetPath);
  final dir = '/storage/emulated/0/Download';
  final filePath = '$dir/rk13_${repoName.toLowerCase()}.sh';

  final scriptFile = File(filePath);
  await scriptFile.writeAsString('''#!/data/data/com.termux/files/usr/bin/bash
$contenido
echo "✅ ${repoName} instalado" >> "$dir/rk13_logs.txt"
''');

  return filePath;
}
