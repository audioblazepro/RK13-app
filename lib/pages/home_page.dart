import 'package:flutter/material.dart';
import '../models/repo_model.dart';
import 'repo_readme_page.dart';

class HomePage extends StatelessWidget {
  final List<RepoModel> repos = [
    RepoModel(name: "Aircrack-ng", scriptFile: "aircrack-ng.sh", githubUrl: "https://github.com/Rk13termux/aircrack-ng"),
    RepoModel(name: "BeEF", scriptFile: "beef.sh", githubUrl: "https://github.com/Rk13termux/beef"),
    RepoModel(name: "Burp Suite", scriptFile: "burpsuite.sh", githubUrl: "https://github.com/Rk13termux/burpsuite"),
    RepoModel(name: "Dirb", scriptFile: "dirb.sh", githubUrl: "https://github.com/Rk13termux/dirb"),
    RepoModel(name: "Dnsenum", scriptFile: "dnsenum.sh", githubUrl: "https://github.com/Rk13termux/dnsenum"),
    RepoModel(name: "Ettercap", scriptFile: "ettercap.sh", githubUrl: "https://github.com/Rk13termux/ettercap"),
    RepoModel(name: "Fierce", scriptFile: "fierce.sh", githubUrl: "https://github.com/Rk13termux/fierce"),
    RepoModel(name: "Ghost Phisher", scriptFile: "ghostphisher.sh", githubUrl: "https://github.com/Rk13termux/ghostphisher"),
    RepoModel(name: "Hashcat", scriptFile: "hashcat.sh", githubUrl: "https://github.com/Rk13termux/hashcat"),
    RepoModel(name: "Hydra", scriptFile: "hydra.sh", githubUrl: "https://github.com/Rk13termux/hydra"),
    RepoModel(name: "John The Ripper", scriptFile: "johntheripper.sh", githubUrl: "https://github.com/Rk13termux/johntheripper"),
    RepoModel(name: "Maltego", scriptFile: "maltego.sh", githubUrl: "https://github.com/Rk13termux/maltego"),
    RepoModel(name: "Metasploit", scriptFile: "metasploit.sh", githubUrl: "https://github.com/Rk13termux/metasploit"),
    RepoModel(name: "Netcat", scriptFile: "netcat.sh", githubUrl: "https://github.com/Rk13termux/netcat"),
    RepoModel(name: "Nikto", scriptFile: "nikto.sh", githubUrl: "https://github.com/Rk13termux/nikto"),
    RepoModel(name: "Nmap", scriptFile: "nmap.sh", githubUrl: "https://github.com/Rk13termux/nmap"),
    RepoModel(name: "Recon-ng", scriptFile: "recon-ng.sh", githubUrl: "https://github.com/Rk13termux/recon-ng"),
    RepoModel(name: "RedHawk", scriptFile: "redhawk.sh", githubUrl: "https://github.com/Rk13termux/redhawk"),
    RepoModel(name: "SET Toolkit", scriptFile: "setoolkit.sh", githubUrl: "https://github.com/Rk13termux/setoolkit"),
    RepoModel(name: "Slowloris", scriptFile: "slowloris.sh", githubUrl: "https://github.com/Rk13termux/slowloris"),
    RepoModel(name: "SocialFish", scriptFile: "socialfish.sh", githubUrl: "https://github.com/Rk13termux/socialfish"),
    RepoModel(name: "SQLMap", scriptFile: "sqlmap.sh", githubUrl: "https://github.com/Rk13termux/sqlmap"),
    RepoModel(name: "TCPDump", scriptFile: "tcpdump.sh", githubUrl: "https://github.com/Rk13termux/tcpdump"),
    RepoModel(name: "The Harvester", scriptFile: "theharvester.sh", githubUrl: "https://github.com/Rk13termux/theharvester"),
    RepoModel(name: "Trity", scriptFile: "trity.sh", githubUrl: "https://github.com/Rk13termux/trity"),
    RepoModel(name: "Wireshark", scriptFile: "wireshark.sh", githubUrl: "https://github.com/Rk13termux/wireshark"),
    RepoModel(name: "WPScan", scriptFile: "wpscan.sh", githubUrl: "https://github.com/Rk13termux/wpscan"),
    RepoModel(name: "Xerosploit", scriptFile: "xerosploit.sh", githubUrl: "https://github.com/Rk13termux/xerosploit"),
    RepoModel(name: "Yersinia", scriptFile: "yersinia.sh", githubUrl: "https://github.com/Rk13termux/yersinia"),
    RepoModel(name: "Zphisher", scriptFile: "zphisher.sh", githubUrl: "https://github.com/Rk13termux/zphisher"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('RK13 Tools', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        separatorBuilder: (_, __) => const Divider(color: Colors.grey),
        itemCount: repos.length,
        itemBuilder: (_, index) {
          final repo = repos[index];
          return ListTile(
            title: Text(repo.name, style: const TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
            tileColor: Colors.grey[900],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RepoReadmePage(
                    repoName: repo.name,
                    scriptAssetPath: 'assets/scripts/${repo.scriptFile}',
                    readmeAsset: 'assets/readmes/${repo.scriptFile.replaceAll(".sh", ".md")}',
                    githubUrl: repo.githubUrl,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
