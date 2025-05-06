import 'package:flutter/material.dart';
import 'repo_readme_page.dart';

class Repo {
  final String name;

  Repo({required this.name});
}

class HomePage extends StatelessWidget {
  final List<Repo> repos = [
    Repo(name: "RK13"),
    Repo(name: "ToolX"),
    Repo(name: "HackerPack"),
  ];

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Linux Tools"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.greenAccent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: repos.length,
        itemBuilder: (context, index) {
          final repo = repos[index];

          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                repo.name,
                style: const TextStyle(color: Colors.greenAccent),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.greenAccent),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RepoReadmePage(
                      repoName: repo.name,
                      readmeAsset: 'assets/readmes/${repo.name.toLowerCase()}.md',
                      scriptAsset: 'assets/scripts/${repo.name.toLowerCase()}.sh',
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
