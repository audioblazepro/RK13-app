import 'package:flutter/material.dart';
import '../models/repo_model.dart';
import 'repo_readme_page.dart';

class RepoListPage extends StatelessWidget {
  final List<RepoModel> repos;

  const RepoListPage({super.key, required this.repos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: repos.length,
      itemBuilder: (context, index) {
        final repo = repos[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.grey[900],
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            title: Text(
              repo.name,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            subtitle: Text(
              repo.description,
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: const Icon(Icons.arrow_forward, color: Colors.redAccent),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => RepoReadmePage(
                        repoName: repo.name,
                        scriptFile: repo.scriptFile,
                        readmeAsset: repo.readmeAsset,
                        githubUrl: repo.githubUrl,
                      ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
