import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class MotelRepository {
  Future<List<Motel>> fetchMoteis() async {
    final response =
        await http.get(Uri.parse('https://www.jsonkeeper.com/b/1IXK'));

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));

      if (data['data'] != null && data['data']['moteis'] is List) {
        return (data['data']['moteis'] as List)
            .map((motelJson) => Motel.fromJson(motelJson))
            .toList();
      } else {
        throw Exception('Os dados de moteis não estão no formato esperado.');
      }
    } else {
      throw Exception(
          'Erro ao carregar os motéis. Status: ${response.statusCode}');
    }
  }
}
