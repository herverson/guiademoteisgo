import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guiademoteisgo/bloc/motel_cubit.dart';
import 'package:guiademoteisgo/bloc/motel_state.dart';
import 'package:guiademoteisgo/bloc/tab_cubit.dart';
import 'package:guiademoteisgo/components/suite_card.dart';
import 'package:guiademoteisgo/models/models.dart';
import 'package:guiademoteisgo/pages/motel_page.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'motel_page_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MotelCubit>(), MockSpec<TabStateCubit>()])
void main() {
  group('MotelPage', () {
    late MockMotelCubit mockMotelCubit;
    late MockTabStateCubit mockTabStateCubit;

    setUp(() {
      mockMotelCubit = MockMotelCubit();
      mockTabStateCubit = MockTabStateCubit();
    });

    testWidgets('displays loading indicator when state is MotelLoading',
        (WidgetTester tester) async {
      when(mockMotelCubit.stream)
          .thenAnswer((_) => Stream.value(MotelLoading()));

      when(mockMotelCubit.state).thenReturn(MotelLoading());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<MotelCubit>.value(
            value: mockMotelCubit,
            child: MotelPage(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays motel list when state is MotelLoaded',
        (WidgetTester tester) async {
      final motel = Motel(
        fantasia: 'Motel Fantasia',
        bairro: 'Centro',
        suites: [
          Suite(
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
          ),
        ],
        logo: '',
        distancia: 0,
        qtdFavoritos: 0,
        media: 0,
        qtdAvaliacoes: 0,
      );

      when(mockMotelCubit.stream)
          .thenAnswer((_) => Stream.value(MotelLoaded(moteis: [motel])));

      when(mockMotelCubit.state).thenReturn(MotelLoaded(moteis: [motel]));

      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<TabStateCubit>.value(value: mockTabStateCubit),
            BlocProvider<MotelCubit>.value(value: mockMotelCubit),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: MotelPage(),
            ),
          ),
        ),
      );

      expect(find.text('Motel Fantasia'), findsOneWidget);
      expect(find.text('Centro'), findsOneWidget);
      expect(find.byType(CarouselSlider), findsOneWidget);
    });

    testWidgets('displays error message when state is MotelError',
        (WidgetTester tester) async {
      when(mockMotelCubit.stream).thenAnswer((_) =>
          Stream.value(MotelError(message: 'Erro ao carregar os motéis')));

      when(mockMotelCubit.state)
          .thenReturn(MotelError(message: 'Erro ao carregar os motéis'));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<MotelCubit>.value(
            value: mockMotelCubit,
            child: MotelPage(),
          ),
        ),
      );

      expect(find.text('Erro ao carregar os motéis'), findsOneWidget);
    });
  });

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
