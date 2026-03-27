import 'package:flutter/material.dart';
import '../models/gris_model.dart';

class LevelDetailScreen extends StatefulWidget {
  final int levelIndex;
  const LevelDetailScreen({super.key, required this.levelIndex});

  @override
  State<LevelDetailScreen> createState() => _LevelDetailScreenState();
}

class _LevelDetailScreenState extends State<LevelDetailScreen> {
  final GrisModel _model = GrisModel();

  @override
  void initState() {
    super.initState();
    _model.powers[widget.levelIndex].unlock();
  }

  @override
  Widget build(BuildContext context) {
    final power = _model.powers[widget.levelIndex];
    final images = ['imagen.jpg', 'imagen-2.jpg']; // Tus assets

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(power.name),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/${images[widget.levelIndex % images.length]}',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.3],
                colors: [Colors.transparent, Colors.black54],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(power.name, style: const TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Text(power.description, style: const TextStyle(fontSize: 18, color: Colors.white70)),
                  const SizedBox(height: 24),
                  Text('¡Poder DESBLOQUEADO! ${power.unlocked ? "✅" : "🔒"}', style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[800],
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: const Text('Siguiente Etapa', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}