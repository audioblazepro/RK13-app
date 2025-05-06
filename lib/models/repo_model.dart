class RepoModel {
  final String name;
  final String assetPath;
  final String readmeAsset;
  final String installCommand;
  final String githubUrl;

  RepoModel({
    required this.name,
    required this.assetPath,
    required this.readmeAsset,
    required this.installCommand,
    required this.githubUrl,
  });
}
