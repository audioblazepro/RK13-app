import 'package:flutter/material.dart';
import '../models/repo_model.dart';
import 'repo_readme_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<RepoModel> repos = [
    RepoModel(
      name: "NodeJS",
      assetPath: "assets/scripts/install_node.sh",
      readme: "assets/readme/nodejs.md",
      installCommand: "bash ~/rk13-nodejs.sh",
      githubUrl: "https://github.com/nodejs/node",
    ),
    RepoModel(
      name: "Python",
      assetPath: "assets/scripts/install_python.sh",
      readme: "assets/readme/python.md",
      installCommand: "bash ~/rk13-python.sh",
      githubUrl: "https://github.com/python/cpython",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("RK13 - Repos"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: repos.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final repo = repos[index];
          return Card(
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              title: Text(
                repo.name,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: ElevatedButton.icon(
                icon: const Icon(Icons.info_outline),
                label: const Text("Ver"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RepoReadmePage(
                        repoName: repo.name,
                        assetPath: repo.assetPath,
                        readmeAsset: repo.readme,
                        installCommand: repo.installCommand,
                        githubUrl: repo.githubUrl,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
