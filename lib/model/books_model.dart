import 'dart:convert';

class BookModel {
  int? id;
  String? title;
  String? title_ar;
  int? number_of_hadis;
  String? abvr_code;
  String? book_name;
  String? book_descr;
  String? color_code;
  BookModel(
      {required this.id,
      required this.title,
      required this.title_ar,
      required this.number_of_hadis,
      required this.abvr_code,
      required this.book_name,
      required this.book_descr,
      required this.color_code});

  factory BookModel.fromRawJson(String str) =>
      BookModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["_id"],
        title: json["title"],
        title_ar: json["title_ar"],
        number_of_hadis: json["number_of_hadis"],
        abvr_code: json["abvr_code"],
        book_name: json["book_name"],
        book_descr: json["book_descr"],
        color_code: json["color_code"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "title_ar": title_ar,
        "number_of_hadis": number_of_hadis,
        "abvr_code": abvr_code,
        "book_name": book_name,
        "book_descr": book_descr,
        "color_code": color_code,
      };
}
