class RepoModel {
  final String name;
  final String description;
  final String scriptFile;
  final String readmeAsset;
  final String githubUrl;

  RepoModel({
    required this.name,
    required this.description,
    required this.scriptFile,
    required this.readmeAsset,
    required this.githubUrl,
  });
}
