import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guiademoteisgo/presentation/bloc/tab_cubit.dart';
import 'package:guiademoteisgo/presentation/components/custom_nav_bar.dart';
import 'package:mocktail/mocktail.dart';

class MockTabStateCubit extends Mock implements TabStateCubit {}

void main() {
  group('CustomNavBar', () {
    late MockTabStateCubit mockTabStateCubit;

    setUp(() {
      mockTabStateCubit = MockTabStateCubit();
    });

    testWidgets('Deve exibir o AppBar corretamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<TabStateCubit>(
            create: (context) => mockTabStateCubit,
            child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(70.0),
                  child: CustomNavBar()),
            ),
          ),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('ir agora'), findsOneWidget);
      expect(find.text('ir outro dia'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });
  });
}
