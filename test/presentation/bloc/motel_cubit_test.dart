import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:guiademoteisgo/domain/entities/motel.dart';
import 'package:guiademoteisgo/domain/usecases/get_moteis.dart';
import 'package:guiademoteisgo/presentation/bloc/motel_cubit.dart';
import 'package:guiademoteisgo/presentation/bloc/motel_state.dart';

import 'motel_cubit_test.mocks.dart';

@GenerateMocks([GetMoteis])
void main() {
  late MotelCubit cubit;
  late MockGetMoteis mockGetMoteis;

  setUp(() {
    mockGetMoteis = MockGetMoteis();
    cubit = MotelCubit(mockGetMoteis);
  });

  tearDown(() {
    cubit.close();
  });

  group('MotelCubit', () {
    final List<Motel> moteis = [
      Motel(
        fantasia: 'Motel A',
        logo: 'logo_a.png',
        bairro: 'Bairro A',
        distancia: 5.0,
        qtdFavoritos: 100,
        media: 4.5,
        qtdAvaliacoes: 50,
        suites: [],
      ),
      Motel(
        fantasia: 'Motel B',
        logo: 'logo_b.png',
        bairro: 'Bairro B',
        distancia: 8.0,
        qtdFavoritos: 120,
        media: 4.0,
        qtdAvaliacoes: 60,
        suites: [],
      ),
    ];

    blocTest<MotelCubit, MotelState>(
      'deve emitir [MotelLoading, MotelLoaded] quando os motéis forem carregados com sucesso',
      build: () {
        when(mockGetMoteis(any)).thenAnswer((_) async => moteis);
        return cubit;
      },
      act: (cubit) => cubit.fetchMoteis(),
      expect: () => [
        MotelLoading(),
        MotelLoaded(moteis: moteis),
      ],
      verify: (_) {
        verify(mockGetMoteis(any)).called(1);
      },
    );

    blocTest<MotelCubit, MotelState>(
      'deve emitir [MotelLoading, MotelError] quando houver uma exceção ao carregar os motéis',
      build: () {
        when(mockGetMoteis(any)).thenThrow(Exception('Erro ao carregar'));
        return cubit;
      },
      act: (cubit) => cubit.fetchMoteis(),
      expect: () => [
        MotelLoading(),
        MotelError(
            message: 'Erro ao carregar os motéis: Exception: Erro ao carregar'),
      ],
    );
  });
}
