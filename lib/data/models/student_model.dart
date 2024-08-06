import 'dart:convert';

StudentModel studentModelFromJson(String str) =>
    StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  String? id;
  String? createdBy;
  String? grNum;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? phoneNum;
  String? emergencyNum;
  String? schoolName;
  String? classId;
  String? classTitle;
  String? address;
  String? dateOfJoining;
  String? dateOfBirth;
  String? fatherCnic;
  List<FeesModel>? feesModel;
  int? isActive;

  StudentModel({
    this.id,
    this.createdBy,
    this.grNum,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.phoneNum,
    this.emergencyNum,
    this.schoolName,
    this.classId,
    this.address,
    this.dateOfJoining,
    this.dateOfBirth,
    this.fatherCnic,
    this.feesModel,
    this.isActive,
    this.classTitle,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        id: json['id'],
        createdBy: json["createdBy"],
        grNum: json["grNum"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fatherName: json["fatherName"],
        phoneNum: json["phoneNum"],
        emergencyNum: json["emergencyNum"],
        schoolName: json["schoolName"],
        classId: json["classId"],
        classTitle: json["class"],
        address: json["address"],
        dateOfJoining: json["dateOfJoining"],
        dateOfBirth: json["dateOfBirth"],
        fatherCnic: json["fatherCNIC"],
        feesModel: json["fees"] == [] || json['fees'] == null
            ? null
            : List<FeesModel>.from(
                json["fees"]?.map((x) => FeesModel.fromJson(x))),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdBy": createdBy,
        "grNum": grNum,
        "firstName": firstName,
        "lastName": lastName,
        "fatherName": fatherName,
        "phoneNum": phoneNum,
        "emergencyNum": emergencyNum,
        "schoolName": schoolName,
        "classId": classId,
        "class": classTitle,
        "address": address,
        "dateOfJoining": dateOfJoining,
        "dateOfBirth": dateOfBirth,
        "fatherCNIC": fatherCnic,
        "fees": feesModel == null
            ? null
            : List<dynamic>.from(feesModel!.map((x) => x.toJson())),
        "isActive": isActive,
      };
}

class FeesModel {
  String? studentId;
  String? month;
  String? dueDate;
  double? totalFees;
  double? balanceFees;
  String? grNum;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? phoneNum;
  int? isActive;
  String? classTitle;
  String? classCode;
  String? classId;

  FeesModel({
    this.studentId,
    this.month,
    this.dueDate,
    this.totalFees,
    this.balanceFees,
    this.grNum,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.phoneNum,
    this.isActive,
    this.classTitle,
    this.classCode,
    this.classId,
  });

  factory FeesModel.fromRawJson(String str) =>
      FeesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeesModel.fromJson(Map<String, dynamic> json) => FeesModel(
        studentId: json["studentId"],
        month: json["month"],
        dueDate: json["dueDate"],
        totalFees: json["totalFees"],
        balanceFees: json["balanceFees"],
        grNum: json["grNum"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fatherName: json["fatherName"],
        phoneNum: json["phoneNum"],
        isActive: json["isActive"],
        classTitle: json["classTitle"],
        classCode: json["classCode"],
        classId: json["classId"],
      );

  Map<String, dynamic> toJson() => {
        "studentId": studentId,
        "month": month,
        "dueDate": dueDate,
        "totalFees": totalFees,
        "balanceFees": balanceFees,
        "grNum": grNum,
        "firstName": firstName,
        "lastName": lastName,
        "fatherName": fatherName,
        "phoneNum": phoneNum,
        "isActive": isActive,
        "classTitle": classTitle,
        "classCode": classCode,
        "classId": classId,
      };
}
