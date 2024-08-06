// To parse this JSON data, do
//
//     final teacherModel = teacherModelFromJson(jsonString);

import 'dart:convert';

TeacherModel teacherModelFromJson(String str) =>
    TeacherModel.fromJson(json.decode(str));

String teacherModelToJson(TeacherModel data) => json.encode(data.toJson());

class TeacherModel {
  String? id;
  String? name;
  String? phoneNumber;
  String? address;
  String? emergencyNumber;
  String? designation;
  String? modifiedBy;
  double? salary;
  bool? isActive;

  TeacherModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.address,
    this.emergencyNumber,
    this.designation,
    this.salary,
    this.isActive,
    this.modifiedBy,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        emergencyNumber: json["emergencyNumber"],
        designation: json["designation"],
        salary: json["salary"],
        isActive: json["isActive"],
        modifiedBy: json["modifiedBy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phoneNumber": phoneNumber,
        "address": address,
        "emergencyNumber": emergencyNumber,
        "designation": designation,
        "salary": salary,
        "isActive": isActive,
        "modifiedBy": modifiedBy,
      };
}
