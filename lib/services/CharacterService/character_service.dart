import 'package:rick_and_morty/models/export.dart';

abstract class CharacterService {
  Future<GetCharactersResponse?> getCharacters({int page = 1});
}
