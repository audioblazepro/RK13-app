import 'package:flutter/material.dart';

class RepoCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String scriptPath;
  final VoidCallback onInstall;

  const RepoCard({
    required this.title,
    required this.iconData,
    required this.scriptPath,
    required this.onInstall,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(iconData, size: 32, color: Colors.redAccent),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: ElevatedButton.icon(
          onPressed: onInstall,
          icon: Icon(Icons.download),
          label: Text("Instalar"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
        ),
      ),
    );
  }
}
