import 'package:flutter/material.dart';

import 'package:rick_and_morty/providers/character_provider.dart';
import 'package:rick_and_morty/widgets/character_list_item.dart';

import 'package:provider/provider.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<CharacterProvider>(
          builder: (context, characterProvider, child) {
            return characterProvider.isLoading &&
                    characterProvider.characters.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    controller: characterProvider.scrollController,
                    itemCount: characterProvider.characters.length +
                        (characterProvider.isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == characterProvider.characters.length) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final character = characterProvider.characters[index];
                      return CharacterListItem(character: character);
                    },
                  );
          },
        ),
      ),
    );
  }
}
