import 'package:flutter/material.dart';
import '../models/repo_model.dart';
import 'repo_readme_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<RepoModel> repos = [
    RepoModel(
      name: "Aircrack NG",
      assetPath: "assets/scripts/aircrack-ng.sh",
      readmeAsset: "assets/readmes/aircrack-ng.md",
      githubUrl: "https://github.com/rk13termux/aircrack-ng",
    ),
    RepoModel(
      name: "Beef",
      assetPath: "assets/scripts/beef.sh",
      readmeAsset: "assets/readmes/beef.md",
      githubUrl: "https://github.com/rk13termux/beef",
    ),
    RepoModel(
      name: "Burpsuite",
      assetPath: "assets/scripts/burpsuite.sh",
      readmeAsset: "assets/readmes/burpsuite.md",
      githubUrl: "https://github.com/rk13termux/burpsuite",
    ),
    RepoModel(
      name: "Dirb",
      assetPath: "assets/scripts/dirb.sh",
      readmeAsset: "assets/readmes/dirb.md",
      githubUrl: "https://github.com/rk13termux/dirb",
    ),
    RepoModel(
      name: "Dnsenum",
      assetPath: "assets/scripts/dnsenum.sh",
      readmeAsset: "assets/readmes/dnsenum.md",
      githubUrl: "https://github.com/rk13termux/dnsenum",
    ),
    RepoModel(
      name: "Ettercap",
      assetPath: "assets/scripts/ettercap.sh",
      readmeAsset: "assets/readmes/ettercap.md",
      githubUrl: "https://github.com/rk13termux/ettercap",
    ),
    RepoModel(
      name: "Fierce",
      assetPath: "assets/scripts/fierce.sh",
      readmeAsset: "assets/readmes/fierce.md",
      githubUrl: "https://github.com/rk13termux/fierce",
    ),
    RepoModel(
      name: "Ghostphisher",
      assetPath: "assets/scripts/ghostphisher.sh",
      readmeAsset: "assets/readmes/ghostphisher.md",
      githubUrl: "https://github.com/rk13termux/ghostphisher",
    ),
    RepoModel(
      name: "Hashcat",
      assetPath: "assets/scripts/hashcat.sh",
      readmeAsset: "assets/readmes/hashcat.md",
      githubUrl: "https://github.com/rk13termux/hashcat",
    ),
    RepoModel(
      name: "Hydra",
      assetPath: "assets/scripts/hydra.sh",
      readmeAsset: "assets/readmes/hydra.md",
      githubUrl: "https://github.com/rk13termux/hydra",
    ),
    RepoModel(
      name: "John The Ripper",
      assetPath: "assets/scripts/johntheripper.sh",
      readmeAsset: "assets/readmes/johntheripper.md",
      githubUrl: "https://github.com/rk13termux/johntheripper",
    ),
    RepoModel(
      name: "Maltego",
      assetPath: "assets/scripts/maltego.sh",
      readmeAsset: "assets/readmes/maltego.md",
      githubUrl: "https://github.com/rk13termux/maltego",
    ),
    RepoModel(
      name: "Metasploit",
      assetPath: "assets/scripts/metasploit.sh",
      readmeAsset: "assets/readmes/metasploit.md",
      githubUrl: "https://github.com/rk13termux/metasploit",
    ),
    RepoModel(
      name: "Netcat",
      assetPath: "assets/scripts/netcat.sh",
      readmeAsset: "assets/readmes/netcat.md",
      githubUrl: "https://github.com/rk13termux/netcat",
    ),
    RepoModel(
      name: "Nikto",
      assetPath: "assets/scripts/nikto.sh",
      readmeAsset: "assets/readmes/nikto.md",
      githubUrl: "https://github.com/rk13termux/nikto",
    ),
    RepoModel(
      name: "Nmap",
      assetPath: "assets/scripts/nmap.sh",
      readmeAsset: "assets/readmes/nmap.md",
      githubUrl: "https://github.com/rk13termux/nmap",
    ),
    RepoModel(
      name: "Recon NG",
      assetPath: "assets/scripts/recon-ng.sh",
      readmeAsset: "assets/readmes/recon-ng.md",
      githubUrl: "https://github.com/rk13termux/recon-ng",
    ),
    RepoModel(
      name: "RedHawk",
      assetPath: "assets/scripts/redhawk.sh",
      readmeAsset: "assets/readmes/redhawk.md",
      githubUrl: "https://github.com/rk13termux/redhawk",
    ),
    RepoModel(
      name: "Setoolkit",
      assetPath: "assets/scripts/setoolkit.sh",
      readmeAsset: "assets/readmes/setoolkit.md",
      githubUrl: "https://github.com/rk13termux/setoolkit",
    ),
    RepoModel(
      name: "Slowloris",
      assetPath: "assets/scripts/slowloris.sh",
      readmeAsset: "assets/readmes/slowloris.md",
      githubUrl: "https://github.com/rk13termux/slowloris",
    ),
    RepoModel(
      name: "SocialFish",
      assetPath: "assets/scripts/socialfish.sh",
      readmeAsset: "assets/readmes/socialfish.md",
      githubUrl: "https://github.com/rk13termux/socialfish",
    ),
    RepoModel(
      name: "Sqlmap",
      assetPath: "assets/scripts/sqlmap.sh",
      readmeAsset: "assets/readmes/sqlmap.md",
      githubUrl: "https://github.com/rk13termux/sqlmap",
    ),
    RepoModel(
      name: "Tcpdump",
      assetPath: "assets/scripts/tcpdump.sh",
      readmeAsset: "assets/readmes/tcpdump.md",
      githubUrl: "https://github.com/rk13termux/tcpdump",
    ),
    RepoModel(
      name: "TheHarvester",
      assetPath: "assets/scripts/theharvester.sh",
      readmeAsset: "assets/readmes/theharvester.md",
      githubUrl: "https://github.com/rk13termux/theharvester",
    ),
    RepoModel(
      name: "Trity",
      assetPath: "assets/scripts/trity.sh",
      readmeAsset: "assets/readmes/trity.md",
      githubUrl: "https://github.com/rk13termux/trity",
    ),
    RepoModel(
      name: "Wireshark",
      assetPath: "assets/scripts/wireshark.sh",
      readmeAsset: "assets/readmes/wireshark.md",
      githubUrl: "https://github.com/rk13termux/wireshark",
    ),
    RepoModel(
      name: "Wpscan",
      assetPath: "assets/scripts/wpscan.sh",
      readmeAsset: "assets/readmes/wpscan.md",
      githubUrl: "https://github.com/rk13termux/wpscan",
    ),
    RepoModel(
      name: "Xerosploit",
      assetPath: "assets/scripts/xerosploit.sh",
      readmeAsset: "assets/readmes/xerosploit.md",
      githubUrl: "https://github.com/rk13termux/xerosploit",
    ),
    RepoModel(
      name: "Yersinia",
      assetPath: "assets/scripts/yersinia.sh",
      readmeAsset: "assets/readmes/yersinia.md",
      githubUrl: "https://github.com/rk13termux/yersinia",
    ),
    RepoModel(
      name: "Zphisher",
      assetPath: "assets/scripts/zphisher.sh",
      readmeAsset: "assets/readmes/zphisher.md",
      githubUrl: "https://github.com/rk13termux/zphisher",
    ),
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
                      assetPath: repo.assetPath,
                      readmeAsset: repo.readmeAsset,
                      githubUrl: repo.githubUrl,
                      installCommand: "bash ~/${repo.assetPath.split('/').last}",
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
