import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const RK13App());
}

class RK13App extends StatelessWidget {
  const RK13App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RK13 Terminal Toolkit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF101010),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white70, fontSize: 16),
          bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
