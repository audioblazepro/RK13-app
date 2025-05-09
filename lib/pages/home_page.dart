import 'package:flutter/material.dart';
import '../models/repo_model.dart';
import 'repo_readme_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<RepoModel> repos = [
    RepoModel(
      name: "Nmap",
      scriptFile: "nmap.sh",
      readmeAsset: "assets/readmes/nmap.md",
      githubUrl: "https://github.com/nmap/nmap",
    ),
    RepoModel(
      name: "Hydra",
      scriptFile: "hydra.sh",
      readmeAsset: "assets/readmes/hydra.md",
      githubUrl: "https://github.com/vanhauser-thc/thc-hydra",
    ),
    RepoModel(
      name: "Metasploit",
      scriptFile: "metasploit.sh",
      readmeAsset: "assets/readmes/metasploit.md",
      githubUrl: "https://github.com/rapid7/metasploit-framework",
    ),
    RepoModel(
      name: "Sqlmap",
      scriptFile: "sqlmap.sh",
      readmeAsset: "assets/readmes/sqlmap.md",
      githubUrl: "https://github.com/sqlmapproject/sqlmap"),
    RepoModel(
      name: "Recon-ng",
      scriptFile: "reconng.sh",
      readmeAsset: "assets/readmes/reconng.md", 
      githubUrl: "https://github.com/lanmaster53/recon-ng"),
    RepoModel(
      name: "Nikto",
      scriptFile: "nikto.sh", 
      readmeAsset: "assets/readmes/nikto.md", githubUrl: "https://github.com/sullo/nikto"),
    RepoModel(name: "Setoolkit", scriptFile: "setoolkit.sh", readmeAsset: "assets/readmes/setoolkit.md", githubUrl: "https://github.com/trustedsec/social-engineer-toolkit"),
    RepoModel(name: "Wifite", scriptFile: "wifite.sh", readmeAsset: "assets/readmes/wifite.md", githubUrl: "https://github.com/derv82/wifite"),
    RepoModel(name: "Aircrack-ng", scriptFile: "aircrack.sh", readmeAsset: "assets/readmes/aircrack.md", githubUrl: "https://github.com/aircrack-ng/aircrack-ng"),
    RepoModel(name: "JohnTheRipper", scriptFile: "john.sh", readmeAsset: "assets/readmes/john.md", githubUrl: "https://github.com/openwall/john"),
    RepoModel(name: "Hashcat", scriptFile: "hashcat.sh", readmeAsset: "assets/readmes/hashcat.md", githubUrl: "https://github.com/hashcat/hashcat"),
    RepoModel(name: "Dirb", scriptFile: "dirb.sh", readmeAsset: "assets/readmes/dirb.md", githubUrl: "https://github.com/v0re/dirb"),
    RepoModel(name: "TheHarvester", scriptFile: "harvester.sh", readmeAsset: "assets/readmes/harvester.md", githubUrl: "https://github.com/laramies/theHarvester"),
    RepoModel(name: "Dnsenum", scriptFile: "dnsenum.sh", readmeAsset: "assets/readmes/dnsenum.md", githubUrl: "https://github.com/fwaeytens/dnsenum"),
    RepoModel(name: "Dnsmap", scriptFile: "dnsmap.sh", readmeAsset: "assets/readmes/dnsmap.md", githubUrl: "https://github.com/makefu/dnsmap"),
    RepoModel(name: "Amass", scriptFile: "amass.sh", readmeAsset: "assets/readmes/amass.md", githubUrl: "https://github.com/owasp-amass/amass"),
    RepoModel(name: "Sublist3r", scriptFile: "sublist3r.sh", readmeAsset: "assets/readmes/sublist3r.md", githubUrl: "https://github.com/aboul3la/Sublist3r"),
    RepoModel(name: "XSStrike", scriptFile: "xsstrike.sh", readmeAsset: "assets/readmes/xsstrike.md", githubUrl: "https://github.com/s0md3v/XSStrike"),
    RepoModel(name: "Wpscan", scriptFile: "wpscan.sh", readmeAsset: "assets/readmes/wpscan.md", githubUrl: "https://github.com/wpscanteam/wpscan"),
    RepoModel(name: "Ffuf", scriptFile: "ffuf.sh", readmeAsset: "assets/readmes/ffuf.md", githubUrl: "https://github.com/ffuf/ffuf"),
    RepoModel(name: "Gobuster", scriptFile: "gobuster.sh", readmeAsset: "assets/readmes/gobuster.md", githubUrl: "https://github.com/OJ/gobuster"),
    RepoModel(name: "Zmap", scriptFile: "zmap.sh", readmeAsset: "assets/readmes/zmap.md", githubUrl: "https://github.com/zmap/zmap"),
    RepoModel(name: "Masscan", scriptFile: "masscan.sh", readmeAsset: "assets/readmes/masscan.md", githubUrl: "https://github.com/robertdavidgraham/masscan"),
    RepoModel(name: "Netcat", scriptFile: "netcat.sh", readmeAsset: "assets/readmes/netcat.md", githubUrl: "https://github.com/diegocr/netcat"),
    RepoModel(name: "Socat", scriptFile: "socat.sh", readmeAsset: "assets/readmes/socat.md", githubUrl: "https://github.com/yoe/socat"),
    RepoModel(name: "Bettercap", scriptFile: "bettercap.sh", readmeAsset: "assets/readmes/bettercap.md", githubUrl: "https://github.com/bettercap/bettercap"),
    RepoModel(name: "Evilginx2", scriptFile: "evilginx.sh", readmeAsset: "assets/readmes/evilginx.md", githubUrl: "https://github.com/kgretzky/evilginx2"),
    RepoModel(name: "BeEF", scriptFile: "beef.sh", readmeAsset: "assets/readmes/beef.md", githubUrl: "https://github.com/beefproject/beef"),
    RepoModel(name: "PhoneInfoga", scriptFile: "phoneinfoga.sh", readmeAsset: "assets/readmes/phoneinfoga.md", githubUrl: "https://github.com/sundowndev/phoneinfoga"),
    RepoModel(name: "Sherlock", scriptFile: "sherlock.sh", readmeAsset: "assets/readmes/sherlock.md", githubUrl: "https://github.com/sherlock-project/sherlock"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Repositorios RK13"),
      ),
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
              title: Text(
                repo.name,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Ver"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
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
