import 'package:flutter/material.dart';

import 'package:rick_and_morty/models/export.dart';
import 'package:rick_and_morty/widgets/character_list_item.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => CharacterListItem(
              character: Character.fromMap({
            "id": 361,
            "name": "Toxic Rick",
            "status": "Dead",
            "species": "Humanoid",
            "type": "Rick's Toxic Side",
            "gender": "Male",
            "origin": {
              "name": "Alien Spa",
              "url": "https://rickandmortyapi.com/api/location/64"
            },
            "location": {
              "name": "Earth",
              "url": "https://rickandmortyapi.com/api/location/20"
            },
            "image":
                "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
            "episode": ["https://rickandmortyapi.com/api/episode/27"],
            "url": "https://rickandmortyapi.com/api/character/361",
            "created": "2018-01-10T18:20:41.703Z"
          })),
        ),
      ),
    );
  }
}
