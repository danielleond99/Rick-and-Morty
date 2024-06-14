import 'package:flutter/material.dart';

import 'package:rick_and_morty/models/export.dart';
import 'package:rick_and_morty/screens/export.dart';
import 'package:rick_and_morty/widgets/custom_cached_network_image.dart';

class CharacterListItem extends StatelessWidget {
  final Character character;

  const CharacterListItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: 'characterImage${character.id}',
        child: CustomCachedNetworkImage(
          imageUrl: character.image,
        ),
      ),
      title: Text(character.name),
      subtitle: Text('${character.status} - ${character.species}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetailScreen(character: character),
          ),
        );
      },
    );
  }
}
