import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guiademoteisgo/core/usecases/usecase.dart';
import 'package:guiademoteisgo/domain/usecases/get_moteis.dart';
import 'package:guiademoteisgo/presentation/bloc/motel_cubit.dart';
import 'package:guiademoteisgo/presentation/components/custom_nav_bar.dart';
import 'package:guiademoteisgo/presentation/pages/home_page.dart';
import 'package:guiademoteisgo/presentation/pages/motel_page.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_page_test.mocks.dart';

@GenerateMocks([GetMoteis])
void main() {
  late MockGetMoteis mockGetMoteis;

  setUp(() {
    mockGetMoteis = MockGetMoteis();
  });

  testWidgets(
      'HomePage contains CustomNavBar, MotelPage, and FloatingActionButton',
      (WidgetTester tester) async {
    when(mockGetMoteis(NoParams())).thenAnswer((_) async => []);

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<MotelCubit>(
        create: (_) => MotelCubit(mockGetMoteis),
        child: HomePage(),
      ),
    ));

    expect(find.byType(CustomNavBar), findsOneWidget);

    expect(find.byType(MotelPage), findsOneWidget);

    expect(find.byType(FloatingActionButton), findsOneWidget);

    expect(find.text('mapa'), findsOneWidget);
    expect(find.byIcon(Icons.map), findsOneWidget);
  });
}
