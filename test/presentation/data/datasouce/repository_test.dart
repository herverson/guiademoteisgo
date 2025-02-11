import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:guiademoteisgo/data/datasources/motel_remote_data_source_impl.dart';
import 'package:guiademoteisgo/domain/entities/motel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'repository_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late MotelRemoteDataSourceImpl dataSource;

  setUp(() {
    mockClient = MockClient();
    dataSource = MotelRemoteDataSourceImpl();
  });

  group('fetchMoteis', () {
    test('deve retornar uma lista de motéis quando a resposta for bem-sucedida',
        () async {
      final mockResponse = jsonEncode({
        'data': {
          'moteis': [
            {
              'fantasia': 'Motel Le Nid',
            },
          ],
        },
      });

      when(mockClient.get(Uri.parse('https://www.jsonkeeper.com/b/1IXK')))
          .thenAnswer((_) async => http.Response(mockResponse, 200));

      final result = await dataSource.fetchMoteis();

      expect(result, isA<List<Motel>>());
      expect(result.length, 1);
      expect(result[0].fantasia, 'Motel Le Nid');
    });
  });
}
