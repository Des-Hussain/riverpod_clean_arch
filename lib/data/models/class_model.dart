// To parse this JSON data, do
//
//     final classModel = classModelFromJson(jsonString);

import 'dart:convert';

ClassModel classModelFromJson(String str) =>
    ClassModel.fromJson(json.decode(str));

String classModelToJson(ClassModel data) => json.encode(data.toJson());

class ClassModel {
  String? id;
  String? title;
  String? code;

  ClassModel({
    this.id,
    this.title,
    this.code,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        id: json["id"],
        title: json["title"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "code": code,
      };
}
