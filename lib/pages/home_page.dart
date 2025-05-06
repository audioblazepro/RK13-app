import 'package:flutter/material.dart';
import 'repo_readme_page.dart';

/// Modelo para representar un repositorio/tool
class Repo {
  final String name;

  const Repo({required this.name});
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Lista constante de herramientas/repositorios
  static const List<Repo> repos = [
    Repo(name: "RK13"),
    Repo(name: "ToolX"),
    Repo(name: "HackerPack"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Linux Terminal Tools"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.greenAccent,
        elevation: 0,
      ),
      body: ListView.separated(
        itemCount: repos.length,
        padding: const EdgeInsets.symmetric(vertical: 12),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final repo = repos[index];
          final repoId = repo.name.toLowerCase();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              color: Colors.grey[900],
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                title: Text(
                  repo.name,
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.greenAccent),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RepoReadmePage(
                        repoName: repo.name,
                        readmeAsset: 'assets/readmes/$repoId.md',
                        scriptAsset: 'assets/scripts/$repoId.sh',
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
