import 'package:flutter/material.dart';
import 'level_detail_screen.dart';  // ← NUEVO import

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Etapas de GRIS'),
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ← CAMBIO: generate con onTap
          ...List.generate(4, (index) => LevelCard(
            colorIndex: index,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LevelDetailScreen(levelIndex: index)),
            ),
          )),
        ],
      ),
    );
  }
}

// ← LevelCard TOTALMENTE NUEVA (reemplaza la vieja)
class LevelCard extends StatelessWidget {
  final int colorIndex;
  final VoidCallback onTap;

  const LevelCard({
    super.key,
    required this.colorIndex,
    required this.onTap,
  });

  Color get color => [Colors.red, Colors.green, Colors.blue, Colors.yellow][colorIndex];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: color.withOpacity(0.2),
      child: ListTile(
        onTap: onTap,  // ← CLICKABLE ahora
        leading: CircleAvatar(backgroundColor: color, child: Text('${colorIndex + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        title: Text(['Ira Rojo', 'Negacion Verde', 'Depresión Azul', 'Aceptación Amarillo'][colorIndex], style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(['Desierto molinos', 'Bosque salto', 'Caverna monstruo', 'Ciudad canto'][colorIndex]),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}