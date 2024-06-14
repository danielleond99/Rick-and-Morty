import 'package:dio/dio.dart';

import 'package:rick_and_morty/models/export.dart';

import '../export.dart';

class CharacterServiceImpl extends CharacterService {
  static final CharacterServiceImpl _instance =
      CharacterServiceImpl._internal();

  CharacterServiceImpl._internal();

  factory CharacterServiceImpl() {
    return _instance;
  }

  @override
  Future<GetCharactersResponse?> getCharacters({int page = 1}) async {
    try {
      final Response response =
          await apiDio.get('/character', queryParameters: {"page": page});
      if (response.statusCode == 200) {
        return GetCharactersResponse.fromMap(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
