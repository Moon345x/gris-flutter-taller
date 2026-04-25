import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gris_workshop/main.dart';
import 'package:gris_workshop/screens/levels_screen.dart';

void main() {
  testWidgets('Home screen GRIS', (tester) async {
    await tester.pumpWidget(const GrisApp());
    expect(find.text('GRIS'), findsOneWidget);
    expect(find.text('Comenzar Viaje'), findsOneWidget);
  });

  testWidgets('Levels screen cards', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LevelsScreen()));
    expect(find.text('Ira Rojo'), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(4));
  });
}