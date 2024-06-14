import 'package:flutter/material.dart';

import 'package:rick_and_morty/providers/export.dart';
import 'package:rick_and_morty/widgets/export.dart';

import 'package:provider/provider.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomSearchBar(
          onChanged: (text) {
            Provider.of<CharacterProvider>(context, listen: false).searchText =
                text;
          },
        ),
        actions: const [
          ThemeButton(),
        ],
      ),
      body: SafeArea(
        child: Consumer<CharacterProvider>(
          builder: (context, characterProvider, child) {
            return characterProvider.isLoading &&
                    characterProvider.characters.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    controller: characterProvider.scrollController,
                    itemCount: characterProvider.filteredCharacters.length +
                        (characterProvider.isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index ==
                          characterProvider.filteredCharacters.length) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final character =
                          characterProvider.filteredCharacters[index];
                      return CharacterListItem(character: character);
                    },
                  );
          },
        ),
      ),
    );
  }
}
