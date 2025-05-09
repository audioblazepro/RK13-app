// models/repo_model.dart

class RepoModel {
  final String name;
  final String description;
  final String scriptFile;
  final String githubUrl;

  RepoModel({
    required this.name,
    required this.description,
    required this.scriptFile,
    required this.githubUrl,
  });
}
