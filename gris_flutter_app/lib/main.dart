import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
void main() {
  runApp(const GrisApp());
}

class GrisApp extends StatelessWidget {
  const GrisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GRIS - Nomada Studio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const HomeScreen(),  // Ya importado arriba
      debugShowCheckedModeBanner: false,
    );
  }
}