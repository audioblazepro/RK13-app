import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const RK13HackerApp());
}

class RK13HackerApp extends StatelessWidget {
  const RK13HackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RK13 Hacker Terminal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF090909),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 4,
          shadowColor: Colors.redAccent,
          titleTextStyle: TextStyle(
            color: Colors.redAccent,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: 'monospace',
          ),
          iconTheme: IconThemeData(color: Colors.redAccent),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.greenAccent,
            fontFamily: 'monospace',
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
          titleLarge: TextStyle(
            color: Colors.redAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
            ),
          ),
        ),
        dividerColor: Colors.redAccent.withOpacity(0.2),
        cardColor: Colors.grey[900],
      ),
      home: HomePage(),
    );
  }
}
