import 'package:flutter/material.dart';
import 'package:rk13/models/repo_model.dart';
import 'package:rk13/pages/repo_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repos = [
      RepoModel(
        name: "Aircrack-ng",
        scriptFile: "aircrack-ng.sh",
        readmeAsset: "assets/markdown/aircrack-ng.md",
        description: "Herramienta de cracking de claves WEP y WPA",
        githubUrl: "https://github.com/Rk13termux/aircrack-ng",
      ),
      RepoModel(
        name: "BeEF",
        scriptFile: "beef.sh",
        readmeAsset: "assets/markdown/beef.md",
        description: "Framework de explotación en navegador",
        githubUrl: "https://github.com/Rk13termux/beef",
      ),
      RepoModel(
        name: "Burp Suite",
        scriptFile: "burpsuite.sh",
        readmeAsset: "assets/markdown/burpsuite.md",
        description: "Proxy para pruebas de seguridad web",
        githubUrl: "https://github.com/Rk13termux/burpsuite",
      ),
      RepoModel(
        name: "Dirb",
        scriptFile: "dirb.sh",
        readmeAsset: "assets/markdown/dirb.md",
        description: "Buscador de directorios web",
        githubUrl: "https://github.com/Rk13termux/dirb",
      ),
      RepoModel(
        name: "Dnsenum",
        scriptFile: "dnsenum.sh",
        readmeAsset: "assets/markdown/dnsenum.md",
        description: "Enumeración de DNS",
        githubUrl: "https://github.com/Rk13termux/dnsenum",
      ),
      RepoModel(
        name: "Ettercap",
        scriptFile: "ettercap.sh",
        readmeAsset: "assets/markdown/ettercap.md",
        description: "Herramienta de sniffing en redes LAN",
        githubUrl: "https://github.com/Rk13termux/ettercap",
      ),
      RepoModel(
        name: "Fierce",
        scriptFile: "fierce.sh",
        readmeAsset: "assets/markdown/fierce.md",
        description: "Escáner DNS para mapeo de red",
        githubUrl: "https://github.com/Rk13termux/fierce",
      ),
      RepoModel(
        name: "Ghost Phisher",
        scriptFile: "ghostphisher.sh",
        readmeAsset: "assets/markdown/ghostphisher.md",
        description: "Ataques de phishing",
        githubUrl: "https://github.com/Rk13termux/ghostphisher",
      ),
      RepoModel(
        name: "Hashcat",
        scriptFile: "hashcat.sh",
        readmeAsset: "assets/markdown/hashcat.md",
        description: "Cracking de contraseñas por GPU",
        githubUrl: "https://github.com/Rk13termux/hashcat",
      ),
      RepoModel(
        name: "Hydra",
        scriptFile: "hydra.sh",
        readmeAsset: "assets/markdown/hydra.md",
        description: "Fuerza bruta de login remoto",
        githubUrl: "https://github.com/Rk13termux/hydra",
      ),
      RepoModel(
        name: "John The Ripper",
        scriptFile: "johntheripper.sh",
        readmeAsset: "assets/markdown/johntheripper.md",
        description: "Cracker de contraseñas",
        githubUrl: "https://github.com/Rk13termux/johntheripper",
      ),
      RepoModel(
        name: "Maltego",
        scriptFile: "maltego.sh",
        readmeAsset: "assets/markdown/maltego.md",
        description: "Análisis de relaciones y minería de datos",
        githubUrl: "https://github.com/Rk13termux/maltego",
      ),
      RepoModel(
        name: "Metasploit",
        scriptFile: "metasploit.sh",
        readmeAsset: "assets/markdown/metasploit.md",
        description: "Framework de explotación",
        githubUrl: "https://github.com/Rk13termux/metasploit",
      ),
      RepoModel(
        name: "Netcat",
        scriptFile: "netcat.sh",
        readmeAsset: "assets/markdown/netcat.md",
        description: "Herramienta de red universal",
        githubUrl: "https://github.com/Rk13termux/netcat",
      ),
      RepoModel(
        name: "Nikto",
        scriptFile: "nikto.sh",
        readmeAsset: "assets/markdown/nikto.md",
        description: "Escáner de vulnerabilidades web",
        githubUrl: "https://github.com/Rk13termux/nikto",
      ),
      RepoModel(
        name: "Nmap",
        scriptFile: "nmap.sh",
        readmeAsset: "assets/markdown/nmap.md",
        description: "Escáner de red",
        githubUrl: "https://github.com/Rk13termux/nmap",
      ),
      RepoModel(
        name: "Recon-ng",
        scriptFile: "recon-ng.sh",
        readmeAsset: "assets/markdown/recon-ng.md",
        description: "Framework de reconocimiento web",
        githubUrl: "https://github.com/Rk13termux/recon-ng",
      ),
      RepoModel(
        name: "RedHawk",
        scriptFile: "redhawk.sh",
        readmeAsset: "assets/markdown/redhawk.md",
        description: "Herramienta all-in-one para reconocimiento web",
        githubUrl: "https://github.com/Rk13termux/redhawk",
      ),
      RepoModel(
        name: "SET Toolkit",
        scriptFile: "setoolkit.sh",
        readmeAsset: "assets/markdown/setoolkit.md",
        description: "Toolkit de ingeniería social",
        githubUrl: "https://github.com/Rk13termux/setoolkit",
      ),
      RepoModel(
        name: "Slowloris",
        scriptFile: "slowloris.sh",
        readmeAsset: "assets/markdown/slowloris.md",
        description: "Ataques DoS a servidores web",
        githubUrl: "https://github.com/Rk13termux/slowloris",
      ),
      RepoModel(
        name: "SocialFish",
        scriptFile: "socialfish.sh",
        readmeAsset: "assets/markdown/socialfish.md",
        description: "Herramienta de phishing",
        githubUrl: "https://github.com/Rk13termux/socialfish",
      ),
      RepoModel(
        name: "SQLMap",
        scriptFile: "sqlmap.sh",
        readmeAsset: "assets/markdown/sqlmap.md",
        description: "Herramienta de inyección SQL",
        githubUrl: "https://github.com/Rk13termux/sqlmap",
      ),
      RepoModel(
        name: "TCPDump",
        scriptFile: "tcpdump.sh",
        readmeAsset: "assets/markdown/tcpdump.md",
        description: "Análisis de tráfico de red",
        githubUrl: "https://github.com/Rk13termux/tcpdump",
      ),
      RepoModel(
        name: "The Harvester",
        scriptFile: "theharvester.sh",
        readmeAsset: "assets/markdown/theharvester.md",
        description: "Recolección de correos y hosts",
        githubUrl: "https://github.com/Rk13termux/theharvester",
      ),
      RepoModel(
        name: "Trity",
        scriptFile: "trity.sh",
        readmeAsset: "assets/markdown/trity.md",
        description: "Framework de hacking",
        githubUrl: "https://github.com/Rk13termux/trity",
      ),
      RepoModel(
        name: "Wireshark",
        scriptFile: "wireshark.sh",
        readmeAsset: "assets/markdown/wireshark.md",
        description: "Analizador de protocolos de red",
        githubUrl: "https://github.com/Rk13termux/wireshark",
      ),
      RepoModel(
        name: "WPScan",
        scriptFile: "wpscan.sh",
        readmeAsset: "assets/markdown/wpscan.md",
        description: "Escáner de vulnerabilidades de WordPress",
        githubUrl: "https://github.com/Rk13termux/wpscan",
      ),
      RepoModel(
        name: "Xerosploit",
        scriptFile: "xerosploit.sh",
        readmeAsset: "assets/markdown/xerosploit.md",
        description: "Suite de ataque de red",
        githubUrl: "https://github.com/Rk13termux/xerosploit",
      ),
      RepoModel(
        name: "Yersinia",
        scriptFile: "yersinia.sh",
        readmeAsset: "assets/markdown/yersinia.md",
        description: "Ataques en redes LAN",
        githubUrl: "https://github.com/Rk13termux/yersinia",
      ),
      RepoModel(
        name: "Zphisher",
        scriptFile: "zphisher.sh",
        readmeAsset: "assets/markdown/zphisher.md",
        description: "Herramienta de phishing automatizada",
        githubUrl: "https://github.com/Rk13termux/zphisher",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("RK13 Repos", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
      ),
      body: RepoListPage(repos: repos),
    );
  }
}
