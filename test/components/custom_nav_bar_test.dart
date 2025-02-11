import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guiademoteisgo/bloc/tab_cubit.dart';
import 'package:guiademoteisgo/components/custom_nav_bar.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'custom_nav_bar_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TabStateCubit>()])
void main() {
  late MockTabStateCubit mockTabStateCubit;

  setUp(() {
    mockTabStateCubit = MockTabStateCubit();
  });

  testWidgets('displays CustomNavBar and verifies Tab selection',
      (WidgetTester tester) async {
    when(mockTabStateCubit.state).thenReturn(false);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TabStateCubit>.value(
          value: mockTabStateCubit,
          child: Scaffold(
              appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: CustomNavBar(),
          )),
        ),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(TabBar), findsOneWidget);

    expect(find.text('ir agora'), findsOneWidget);
    expect(find.text('ir outro dia'), findsOneWidget);

    expect(find.byIcon(Icons.flash_on_sharp), findsOneWidget);
    expect(find.byIcon(Icons.calendar_month), findsOneWidget);

    await tester.tap(find.text('ir outro dia'));
    verify(mockTabStateCubit.toggleTab(1)).called(1);

    await tester.tap(find.text('ir agora'));
    verify(mockTabStateCubit.toggleTab(0)).called(1);
  });
}
