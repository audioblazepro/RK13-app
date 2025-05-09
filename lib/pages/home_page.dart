import 'package:flutter/material.dart';
import '../models/repo_model.dart';
import 'repo_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repos = [
      RepoModel(
        name: "Aircrack-ng",
        description: "Cracking de claves WEP/WPA.",
        scriptFile: "aircrack-ng.sh",
        githubUrl: "https://github.com/Rk13termux/aircrack-ng",
      ),
      RepoModel(
        name: "BeEF",
        description: "Exploit de navegadores.",
        scriptFile: "beef.sh",
        githubUrl: "https://github.com/Rk13termux/beef",
      ),
      RepoModel(
        name: "Burp Suite",
        description: "Suite para pruebas de seguridad web.",
        scriptFile: "burpsuite.sh",
        githubUrl: "https://github.com/Rk13termux/burpsuite",
      ),
      RepoModel(
        name: "Dirb",
        description: "Herramienta de fuerza bruta para directorios web.",
        scriptFile: "dirb.sh",
        githubUrl: "https://github.com/Rk13termux/dirb",
      ),
      RepoModel(
        name: "Dnsenum",
        description: "Recolección de información DNS.",
        scriptFile: "dnsenum.sh",
        githubUrl: "https://github.com/Rk13termux/dnsenum",
      ),
      RepoModel(
        name: "Ettercap",
        description: "Sniffer/interceptor de tráfico.",
        scriptFile: "ettercap.sh",
        githubUrl: "https://github.com/Rk13termux/ettercap",
      ),
      RepoModel(
        name: "Fierce",
        description: "Escáner de DNS.",
        scriptFile: "fierce.sh",
        githubUrl: "https://github.com/Rk13termux/fierce",
      ),
      RepoModel(
        name: "Ghost Phisher",
        description: "Herramienta de phishing.",
        scriptFile: "ghostphisher.sh",
        githubUrl: "https://github.com/Rk13termux/ghostphisher",
      ),
      RepoModel(
        name: "Hashcat",
        description: "Crackeo de contraseñas por GPU.",
        scriptFile: "hashcat.sh",
        githubUrl: "https://github.com/Rk13termux/hashcat",
      ),
      RepoModel(
        name: "Hydra",
        description: "Fuerza bruta de servicios remotos.",
        scriptFile: "hydra.sh",
        githubUrl: "https://github.com/Rk13termux/hydra",
      ),
      RepoModel(
        name: "John The Ripper",
        description: "Crackeo de contraseñas.",
        scriptFile: "johntheripper.sh",
        githubUrl: "https://github.com/Rk13termux/johntheripper",
      ),
      RepoModel(
        name: "Maltego",
        description: "Recolección de información.",
        scriptFile: "maltego.sh",
        githubUrl: "https://github.com/Rk13termux/maltego",
      ),
      RepoModel(
        name: "Metasploit",
        description: "Framework de explotación.",
        scriptFile: "metasploit.sh",
        githubUrl: "https://github.com/Rk13termux/metasploit",
      ),
      RepoModel(
        name: "Netcat",
        description: "Utilidad de red versátil.",
        scriptFile: "netcat.sh",
        githubUrl: "https://github.com/Rk13termux/netcat",
      ),
      RepoModel(
        name: "Nikto",
        description: "Escáner de vulnerabilidades web.",
        scriptFile: "nikto.sh",
        githubUrl: "https://github.com/Rk13termux/nikto",
      ),
      RepoModel(
        name: "Nmap",
        description: "Escaneo de redes.",
        scriptFile: "nmap.sh",
        githubUrl: "https://github.com/Rk13termux/nmap",
      ),
      RepoModel(
        name: "Recon-ng",
        description: "Framework de recolección de información.",
        scriptFile: "recon-ng.sh",
        githubUrl: "https://github.com/Rk13termux/recon-ng",
      ),
      RepoModel(
        name: "RedHawk",
        description: "Herramienta de escaneo web.",
        scriptFile: "redhawk.sh",
        githubUrl: "https://github.com/Rk13termux/redhawk",
      ),
      RepoModel(
        name: "SET Toolkit",
        description: "Herramientas de ingeniería social.",
        scriptFile: "setoolkit.sh",
        githubUrl: "https://github.com/Rk13termux/setoolkit",
      ),
      RepoModel(
        name: "Slowloris",
        description: "Ataques de denegación de servicio.",
        scriptFile: "slowloris.sh",
        githubUrl: "https://github.com/Rk13termux/slowloris",
      ),
      RepoModel(
        name: "SocialFish",
        description: "Herramienta de phishing.",
        scriptFile: "socialfish.sh",
        githubUrl: "https://github.com/Rk13termux/socialfish",
      ),
      RepoModel(
        name: "SQLMap",
        description: "Explotación de inyecciones SQL.",
        scriptFile: "sqlmap.sh",
        githubUrl: "https://github.com/Rk13termux/sqlmap",
      ),
      RepoModel(
        name: "TCPDump",
        description: "Análisis de paquetes en red.",
        scriptFile: "tcpdump.sh",
        githubUrl: "https://github.com/Rk13termux/tcpdump",
      ),
      RepoModel(
        name: "The Harvester",
        description: "Recolector de correos y dominios.",
        scriptFile: "theharvester.sh",
        githubUrl: "https://github.com/Rk13termux/theharvester",
      ),
      RepoModel(
        name: "Trity",
        description: "Framework de pentesting.",
        scriptFile: "trity.sh",
        githubUrl: "https://github.com/Rk13termux/trity",
      ),
      RepoModel(
        name: "Wireshark",
        description: "Captura y análisis de tráfico.",
        scriptFile: "wireshark.sh",
        githubUrl: "https://github.com/Rk13termux/wireshark",
      ),
      RepoModel(
        name: "WPScan",
        description: "Escaneo de vulnerabilidades en WordPress.",
        scriptFile: "wpscan.sh",
        githubUrl: "https://github.com/Rk13termux/wpscan",
      ),
      RepoModel(
        name: "Xerosploit",
        description: "Ataques MITM y análisis de red.",
        scriptFile: "xerosploit.sh",
        githubUrl: "https://github.com/Rk13termux/xerosploit",
      ),
      RepoModel(
        name: "Yersinia",
        description: "Ataques a redes de capa 2.",
        scriptFile: "yersinia.sh",
        githubUrl: "https://github.com/Rk13termux/yersinia",
      ),
      RepoModel(
        name: "Zphisher",
        description: "Herramienta de phishing automatizada.",
        scriptFile: "zphisher.sh",
        githubUrl: "https://github.com/Rk13termux/zphisher",
      ),
    ];

    return RepoListPage(repos: repos);
  }
}
