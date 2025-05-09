class RepoModel {
  final String name;
  final String scriptFile;
  final String githubUrl;
  final String readmeAsset;
  final String description; // <-- AGREGADO

  RepoModel({
    required this.name,
    required this.scriptFile,
    required this.githubUrl,
    required this.readmeAsset,
    required this.description, // <-- AGREGADO
  });
}
