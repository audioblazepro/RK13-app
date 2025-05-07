import 'package:flutter/material.dart';

class AprendePythonPage extends StatelessWidget {
  const AprendePythonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          '📘 Esta sección es para: Aprende Python',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white70,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
