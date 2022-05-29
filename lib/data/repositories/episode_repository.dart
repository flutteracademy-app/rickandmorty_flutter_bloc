import 'package:rickandmorty_flutter_bloc/data/excepcions/episode_excepcions.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/data/models/custom_error.dart';
import 'package:rickandmorty_flutter_bloc/data/models/episode_model.dart';
import 'package:rickandmorty_flutter_bloc/data/services/episode_api_services.dart';

class EpisodeRepository {
  final EpisodeApiServices episodeApiServices;
  EpisodeRepository({
    required this.episodeApiServices,
  });

  Future<List<Episode>> fetchListEpisodes({
    required Character character,
    required List<Episode> allEpisodes,
  }) async {
    try {
      allEpisodes.clear();
      for (int i = 0; i < character.episode!.length; i++) {
        Episode responseEpisode =
            await episodeApiServices.getSingleEpisode(character.episode![i]);

        allEpisodes.add(responseEpisode);
      }
      return allEpisodes;
    } on EpisodeException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
