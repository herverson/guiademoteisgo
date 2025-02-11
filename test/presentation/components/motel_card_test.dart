import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guiademoteisgo/domain/entities/motel.dart';
import 'package:guiademoteisgo/presentation/components/motel_card.dart';

void main() {
  group('MotelCard', () {
    final motel = Motel(
      fantasia: 'Motel A',
      logo: '',
      bairro: 'Bairro A',
      distancia: 5.0,
      qtdFavoritos: 100,
      media: 4.5,
      qtdAvaliacoes: 50,
      suites: [],
    );

    testWidgets('Deve exibir o nome fantasia corretamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MotelCard(motel: motel),
          ),
        ),
      );

      expect(find.text(motel.fantasia), findsOneWidget);
    });

    testWidgets('Deve exibir o bairro corretamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MotelCard(motel: motel),
          ),
        ),
      );

      expect(find.text(motel.bairro), findsOneWidget);
    });

    testWidgets('Deve exibir a média de avaliações corretamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MotelCard(motel: motel),
          ),
        ),
      );

      expect(find.text('${motel.media}'), findsOneWidget);
    });

    testWidgets('Deve exibir a quantidade de avaliações corretamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MotelCard(motel: motel),
          ),
        ),
      );

      expect(find.text('${motel.qtdAvaliacoes} avaliações'), findsOneWidget);
    });

    testWidgets('Deve exibir o ícone de favorito', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MotelCard(motel: motel),
          ),
        ),
      );

      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });
  });
}
