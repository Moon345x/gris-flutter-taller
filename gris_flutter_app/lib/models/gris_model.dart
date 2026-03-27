class GrisPower {
  final String name;
  final String color;
  final String description;
  final String reflection;  // ← NUEVA reflexión profunda
  bool unlocked;

  GrisPower({
    required this.name,
    required this.color,
    required this.description,
    required this.reflection,
    this.unlocked = false,
  });

  void unlock() => unlocked = true;
}

class GrisModel {
  final List<GrisPower> powers = [
    GrisPower(
      name: 'Bloque Piedra',
      color: 'Rojo',
      description: 'Crea plataformas en desierto de ira.',
      reflection: 'La ira ciega como tormenta de arena; usa fuerza destructiva para romper obstáculos internos y avanzar.',
    ),
    GrisPower(
      name: 'Salto Doble',
      color: 'Verde',
      description: 'Salta más alto en bosque de negociación.',
      reflection: 'Negocias con el dolor intentando crecer; mezcla rojo-ira con verde esperanza para superar límites.',
    ),
    GrisPower(
      name: 'Respiración Agua',
      color: 'Azul',
      description: 'Nada en caverna de depresión.',
      reflection: 'Depresión ahoga como agua oscura; enfrenta el monstruo interno (anguila) para emerger a la luz.',
    ),
    GrisPower(
      name: 'Canto Final',
      color: 'Amarillo',
      description: 'Restaura mundo con luz y voz.',
      reflection: 'Aceptación trae calidez amarilla; libera voz para transformar dolor en belleza eterna.',
    ),
  ];
}