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

  // URLs GRIS oficiales HD [web:32]
  static const List<String> grisImages = [
    'https://www.devuego.es/blog/wp-content/uploads/2019/08/68942269_10219049034752044_1919671384254971904_o-1024x576.jpg',  // Rojo desierto
    'https://images.steamusercontent.com/ugc/759346451809716858/0B026C5617EC6A3AA9BFD9D1520A0B13BDF65C2F/',            // Verde bosque
    'https://image.api.playstation.com/vulcan/img/cfn/11307zqzG5jEDK730Z_TPKohNcYFTVIyZZDE9D0Gp-5hlYY4-_Mpsaty64cyfM1-yRrx01tYxrWY9Yd4IvWq2wA_kRUXsFIm.jpg', // Azul caverna
    'https://puregaming.es/wp-content/uploads/2018/12/Captura-Gris-157-1250x720.jpg', // Amarillo ciudad
  ];

  @override
  Widget build(BuildContext context) {
    final power = _model.powers[widget.levelIndex];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(power.name, style: const TextStyle(color: Colors.white)),
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. FONDO IMAGEN GRIS SIEMPRE VISIBLE
          Image.network(
            grisImages[widget.levelIndex],
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.grey[900],
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.white),
                      SizedBox(height: 16),
                      Text('Cargando mundo GRIS...', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.grey[900]!, Colors.black],
                  ),
                ),
                child: const Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.white60,
                ),
              );
            },
          ),
          
          // 2. OVERLAY OSCURO (no tapa imagen)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.4, 0.7, 1.0],
                colors: [
                  Colors.transparent,
                  Colors.black26,
                  Colors.black54,
                  Colors.black87,
                ],
              ),
            ),
          ),
          
          // 3. CONTENIDO ORGANIZADO
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título grande
                  Text(
                    power.name,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 8, color: Colors.black)],
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Descripción
                  Text(
                    power.description,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // REFLEXIÓN (caja destacada)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.amber, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '💭 Reflexión',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          power.reflection,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  
                  // Status + Botón
                  Row(
                    children: [
                      Icon(
                        power.unlocked ? Icons.check_circle : Icons.lock,
                        color: power.unlocked ? Colors.green : Colors.grey,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '¡Poder ${power.unlocked ? 'DESBLOQUEADO' : 'BLOQUEADO'}!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: power.unlocked ? Colors.green : Colors.white60,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[700],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 8,
                      ),
                      child: const Text(
                        '← Etapa Anterior',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}