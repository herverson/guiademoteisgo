import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:guiademoteisgo/bloc/motel_cubit.dart';
import 'package:guiademoteisgo/bloc/motel_state.dart';
import 'package:guiademoteisgo/models/models.dart';
import 'package:guiademoteisgo/repositories/motel_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'motel_cubit_test.mocks.dart';

@GenerateMocks([MotelRepository])
void main() {
  group('MotelCubit', () {
    late MotelCubit motelCubit;
    late MockMotelRepository mockMotelRepository;

    setUp(() {
      mockMotelRepository = MockMotelRepository();
      motelCubit = MotelCubit(mockMotelRepository);
    });

    tearDown(() {
      motelCubit.close();
    });

    test('initial state is MotelInitial', () {
      expect(motelCubit.state, isA<MotelInitial>());
    });

    blocTest<MotelCubit, MotelState>(
      'emits [MotelLoading, MotelLoaded] when fetchMoteis succeeds',
      build: () {
        when(mockMotelRepository.fetchMoteis()).thenAnswer(
          (_) async => [
            Motel(
              fantasia: 'Motel Teste',
              bairro: 'Bairro Teste',
              suites: [],
              logo: '',
              distancia: 0,
              qtdFavoritos: 0,
              media: 0,
              qtdAvaliacoes: 0,
            ),
          ],
        );
        return motelCubit;
      },
      act: (cubit) => cubit.fetchMoteis(),
      expect: () => [
        isA<MotelLoading>(),
        isA<MotelLoaded>(),
      ],
      verify: (_) {
        verify(mockMotelRepository.fetchMoteis()).called(1);
      },
    );

    blocTest<MotelCubit, MotelState>(
      'emits [MotelLoading, MotelError] when fetchMoteis fails',
      build: () {
        when(mockMotelRepository.fetchMoteis()).thenThrow(
          Exception('Erro ao carregar os motéis'),
        );
        return motelCubit;
      },
      act: (cubit) => cubit.fetchMoteis(),
      expect: () => [
        isA<MotelLoading>(),
        isA<MotelError>(),
      ],
      verify: (_) {
        verify(mockMotelRepository.fetchMoteis()).called(1);
      },
    );
  });
}
