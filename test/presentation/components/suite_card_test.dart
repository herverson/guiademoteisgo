import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guiademoteisgo/data/models/motel_model.dart';
import 'package:guiademoteisgo/presentation/bloc/tab_cubit.dart';
import 'package:guiademoteisgo/presentation/components/suite_card.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'suite_card_test.mocks.dart';

// Mock do TabStateCubit
@GenerateMocks([TabStateCubit])
void main() {
  group('SuiteCard', () {
    late MockTabStateCubit mockTabStateCubit;

    setUp(() {
      mockTabStateCubit = MockTabStateCubit();
    });

    testWidgets('displays suite information when tab state is false',
        (WidgetTester tester) async {
      when(mockTabStateCubit.stream).thenAnswer((_) => Stream.value(false));

      when(mockTabStateCubit.state).thenReturn(false);

      final suite = Suite(
        nome: 'Suite Teste',
        fotos: [],
        categoriaItens: [],
        periodos: [
          Periodo(
            tempo: '3',
            valor: 88,
            desconto: null,
            valorTotal: 88,
            temCortesia: false,
            tempoFormatado: "3 horas",
          ),
          Periodo(
            tempo: '3',
            valor: 88,
            desconto: null,
            valorTotal: 88,
            temCortesia: false,
            tempoFormatado: "3 horas",
          ),
        ],
        itens: [],
        qtd: 0,
        exibirQtdDisponiveis: false,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<TabStateCubit>.value(
            value: mockTabStateCubit,
            child: Scaffold(
              body: SuiteCard(suite: suite),
            ),
          ),
        ),
      );

      expect(find.text('Suite Teste'), findsOneWidget);

      expect(find.text('Pernoite'), findsOneWidget);
      expect(find.text('R\$ 88,00'), findsOneWidget);
      expect(find.text('até 12x de R\$ 7,33'), findsOneWidget);
    });

    testWidgets('displays suite information when tab state is true',
        (WidgetTester tester) async {
      when(mockTabStateCubit.stream).thenAnswer((_) => Stream.value(true));

      when(mockTabStateCubit.state).thenReturn(true);

      final suite = Suite(
        nome: 'Suite Teste',
        fotos: [],
        categoriaItens: [],
        periodos: [
          Periodo(
            tempo: '3',
            valor: 88,
            desconto: null,
            valorTotal: 88,
            temCortesia: false,
            tempoFormatado: "3 horas",
          ),
          Periodo(
            tempo: '3',
            valor: 88,
            desconto: null,
            valorTotal: 88,
            temCortesia: false,
            tempoFormatado: "3 horas",
          ),
        ],
        itens: [],
        qtd: 0,
        exibirQtdDisponiveis: false,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<TabStateCubit>.value(
            value: mockTabStateCubit,
            child: Scaffold(
              body: SuiteCard(suite: suite),
            ),
          ),
        ),
      );

      expect(find.text('Suite Teste'), findsOneWidget);
      expect(find.text('3 horas'), findsNWidgets(2));
      expect(find.text('R\$ 88,00'), findsNWidgets(2));
    });
  });
}
