import 'package:guiademoteisgo/domain/entities/motel.dart';
import 'package:guiademoteisgo/presentation/bloc/motel_cubit.dart';
import 'package:guiademoteisgo/presentation/bloc/motel_state.dart';
import 'package:guiademoteisgo/presentation/components/motel_card.dart';
import 'package:guiademoteisgo/presentation/pages/motel_page.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'motel_page_test.mocks.dart';

@GenerateMocks([MotelCubit])
void main() {
  group('MotelPage', () {
    late MockMotelCubit mockMotelCubit;

    setUp(() {
      mockMotelCubit = MockMotelCubit();

      when(mockMotelCubit.stream)
          .thenAnswer((_) => Stream.value(MotelInitial()));
    });

    testWidgets(
        'deve mostrar um CircularProgressIndicator quando estiver carregando',
        (WidgetTester tester) async {
      when(mockMotelCubit.state).thenReturn(MotelLoading());
      when(mockMotelCubit.stream)
          .thenAnswer((_) => Stream.value(MotelLoading()));

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

    testWidgets('deve mostrar os motéis quando carregados',
        (WidgetTester tester) async {
      final moteis = [
        Motel(
          fantasia: 'Motel A',
          logo: '',
          bairro: 'Bairro A',
          distancia: 5.0,
          qtdFavoritos: 100,
          media: 4.5,
          qtdAvaliacoes: 50,
          suites: [],
        ),
      ];
      when(mockMotelCubit.state).thenReturn(MotelLoaded(moteis: moteis));
      when(mockMotelCubit.stream)
          .thenAnswer((_) => Stream.value(MotelLoaded(moteis: moteis)));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<MotelCubit>.value(
            value: mockMotelCubit,
            child: MotelPage(),
          ),
        ),
      );

      expect(find.byType(MotelCard), findsOneWidget);
    });

    testWidgets('deve mostrar uma mensagem de erro quando houver erro',
        (WidgetTester tester) async {
      when(mockMotelCubit.state)
          .thenReturn(MotelError(message: "Erro ao carregar motéis"));
      when(mockMotelCubit.stream).thenAnswer(
          (_) => Stream.value(MotelError(message: "Erro ao carregar motéis")));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<MotelCubit>.value(
            value: mockMotelCubit,
            child: MotelPage(),
          ),
        ),
      );

      expect(find.text("Erro ao carregar motéis"), findsOneWidget);
    });

    testWidgets(
        'deve mostrar uma mensagem "Nenhum motel encontrado" quando não houver moteis',
        (WidgetTester tester) async {
      when(mockMotelCubit.state).thenReturn(MotelLoaded(moteis: []));
      when(mockMotelCubit.stream)
          .thenAnswer((_) => Stream.value(MotelLoaded(moteis: [])));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<MotelCubit>.value(
            value: mockMotelCubit,
            child: MotelPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text("Nenhum motel encontrado"), findsOneWidget);
    });
  });
}
