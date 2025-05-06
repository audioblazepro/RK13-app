import 'package:flutter/material.dart';
import '../models/repo_model.dart';
import 'repo_readme_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<RepoModel> repos = [
    RepoModel(
      name: "NodeJS",
      assetPath: "assets/scripts/install_node.sh",
      readmeAsset: "assets/readme/nodejs.md",
      installCommand: "bash ~/rk13-nodejs.sh",
      githubUrl: "https://github.com/nodejs/node",
    ),
    RepoModel(
      name: "Python",
      assetPath: "assets/scripts/install_python.sh",
      readmeAsset: "assets/readme/python.md",
      installCommand: "bash ~/rk13-python.sh",
      githubUrl: "https://github.com/python/cpython",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("RK13 Repositorios"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: repos.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final repo = repos[index];
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: Duration(milliseconds: 400 + (index * 100)),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                title: Text(
                  repo.name,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                subtitle: Text(
                  "Tap para ver detalles",
                  style: TextStyle(color: Colors.grey[400], fontSize: 13),
                ),
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
            ),
          );
        },
      ),
    );
  }
}
