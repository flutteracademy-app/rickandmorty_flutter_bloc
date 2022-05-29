import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rickandmorty_flutter_bloc/data/models/episode_model.dart';
import 'package:rickandmorty_flutter_bloc/data/services/http_error_handler.dart';

class EpisodeApiServices {
  Future<Episode> getSingleEpisode(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      final responseBody = json.decode(response.body);

      final Episode responseEpisode = Episode.fromJson(responseBody);

      return responseEpisode;
    } catch (e) {
      rethrow;
    }
  }
}
