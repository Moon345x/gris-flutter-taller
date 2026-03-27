import 'package:flutter/material.dart';
import 'levels_screen.dart';

class HomeScreen extends StatelessWidget {  // ← Stateless (no necesita state)
  const HomeScreen({super.key});

  // Imagen GRIS estatua perfecta para home
  static const String grisHomeImage = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDV6oJQ1GJdCraMGCPISxXQcA57AM4N4be1Q&s';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. FONDO IMAGEN GRIS ESTATUA
          Image.network(
            grisHomeImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4A4A4A), Color(0xFF2A2A2A)],
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.white),
                      SizedBox(height: 16),
                      Text('Cargando mundo GRIS...', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ],
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF4A4A4A), Color(0xFF2A2A2A)],
                  ),
                ),
                child: const Icon(Icons.image_not_supported, size: 100, color: Colors.white60),
              );
            },
          ),
          
          // 2. OVERLAY OSCURO (destaca texto)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.5, 0.8, 1.0],
                colors: [
                  Colors.transparent,
                  Colors.black26,
                  Colors.black54,
                  Colors.black87,
                ],
              ),
            ),
          ),
          
          // 3. CONTENIDO CENTRADO
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Título GRIS
                const Text(
                  'GRIS',
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(blurRadius: 20, color: Colors.black87),
                      Shadow(blurRadius: 10, color: Colors.black54),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                
                // Narrativa
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white24, width: 1),
                  ),
                  child: const Text(
                    'Gris pierde su voz al caer de la estatua de su madre.\n\nExplora un mundo gris recuperando emociones y colores:\n🔴 Ira → 🟢 Negociación → 🔵 Depresión → 🟡 Aceptación.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 60),
                
                // Botón comenzar
                SizedBox(
                  width: 280,
                  height: 64,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LevelsScreen()),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[700],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      elevation: 12,
                      shadowColor: Colors.black45,
                    ),
                    child: const Text(
                      '🌟 Comenzar Viaje',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}