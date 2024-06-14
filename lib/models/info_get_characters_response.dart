import 'dart:convert';

class InfoGetCharactersResponse {
  int count;
  int pages;
  int currentPage;
  String? next;
  String? prev;

  InfoGetCharactersResponse({
    required this.count,
    required this.pages,
    this.currentPage = 1,
    this.next,
    this.prev,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
      'currentPage': currentPage,
    };
  }

  factory InfoGetCharactersResponse.fromMap(Map<String, dynamic> map) {
    return InfoGetCharactersResponse(
      count: map['count'] as int,
      pages: map['pages'] as int,
      currentPage: map['currentPage'] as int? ?? 1,
      next: map['next'] != null ? map['next'] as String : null,
      prev: map['prev'] != null ? map['prev'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoGetCharactersResponse.fromJson(String source) =>
      InfoGetCharactersResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
