import 'dart:convert';

import './export.dart';

class GetCharactersResponse {
  InfoGetCharactersResponse infoGetCharactersResponse;
  List<Character> characters;

  GetCharactersResponse({
    required this.infoGetCharactersResponse,
    this.characters = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'info': infoGetCharactersResponse.toMap(),
      'results': characters.map((x) => x.toMap()).toList(),
    };
  }

  factory GetCharactersResponse.fromMap(Map<String, dynamic> map) {
    return GetCharactersResponse(
      infoGetCharactersResponse: InfoGetCharactersResponse.fromMap(
          map['info'] as Map<String, dynamic>),
      characters: List<Character>.from(
        (map['results'] as List).map<Character>(
          (x) => Character.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCharactersResponse.fromJson(String source) =>
      GetCharactersResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
