import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../domain/entities/motel.dart';
import '../models/motel_model.dart';
import 'motel_remote_data_source.dart';

class MotelRemoteDataSourceImpl implements MotelRemoteDataSource {
  @override
  Future<List<Motel>> fetchMoteis() async {
    final response =
        await http.get(Uri.parse('https://www.jsonkeeper.com/b/1IXK'));

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));

      if (data['data'] != null && data['data']['moteis'] is List) {
        final motelModels = (data['data']['moteis'] as List)
            .map((motelJson) => MotelModel.fromJson(motelJson))
            .toList();

        return motelModels.map((model) => model.toEntity()).toList();
      } else {
        throw Exception('Os dados de moteis não estão no formato esperado.');
      }
    } else {
      throw Exception(
          'Erro ao carregar os motéis. Status: ${response.statusCode}');
    }
  }
}
