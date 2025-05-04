import 'package:flutter/material.dart';
import 'package:rk13/pages/install_log_page.dart';
import 'package:rk13/widgets/repo_card.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> repos = [
    {
      'title': 'NodeJS Toolkit',
      'icon': Icons.code,
      'script': 'assets/scripts/install_node.sh',
    },
    {
      'title': 'Python Env',
      'icon': Icons.bug_report,
      'script': 'assets/scripts/install_python.sh',
    },
    // Puedes agregar más aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RK13 - Instalador de Repos'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: repos.length,
        itemBuilder: (context, index) {
          final repo = repos[index];
          return RepoCard(
            title: repo['title'],
            iconData: repo['icon'],
            scriptPath: repo['script'],
            onInstall: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => InstallLogPage(scriptPath: repo['script']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
