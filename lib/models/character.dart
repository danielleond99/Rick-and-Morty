import 'dart:convert';

class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Location? location;
  String image;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.location,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'location': location?.toMap(),
      'image': image,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      type: map['type'] as String,
      gender: map['gender'] as String,
      location: map['location'] != null
          ? Location.fromMap(map['location'] as Map<String, dynamic>)
          : null,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Location {
  String name;
  String url;

  Location({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);
}
