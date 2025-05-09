import 'package:flutter/material.dart';
import 'package:rk13/models/repo_model.dart';
import 'package:rk13/pages/repo_readme_page.dart';

class RepoListPage extends StatelessWidget {
  final List<RepoModel> repos;

  const RepoListPage({super.key, required this.repos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: repos.length,
      itemBuilder: (context, index) {
        final repo = repos[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            tileColor: Colors.grey[850],
            title: Text(repo.name, style: const TextStyle(color: Colors.white)),
            subtitle: Text(repo.description, style: const TextStyle(color: Colors.white70)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RepoReadmePage(
                    repoName: repo.name,
                    scriptAssetPath: 'assets/scripts/${repo.scriptFile}',
                    readmeAsset: 'assets/readmes/${repo.scriptFile.replaceAll('.sh', '.md')}',
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
