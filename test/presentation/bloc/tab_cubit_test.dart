import 'package:flutter_test/flutter_test.dart';
import 'package:guiademoteisgo/presentation/bloc/tab_cubit.dart';

void main() {
  late TabStateCubit tabStateCubit;

  setUp(() {
    tabStateCubit = TabStateCubit();
  });

  group('TabStateCubit', () {
    test('deve inicializar com o estado verdadeiro', () {
      expect(tabStateCubit.state, true);
    });

    test('deve alternar para verdadeiro quando a aba 0 for selecionada', () {
      tabStateCubit.toggleTab(0);

      expect(tabStateCubit.state, true);
    });

    test('deve alternar para falso quando a aba 1 for selecionada', () {
      tabStateCubit.toggleTab(1);

      expect(tabStateCubit.state, false);
    });
  });
}
