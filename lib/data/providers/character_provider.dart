import 'package:rickandmorty_flutter_bloc/api.dart';

import 'package:http/http.dart' as http;

class CharacterProvider {
  void getCharacters() async {
    var url = Uri.parse(API.BASE_URL);

    http.get(url).then((res) {
      print(res);
    });
  }
}
