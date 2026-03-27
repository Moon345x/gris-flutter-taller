import 'package:flutter/material.dart';

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
        children: const [
          LevelCard(
            color: Colors.red,
            title: '1. Ira (Rojo)',
            description: 'Desierto con molinos gigantes. Primer poder: bloques de piedra.',
          ),
          LevelCard(
            color: Colors.green,
            title: '2. Negociación (Verde)',
            description: 'Bosque exuberante. Salto doble y crecimiento.',
          ),
          LevelCard(
            color: Colors.blue,
            title: '3. Depresión (Azul)',
            description: 'Caverna submarina. Monstruo negro y aceptación.',
          ),
          LevelCard(
            color: Colors.yellow,
            title: '4. Aceptación (Amarillo)',
            description: 'Ciudad de luz. Canto final restaura el mundo.',
          ),
        ],
      ),
    );
  }
}

class LevelCard extends StatelessWidget {
  final Color color;
  final String title;
  final String description;

  const LevelCard({
    super.key,
    required this.color,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: color.withOpacity(0.2),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color, child: const Icon(Icons.star, color: Colors.white)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}