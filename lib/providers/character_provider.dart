import 'package:flutter/material.dart';

import 'package:rick_and_morty/models/export.dart';
import 'package:rick_and_morty/services/export.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

class CharacterProvider extends ChangeNotifier {
  final CharacterService characterService;
  final KeyValueStorageServices keyValueStorageServices;

  List<Character> characters = [];
  List<Character> filteredCharacters = [];
  int currentPage = 1;
  int totalPages = 1;
  bool isLoading = false;
  String _searchText = '';

  final ScrollController scrollController = ScrollController();

  String get searchText => _searchText;
  set searchText(String text) {
    _searchText = text;
    filterCharacters();
  }

  void filterCharacters() {
    if (searchText.isEmpty) {
      filteredCharacters = characters;
    } else {
      filteredCharacters = characters
          .where((character) =>
              character.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

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
      if (characters.isEmpty && currentPage <= totalPages) {
        fetchCharacters();
      } else {
        filterCharacters();
      }
    });
  }

  Future<void> fetchCharacters() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (isLoading || connectivityResult.contains(ConnectivityResult.none)) {
      return;
    }
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
    filterCharacters();
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
