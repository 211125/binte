import 'package:http/http.dart' as http;
import 'package:binte/features/songs/data/models/songmodel.dart';
import 'dart:convert' as convert;

abstract class SongDataSource {
  Future<List<SongModel>> getSongs();
  Future<List<SongModel>> getIdSong(String id);
}

class SongDataSourceImp implements SongDataSource {
  final _baseUrl = 'https://binteapi.com:4011/api/songs/examen';
  @override
  Future<List<SongModel>> getIdSong(String id) async {
    var response = await http.get(Uri.parse('$_baseUrl/detail/$id'));

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);

      if (jsonResponse['ok'] == true && jsonResponse['data'] != null) {
        return [SongModel.fromJson(jsonResponse['data'])];
      } else {
        throw Exception('Estructura de respuesta inesperada');
      }
    } else {
      throw Exception('Error en la petición: ${response.statusCode}');
    }
  }

  @override
  Future<List<SongModel>> getSongs() async {
    var response = await http.get(Uri.parse('$_baseUrl/2'));

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      if (jsonResponse['ok'] == true && jsonResponse['data'] != null) {
        return (jsonResponse['data'] as List)
            .map<SongModel>((data) => SongModel.fromJson(data))
            .toList();
      } else {
        throw Exception('Estructura de respuesta inesperada');
      }
    } else {
      throw Exception('Error en la petición: ${response.statusCode}');
    }
  }
}
