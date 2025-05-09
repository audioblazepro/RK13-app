import 'package:flutter/material.dart';
import 'package:rk13/models/repo_model.dart';
import 'package:rk13/pages/repo_readme_page.dart';

class HomePage extends StatelessWidget {
  final List<RepoModel> repos = [
    RepoModel(
      name: "Aircrack-ng",
      description: "Herramienta de cracking de Wi-Fi.",
      scriptFile: "aircrack-ng.sh",
    ),
    RepoModel(
      name: "Beef",
      description: "Framework de explotación de XSS.",
      scriptFile: "beef.sh",
    ),
    RepoModel(
      name: "Burp Suite",
      description: "Plataforma para pruebas de seguridad web.",
      scriptFile: "burpsuite.sh",
    ),
    RepoModel(
      name: "Dirb",
      description: "Herramienta de fuzzing para directorios.",
      scriptFile: "dirb.sh",
    ),
    RepoModel(
      name: "Dnsenum",
      description: "Enumerador de DNS.",
      scriptFile: "dnsenum.sh",
    ),
    RepoModel(
      name: "Ettercap",
      description: "Herramienta de sniffing/interceptación.",
      scriptFile: "ettercap.sh",
    ),
    RepoModel(
      name: "Fierce",
      description: "Herramienta de reconocimiento DNS.",
      scriptFile: "fierce.sh",
    ),
    RepoModel(
      name: "Ghost Phisher",
      description: "Suite de phishing.",
      scriptFile: "ghostphisher.sh",
    ),
    RepoModel(
      name: "Hashcat",
      description: "Cracker de contraseñas.",
      scriptFile: "hashcat.sh",
    ),
    RepoModel(
      name: "Hydra",
      description: "Herramienta de fuerza bruta.",
      scriptFile: "hydra.sh",
    ),
    RepoModel(
      name: "John the Ripper",
      description: "Cracker de contraseñas.",
      scriptFile: "johntheripper.sh",
    ),
    RepoModel(
      name: "Maltego",
      description: "Herramienta de análisis y minería de datos.",
      scriptFile: "maltego.sh",
    ),
    RepoModel(
      name: "Metasploit",
      description: "Framework de explotación.",
      scriptFile: "metasploit.sh",
    ),
    RepoModel(
      name: "Netcat",
      description: "Herramienta de red multipropósito.",
      scriptFile: "netcat.sh",
    ),
    RepoModel(
      name: "Nikto",
      description: "Escáner de vulnerabilidades web.",
      scriptFile: "nikto.sh",
    ),
    RepoModel(
      name: "Nmap",
      description: "Escáner de red.",
      scriptFile: "nmap.sh",
    ),
    RepoModel(
      name: "Recon-ng",
      description: "Framework de reconocimiento.",
      scriptFile: "recon-ng.sh",
    ),
    RepoModel(
      name: "Red Hawk",
      description: "Herramienta de información web.",
      scriptFile: "redhawk.sh",
    ),
    RepoModel(
      name: "Setoolkit",
      description: "Kit de herramientas de ingeniería social.",
      scriptFile: "setoolkit.sh",
    ),
    RepoModel(
      name: "Slowloris",
      description: "Ataque de denegación de servicio.",
      scriptFile: "slowloris.sh",
    ),
    RepoModel(
      name: "SocialFish",
      description: "Herramienta de phishing.",
      scriptFile: "socialfish.sh",
    ),
    RepoModel(
      name: "SQLMap",
      description: "Herramienta de inyección SQL.",
      scriptFile: "sqlmap.sh",
    ),
    RepoModel(
      name: "TCPDump",
      description: "Analizador de tráfico de red.",
      scriptFile: "tcpdump.sh",
    ),
    RepoModel(
      name: "The Harvester",
      description: "Recolector de correos y dominios.",
      scriptFile: "theharvester.sh",
    ),
    RepoModel(
      name: "Trity",
      description: "Framework de pentesting.",
      scriptFile: "trity.sh",
    ),
    RepoModel(
      name: "Wireshark",
      description: "Analizador de protocolos de red.",
      scriptFile: "wireshark.sh",
    ),
    RepoModel(
      name: "Wpscan",
      description: "Escáner de vulnerabilidades WordPress.",
      scriptFile: "wpscan.sh",
    ),
    RepoModel(
      name: "Xerosploit",
      description: "Herramienta MITM.",
      scriptFile: "xerosploit.sh",
    ),
    RepoModel(
      name: "Yersinia",
      description: "Herramienta de ataques a redes LAN.",
      scriptFile: "yersinia.sh",
    ),
    RepoModel(
      name: "Zphisher",
      description: "Herramienta avanzada de phishing.",
      scriptFile: "zphisher.sh",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RK13 Toolkit')),
      body: ListView.builder(
        itemCount: repos.length,
        itemBuilder: (context, index) {
          final repo = repos[index];
          return ListTile(
            title: Text(repo.name),
            subtitle: Text(repo.description),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RepoReadmePage(
                  assetPath: 'assets/readmes/${repo.scriptFile.replaceAll(".sh", ".md")}',
                  scriptFile: repo.scriptFile,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
