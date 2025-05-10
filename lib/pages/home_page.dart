import 'package:flutter/material.dart';
import '../models/repo_model.dart';
import 'repo_readme_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<RepoModel> repos = [
    RepoModel(
        name: "Aircrack-ng",
        description: "Herramienta para auditorías de redes Wi-Fi.",
        scriptFile: "aircrack-ng.sh",
        readmeAsset: "assets/readmes/aircrack-ng.md",
        githubUrl: "https://github.com/aircrack-ng/aircrack-ng"),
    RepoModel(
        name: "BeEF",
        description: "Framework de explotación en navegadores.",
        scriptFile: "beef.sh",
        readmeAsset: "assets/readmes/beef.md",
        githubUrl: "https://github.com/beefproject/beef"),
    RepoModel(
        name: "Burp Suite",
        description: "Herramienta para pruebas de seguridad web.",
        scriptFile: "burpsuite.sh",
        readmeAsset: "assets/readmes/burpsuite.md",
        githubUrl: "https://github.com/portswigger/burp-suite"),
    RepoModel(
        name: "Dirb",
        description: "Escáner de contenido web.",
        scriptFile: "dirb.sh",
        readmeAsset: "assets/readmes/dirb.md",
        githubUrl: "https://github.com/v0re/dirb"),
    RepoModel(
        name: "Dnsenum",
        description: "Herramienta de enumeración DNS.",
        scriptFile: "dnsenum.sh",
        readmeAsset: "assets/readmes/dnsenum.md",
        githubUrl: "https://github.com/fwaeytens/dnsenum"),
    RepoModel(
        name: "Ettercap",
        description: "Suite para ataques MITM en redes LAN.",
        scriptFile: "ettercap.sh",
        readmeAsset: "assets/readmes/ettercap.md",
        githubUrl: "https://github.com/Ettercap/ettercap"),
    RepoModel(
        name: "Fierce",
        description: "Herramienta de reconocimiento DNS.",
        scriptFile: "fierce.sh",
        readmeAsset: "assets/readmes/fierce.md",
        githubUrl: "https://github.com/mschwager/fierce"),
    RepoModel(
        name: "Ghost Phisher",
        description: "Herramienta de ingeniería social y ataques phishing.",
        scriptFile: "ghostphisher.sh",
        readmeAsset: "assets/readmes/ghostphisher.md",
        githubUrl: "https://github.com/savio-code/ghost-phisher"),
    RepoModel(
        name: "Hashcat",
        description: "Cracker de contraseñas avanzado.",
        scriptFile: "hashcat.sh",
        readmeAsset: "assets/readmes/hashcat.md",
        githubUrl: "https://github.com/hashcat/hashcat"),
    RepoModel(
        name: "Hydra",
        description: "Ataques de fuerza bruta a múltiples protocolos.",
        scriptFile: "hydra.sh",
        readmeAsset: "assets/readmes/hydra.md",
        githubUrl: "https://github.com/vanhauser-thc/thc-hydra"),
    RepoModel(
        name: "John The Ripper",
        description: "Popular herramienta para romper contraseñas.",
        scriptFile: "johntheripper.sh",
        readmeAsset: "assets/readmes/johntheripper.md",
        githubUrl: "https://github.com/openwall/john"),
    RepoModel(
        name: "Maltego",
        description: "Herramienta de OSINT y análisis de relaciones.",
        scriptFile: "maltego.sh",
        readmeAsset: "assets/readmes/maltego.md",
        githubUrl: "https://github.com/paterva/maltego-trx"),
    RepoModel(
        name: "Metasploit",
        description: "Framework de explotación de vulnerabilidades.",
        scriptFile: "metasploit.sh",
        readmeAsset: "assets/readmes/metasploit.md",
        githubUrl: "https://github.com/rapid7/metasploit-framework"),
    RepoModel(
        name: "Netcat",
        description: "Herramienta de red para lectura y escritura de datos.",
        scriptFile: "netcat.sh",
        readmeAsset: "assets/readmes/netcat.md",
        githubUrl: "https://github.com/diegocr/netcat"),
    RepoModel(
        name: "Nikto",
        description: "Escáner web para vulnerabilidades comunes.",
        scriptFile: "nikto.sh",
        readmeAsset: "assets/readmes/nikto.md",
        githubUrl: "https://github.com/sullo/nikto"),
    RepoModel(
        name: "Nmap",
        description: "Escáner de redes y puertos.",
        scriptFile: "nmap.sh",
        readmeAsset: "assets/readmes/nmap.md",
        githubUrl: "https://github.com/nmap/nmap"),
    RepoModel(
        name: "Recon-ng",
        description: "Framework para reconocimiento web automatizado.",
        scriptFile: "recon-ng.sh",
        readmeAsset: "assets/readmes/recon-ng.md",
        githubUrl: "https://github.com/lanmaster53/recon-ng"),
    RepoModel(
        name: "Red Hawk",
        description: "Herramienta de escaneo de sitios web.",
        scriptFile: "redhawk.sh",
        readmeAsset: "assets/readmes/redhawk.md",
        githubUrl: "https://github.com/Tuhinshubhra/RED_HAWK"),
    RepoModel(
        name: "RouterSploit",
        description: "Explotación de vulnerabilidades en routers.",
        scriptFile: "routersploit.sh",
        readmeAsset: "assets/readmes/routersploit.md",
        githubUrl: "https://github.com/threat9/routersploit"),
    RepoModel(
        name: "Setoolkit",
        description: "Toolkit de ingeniería social.",
        scriptFile: "setoolkit.sh",
        readmeAsset: "assets/readmes/setoolkit.md",
        githubUrl: "https://github.com/trustedsec/social-engineer-toolkit"),
    RepoModel(
        name: "Slowloris",
        description: "Ataque DoS HTTP basado en sockets lentos.",
        scriptFile: "slowloris.sh",
        readmeAsset: "assets/readmes/slowloris.md",
        githubUrl: "https://github.com/gkbrk/slowloris"),
    RepoModel(
        name: "SocialFish",
        description: "Herramienta para crear páginas phishing.",
        scriptFile: "socialfish.sh",
        readmeAsset: "assets/readmes/socialfish.md",
        githubUrl: "https://github.com/UndeadSec/SocialFish"),
    RepoModel(
        name: "Sqlmap",
        description: "Automatiza la detección de vulnerabilidades SQLi.",
        scriptFile: "sqlmap.sh",
        readmeAsset: "assets/readmes/sqlmap.md",
        githubUrl: "https://github.com/sqlmapproject/sqlmap"),
    RepoModel(
        name: "TCPDump",
        description: "Analizador de paquetes de red por CLI.",
        scriptFile: "tcpdump.sh",
        readmeAsset: "assets/readmes/tcpdump.md",
        githubUrl: "https://github.com/the-tcpdump-group/tcpdump"),
    RepoModel(
        name: "TheHarvester",
        description: "Herramienta OSINT para recolección de correos y dominios.",
        scriptFile: "theharvester.sh",
        readmeAsset: "assets/readmes/theharvester.md",
        githubUrl: "https://github.com/laramies/theHarvester"),
    RepoModel(
        name: "Trity",
        description: "Framework de ataque basado en Python.",
        scriptFile: "trity.sh",
        readmeAsset: "assets/readmes/trity.md",
        githubUrl: "https://github.com/toxic-ig/Trity"),
    RepoModel(
        name: "Wireshark",
        description: "Captura y análisis de tráfico de red.",
        scriptFile: "wireshark.sh",
        readmeAsset: "assets/readmes/wireshark.md",
        githubUrl: "https://github.com/wireshark/wireshark"),
    RepoModel(
        name: "Wpscan",
        description: "Escáner de seguridad para WordPress.",
        scriptFile: "wpscan.sh",
        readmeAsset: "assets/readmes/wpscan.md",
        githubUrl: "https://github.com/wpscanteam/wpscan"),
    RepoModel(
        name: "Xerosploit",
        description: "Framework MITM con múltiples módulos de ataque.",
        scriptFile: "xerosploit.sh",
        readmeAsset: "assets/readmes/xerosploit.md",
        githubUrl: "https://github.com/LionSec/xerosploit"),
    RepoModel(
        name: "Yersinia",
        description: "Herramienta para ataques a protocolos de red.",
        scriptFile: "yersinia.sh",
        readmeAsset: "assets/readmes/yersinia.md",
        githubUrl: "https://github.com/tomac/yersinia"),
    RepoModel(
        name: "Zphisher",
        description: "Herramienta para phishing automatizado.",
        scriptFile: "zphisher.sh",
        readmeAsset: "assets/readmes/zphisher.md",
        githubUrl: "https://github.com/htr-tech/zphisher"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Repositorios RK13")),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: repos.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final repo = repos[index];
          return Card(
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              title: Text(repo.name, style: const TextStyle(color: Colors.white, fontSize: 18)),
              subtitle: Text(repo.description, style: const TextStyle(color: Colors.white70)),
              trailing: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Ver"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RepoReadmePage(
                      repoName: repo.name,
                      scriptFile: repo.scriptFile,
                      readmeAsset: repo.readmeAsset,
                      githubUrl: repo.githubUrl,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
