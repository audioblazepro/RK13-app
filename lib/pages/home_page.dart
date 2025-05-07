import 'package:flutter/material.dart';
import '../models/repo_model.dart';
import 'repo_readme_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<RepoModel> repos = [
    RepoModel(name: "Repo1", assetPath: "assets/scripts/repo1.sh", readmeAsset: "assets/readme/repo1.md", githubUrl: "https://github.com/user/repo1"),
    RepoModel(name: "Repo2", assetPath: "assets/scripts/repo2.sh", readmeAsset: "assets/readme/repo2.md", githubUrl: "https://github.com/user/repo2"),
    RepoModel(name: "Repo3", assetPath: "assets/scripts/repo3.sh", readmeAsset: "assets/readme/repo3.md", githubUrl: "https://github.com/user/repo3"),
    RepoModel(name: "Repo4", assetPath: "assets/scripts/repo4.sh", readmeAsset: "assets/readme/repo4.md", githubUrl: "https://github.com/user/repo4"),
    RepoModel(name: "Repo5", assetPath: "assets/scripts/repo5.sh", readmeAsset: "assets/readme/repo5.md", githubUrl: "https://github.com/user/repo5"),
    RepoModel(name: "Repo6", assetPath: "assets/scripts/repo6.sh", readmeAsset: "assets/readme/repo6.md", githubUrl: "https://github.com/user/repo6"),
    RepoModel(name: "Repo7", assetPath: "assets/scripts/repo7.sh", readmeAsset: "assets/readme/repo7.md", githubUrl: "https://github.com/user/repo7"),
    RepoModel(name: "Repo8", assetPath: "assets/scripts/repo8.sh", readmeAsset: "assets/readme/repo8.md", githubUrl: "https://github.com/user/repo8"),
    RepoModel(name: "Repo9", assetPath: "assets/scripts/repo9.sh", readmeAsset: "assets/readme/repo9.md", githubUrl: "https://github.com/user/repo9"),
    RepoModel(name: "Repo10", assetPath: "assets/scripts/repo10.sh", readmeAsset: "assets/readme/repo10.md", githubUrl: "https://github.com/user/repo10"),
    RepoModel(name: "Repo11", assetPath: "assets/scripts/repo11.sh", readmeAsset: "assets/readme/repo11.md", githubUrl: "https://github.com/user/repo11"),
    RepoModel(name: "Repo12", assetPath: "assets/scripts/repo12.sh", readmeAsset: "assets/readme/repo12.md", githubUrl: "https://github.com/user/repo12"),
    RepoModel(name: "Repo13", assetPath: "assets/scripts/repo13.sh", readmeAsset: "assets/readme/repo13.md", githubUrl: "https://github.com/user/repo13"),
    RepoModel(name: "Repo14", assetPath: "assets/scripts/repo14.sh", readmeAsset: "assets/readme/repo14.md", githubUrl: "https://github.com/user/repo14"),
    RepoModel(name: "Repo15", assetPath: "assets/scripts/repo15.sh", readmeAsset: "assets/readme/repo15.md", githubUrl: "https://github.com/user/repo15"),
    RepoModel(name: "Repo16", assetPath: "assets/scripts/repo16.sh", readmeAsset: "assets/readme/repo16.md", githubUrl: "https://github.com/user/repo16"),
    RepoModel(name: "Repo17", assetPath: "assets/scripts/repo17.sh", readmeAsset: "assets/readme/repo17.md", githubUrl: "https://github.com/user/repo17"),
    RepoModel(name: "Repo18", assetPath: "assets/scripts/repo18.sh", readmeAsset: "assets/readme/repo18.md", githubUrl: "https://github.com/user/repo18"),
    RepoModel(name: "Repo19", assetPath: "assets/scripts/repo19.sh", readmeAsset: "assets/readme/repo19.md", githubUrl: "https://github.com/user/repo19"),
    RepoModel(name: "Repo20", assetPath: "assets/scripts/repo20.sh", readmeAsset: "assets/readme/repo20.md", githubUrl: "https://github.com/user/repo20"),
    RepoModel(name: "Repo21", assetPath: "assets/scripts/repo21.sh", readmeAsset: "assets/readme/repo21.md", githubUrl: "https://github.com/user/repo21"),
    RepoModel(name: "Repo22", assetPath: "assets/scripts/repo22.sh", readmeAsset: "assets/readme/repo22.md", githubUrl: "https://github.com/user/repo22"),
    RepoModel(name: "Repo23", assetPath: "assets/scripts/repo23.sh", readmeAsset: "assets/readme/repo23.md", githubUrl: "https://github.com/user/repo23"),
    RepoModel(name: "Repo24", assetPath: "assets/scripts/repo24.sh", readmeAsset: "assets/readme/repo24.md", githubUrl: "https://github.com/user/repo24"),
    RepoModel(name: "Repo25", assetPath: "assets/scripts/repo25.sh", readmeAsset: "assets/readme/repo25.md", githubUrl: "https://github.com/user/repo25"),
    RepoModel(name: "Repo26", assetPath: "assets/scripts/repo26.sh", readmeAsset: "assets/readme/repo26.md", githubUrl: "https://github.com/user/repo26"),
    RepoModel(name: "Repo27", assetPath: "assets/scripts/repo27.sh", readmeAsset: "assets/readme/repo27.md", githubUrl: "https://github.com/user/repo27"),
    RepoModel(name: "Repo28", assetPath: "assets/scripts/repo28.sh", readmeAsset: "assets/readme/repo28.md", githubUrl: "https://github.com/user/repo28"),
    RepoModel(name: "Repo29", assetPath: "assets/scripts/repo29.sh", readmeAsset: "assets/readme/repo29.md", githubUrl: "https://github.com/user/repo29"),
    RepoModel(name: "Repo30", assetPath: "assets/scripts/repo30.sh", readmeAsset: "assets/readme/repo30.md", githubUrl: "https://github.com/user/repo30")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: repos.length,
      itemBuilder: (context, index) {
        final repo = repos[index];
        return Card(
          color: Colors.grey[900],
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(repo.name, style: const TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.redAccent),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RepoReadmePage(
                  repoName: repo.name,
                  assetPath: repo.assetPath,
                  readmeAsset: repo.readmeAsset,
                  installCommand: "bash ~/rk13-${repo.name.toLowerCase()}.sh",
                  githubUrl: repo.githubUrl,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
