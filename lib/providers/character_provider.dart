import 'package:flutter/material.dart';

import 'package:rick_and_morty/models/export.dart';
import 'package:rick_and_morty/services/export.dart';

class CharacterProvider extends ChangeNotifier {
  final CharacterService characterService;
  final KeyValueStorageServices keyValueStorageServices;

  List<Character> characters = [];
  int currentPage = 1;
  int totalPages = 1;
  bool isLoading = false;

  final ScrollController scrollController = ScrollController();

  CharacterProvider(
      {required this.characterService, required this.keyValueStorageServices}) {
    getCharactersSaved();
    scrollController.addListener(_scrollListener);
  }

  void getCharactersSaved() {
    keyValueStorageServices
        .getValue<String>('GetCharactersResponse')
        .then((getCharactersResponseSaved) {
      if (getCharactersResponseSaved != null) {
        GetCharactersResponse getCharactersResponse =
            GetCharactersResponse.fromJson(getCharactersResponseSaved);

        characters = getCharactersResponse.characters;
        currentPage =
            getCharactersResponse.infoGetCharactersResponse.currentPage;
        totalPages = getCharactersResponse.infoGetCharactersResponse.pages;
      }
      fetchCharacters();
    });
  }

  Future<void> fetchCharacters() async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
    final GetCharactersResponse? getCharactersResponse =
        await characterService.getCharacters(page: currentPage);

    if (getCharactersResponse != null) {
      currentPage++;
      totalPages = getCharactersResponse.infoGetCharactersResponse.pages;
      characters = [...characters, ...getCharactersResponse.characters];

      getCharactersResponse.characters = characters;
      getCharactersResponse.infoGetCharactersResponse.currentPage = currentPage;

      keyValueStorageServices.setKeyValue<String>(
          'GetCharactersResponse', getCharactersResponse.toJson());
    }
    isLoading = false;
    notifyListeners();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        currentPage <= totalPages) {
      fetchCharacters();
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }
}
