import 'dart:convert';

class HadithModel {
  int? id;
  int? chapter_id;
  int? book_id;
  int? section_id;
  int? hadith_id;
  String? hadith_key;
  String? title;
  String? narrator;
  String? bn;
  String? ar;
  String? ar_diacless;
  int? grade_id;
  String? grade;
  String? grade_color;
  String? note;
  int? number;
  String? book_name;
  HadithModel({
    required this.id,
    required this.chapter_id,
    required this.book_id,
    required this.section_id,
    required this.hadith_id,
    required this.hadith_key,
    required this.title,
    required this.narrator,
    required this.bn,
    required this.ar,
    required this.ar_diacless,
    required this.grade_id,
    required this.grade,
    required this.grade_color,
    required this.note,
    required this.number,
    required this.book_name,
  });

  factory HadithModel.fromRawJson(String str) =>
      HadithModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HadithModel.fromJson(Map<String, dynamic> json) => HadithModel(
        id: json["_id"],
        chapter_id: json["chapter_id"],
        book_id: json["book_id"],
        title: json["title"],
        number: json["number"],
        book_name: json["book_name"],
        section_id: json["section_id"],
        hadith_key: json["hadith_key"],
        hadith_id: json["hadith_id"],
        narrator: json["narrator"],
        bn: json["bn"],
        ar:json["ar"],
        ar_diacless: json["ar_diacless"],
        grade_id: json["grade_id"],
        grade: json["grade"],
        grade_color: json["grade_color"],
         note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "chapter_id": chapter_id,
        "book_id": book_id,
        "title": title,
        "number": number,
        "book_name": book_name,
        "section_id": section_id,
        "hadith_key": hadith_key,
         "hadith_id": hadith_id,
        "narrator": narrator,
        "bn": bn,
        "ar": ar,
        "ar_diacless": ar_diacless,
        "grade_id": grade_id,
        "grade": grade,
        "grade_color": grade_color,
        "note": note,
      };
}
