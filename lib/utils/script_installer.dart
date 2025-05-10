import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ScriptInstaller {
  static const List<String> scriptNames = [
    "aircrack-ng.sh",
    "beef.sh",
    "burpsuite.sh",
    "dirb.sh",
    "dnsenum.sh",
    "ettercap.sh",
    "fierce.sh",
    "ghostphisher.sh",
    "hashcat.sh",
    "hydra.sh",
    "johntheripper.sh",
    "maltego.sh",
    "metasploit.sh",
    "netcat.sh",
    "nikto.sh",
    "nmap.sh",
    "recon-ng.sh",
    "redhawk.sh",
    "routersploit.sh",
    "setoolkit.sh",
    "slowloris.sh",
    "socialfish.sh",
    "sqlmap.sh",
    "tcpdump.sh",
    "theharvester.sh",
    "trity.sh",
    "wireshark.sh",
    "wpscan.sh",
    "xerosploit.sh",
    "yersinia.sh",
    "zphisher.sh",
  ];

  static Future<void> initScripts() async {
    final dir = Directory('/storage/emulated/0/termuxcode');
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    for (final script in scriptNames) {
      final filePath = '${dir.path}/$script';
      final file = File(filePath);

      if (!await file.exists()) {
        final byteData = await rootBundle.load('assets/scripts/$script');
        await file.writeAsBytes(byteData.buffer.asUint8List());
        await file.setPermissions(mode: FileMode.write);
        await file.setExecutable(true);
      }
    }
  }
}
