import 'package:flutter_test/flutter_test.dart';
import 'package:guiademoteisgo/core/usecases/usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:guiademoteisgo/domain/entities/motel.dart';
import 'package:guiademoteisgo/domain/repositories/motel_repository.dart';
import 'package:guiademoteisgo/domain/usecases/get_moteis.dart';

import 'get_moteis_test.mocks.dart';

@GenerateMocks([MotelRepository])
void main() {
  late MockMotelRepository mockMotelRepository;
  late GetMoteis getMoteis;

  setUp(() {
    mockMotelRepository = MockMotelRepository();
    getMoteis = GetMoteis(mockMotelRepository);
  });

  group('GetMoteis', () {
    test(
        'deve retornar uma lista de motéis quando o repositório retorna sucesso',
        () async {
      final mockMoteis = [
        Motel(
          fantasia: 'Motel Le Nid',
          logo: 'logo_a.png',
          bairro: 'Bairro A',
          distancia: 5.0,
          qtdFavoritos: 100,
          media: 4.5,
          qtdAvaliacoes: 50,
          suites: [],
        ),
      ];

      when(mockMotelRepository.fetchMoteis())
          .thenAnswer((_) async => mockMoteis);

      final result = await getMoteis(NoParams());

      expect(result, isA<List<Motel>>());
      expect(result.length, 1);
      expect(result[0].fantasia, 'Motel Le Nid');
      verify(mockMotelRepository.fetchMoteis()).called(1);
    });

    test('deve lançar uma exceção quando o repositório falhar', () async {
      when(mockMotelRepository.fetchMoteis())
          .thenThrow(Exception('Erro ao carregar os motéis'));

      expect(() async => await getMoteis(NoParams()), throwsException);
      verify(mockMotelRepository.fetchMoteis()).called(1);
    });
  });
}
