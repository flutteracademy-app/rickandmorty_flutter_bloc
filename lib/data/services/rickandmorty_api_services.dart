import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rickandmorty_flutter_bloc/api.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/data/services/http_error_handler.dart';

class RickandmortyApiServices {
  // final http.Client httpClient;

  // RickandmortyApiServices({required this.httpClient});

  Future<List<Character>> getCharactersPerPage(int page) async {
    final queryParameters = {
      'page': page.toString(),
    };
    final Uri uri = Uri.https(API.BASE_URL, '/api/character', queryParameters);

    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      final responseBody = json.decode(response.body);

      List<Character> resultCharacters = responseBody['results']
          .map<Character>((e) => Character.fromJson(e))
          .toList();
      print(resultCharacters);
      return resultCharacters;
    } catch (e) {
      rethrow;
    }
  }
}
