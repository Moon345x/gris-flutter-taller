import 'package:flutter/material.dart';

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
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4A4A4A), Color(0xFF2A2A2A)],
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'GRIS',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                  shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'Un mundo gris...\nUna chica sin voz\nEl viaje comienza',
                  style: TextStyle(fontSize: 20, color: Colors.white60),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}