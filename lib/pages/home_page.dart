import 'package:flutter/material.dart';
import '../models/repo_model.dart';
import 'repo_readme_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<RepoModel> repos = const [
    RepoModel(
      name: "NodeJS",
      assetPath: "assets/scripts/install_node.sh",
      readmeAsset: "assets/readme/nodejs.md",
      installCommand: "pkg update -y && pkg install nodejs -y",
      githubUrl: "https://github.com/nodejs/node"
    ),
    RepoModel(
      name: "Python",
      assetPath: "assets/scripts/install_python.sh",
      readmeAsset: "assets/readme/python.md",
      installCommand: "pkg update -y && pkg install python -y",
      githubUrl: "https://github.com/python/cpython"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🧠 RK13 Hacker UI")),
      body: ListView.builder(
        itemCount: repos.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final repo = repos[index];
          return Card(
            color: Colors.black87,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(repo.name, style: const TextStyle(color: Colors.greenAccent)),
              subtitle: Text("Tap para ver detalles", style: TextStyle(color: Colors.grey[400])),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.redAccent),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RepoReadmePage(
                      repoName: repo.name,
                      readmeAsset: repo.readmeAsset,
                      installCommand: repo.installCommand,
                      githubUrl: repo.githubUrl,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
