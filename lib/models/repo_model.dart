class RepoModel {
  final String name;
  final String assetPath;
  final String readme;
  final String installCommand;
  final String githubUrl;

  RepoModel({
    required this.name,
    required this.assetPath,
    required this.readme,
    required this.installCommand,
    required this.githubUrl,
  });
}
