import 'dart:convert';

class ChapterModel {
  int? id;
  int? chapter_id;
  int? book_id;
  String? title;
  int? number;
  String? hadis_range;
  String? book_name;
  ChapterModel({
    required this.id,
    required this.chapter_id,
    required this.book_id,
    required this.title,
    required this.number,
    required this.hadis_range,
    required this.book_name,
  });

  factory ChapterModel.fromRawJson(String str) =>
      ChapterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        id: json["_id"],
        chapter_id: json["chapter_id"],
        book_id: json["book_id"],
        title: json["title"],
        number: json["number"],
        hadis_range: json["hadis_range"],
        book_name: json["book_name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "chapter_id": chapter_id,
        "book_id": book_id,
        "title": title,
        "number": number,
        "hadis_range": hadis_range,
        "book_name": book_name,
      };
}
