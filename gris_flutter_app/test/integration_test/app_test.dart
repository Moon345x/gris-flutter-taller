import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:gris_workshop/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('GRIS App E2E', () {
    testWidgets('Navegación completa etapas', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verifica home GRIS
      expect(find.text('GRIS'), findsOneWidget);
      await tester.tap(find.text('Comenzar Viaje'));
      await tester.pumpAndSettle();

      // Navega primer level
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();
      expect(find.text('¡Poder DESBLOQUEADO!'), findsOneWidget);
    });
  });
}