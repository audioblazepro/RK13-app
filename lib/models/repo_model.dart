class RepoModel {
  final String name;
  final String scriptAsset;     // Ruta del script en assets (para copiarlo al directorio interno)
  final String readmeAsset;     // Ruta del README en assets
  final String githubUrl;       // Enlace al repositorio original
  final String scriptFileName;  // Nombre del archivo script, para referencia en el destino

  RepoModel({
    required this.name,
    required this.scriptAsset,
    required this.readmeAsset,
    required this.githubUrl,
    required this.scriptFileName,
  });
}
