import 'package:flutter/material.dart';

import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/widgets/custom_cached_network_image.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCachedNetworkImage(
                imageUrl: character.image,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child:
                    Text(character.name, style: const TextStyle(fontSize: 24)),
              ),
              Text('Status: ${character.status}'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text('Species: ${character.species}'),
              ),
              Visibility(
                  visible: character.type.isNotEmpty,
                  child: Text('Type: ${character.type}')),
              Visibility(
                  visible: character.location != null &&
                      character.location!.name.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text('Location: ${character.location?.name}'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
