import 'package:flutter/material.dart';
import '../models/repo_model.dart';
import 'install_log_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<RepoModel> repos = [
    RepoModel(
      name: "NodeJS",
      assetPath: "assets/scripts/install_node.sh",
    ),
    RepoModel(
      name: "Python",
      assetPath: "assets/scripts/install_python.sh",
    ),
    // Agregá más repos aquí si querés
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("RK13 Instalador"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: repos.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final repo = repos[index];
          return Card(
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              title: Text(
                repo.name,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: ElevatedButton.icon(
                icon: const Icon(Icons.system_update_alt),
                label: const Text("Instalar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => InstallLogPage(repo: repo),
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
