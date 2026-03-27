class GrisPower {
  final String name;
  final String color;
  final String description;
  bool unlocked;

  GrisPower({
    required this.name,
    required this.color,
    required this.description,
    this.unlocked = false,
  });

  void unlock() => unlocked = true;
}

class GrisModel {
  final List<GrisPower> powers = [
    GrisPower(name: 'Bloque Piedra', color: 'Rojo', description: 'Crea plataformas en desierto.'),
    GrisPower(name: 'Salto Doble', color: 'Verde', description: 'Salta más alto en bosque.'),
    GrisPower(name: 'Respiración Agua', color: 'Azul', description: 'Nada en caverna.'),
    GrisPower(name: 'Canto Final', color: 'Amarillo', description: 'Restaura mundo con luz.'),
  ];
}