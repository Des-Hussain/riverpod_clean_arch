import 'dart:convert';

import 'package:riverpod_clean_arch/data/models/class_model.dart';
import 'package:riverpod_clean_arch/data/models/student_model.dart';
import 'package:riverpod_clean_arch/data/network/api_endpoints.dart';
import 'package:riverpod_clean_arch/data/network/api_provider.dart';
import 'package:riverpod_clean_arch/data/network/api_request_representable.dart';

enum StudentAPIType {
  getAllStudents,
  addStudent,
  deleteStudent,
  getStudentById,
  searchByName,
  searchByFatherName,
  searchByGRNum,
  toggleFreezeStatus,
  getFeeDetailsById,
  createFeeChallan,
  updateStudent,
  getClassList,
  addClass,
  deleteClass,
  getFreezeCount,
}

class StudentAPI implements APIRequestRepresentable {
  StudentAPIType type;
  String? id, name, fatherName, grNum;
  StudentModel? studentModel;
  FeesModel? feesModel;
  ClassModel? classModel;

  StudentAPI._({
    required this.type,
    this.id,
    this.name,
    this.fatherName,
    this.grNum,
    this.studentModel,
    this.feesModel,
    this.classModel,
  });

  StudentAPI.getAllStudents() : this._(type: StudentAPIType.getAllStudents);

  StudentAPI.addStudent(StudentModel studentModel)
      : this._(
          type: StudentAPIType.addStudent,
          studentModel: studentModel,
        );

  StudentAPI.deleteStudent(String id)
      : this._(
          type: StudentAPIType.deleteStudent,
          id: id,
        );

  StudentAPI.getStudentById(String id)
      : this._(
          type: StudentAPIType.getStudentById,
          id: id,
        );

  StudentAPI.searchByName(String name)
      : this._(
          type: StudentAPIType.searchByName,
          name: name,
        );

  StudentAPI.searchByFatherName(String fatherName)
      : this._(
          type: StudentAPIType.searchByFatherName,
          fatherName: fatherName,
        );

  StudentAPI.searchByGRNum(String grNum)
      : this._(
          type: StudentAPIType.searchByGRNum,
          grNum: grNum,
        );

  StudentAPI.toggleFreezeStatus(String id)
      : this._(
          type: StudentAPIType.toggleFreezeStatus,
          id: id,
        );

  StudentAPI.getFeeDetailsById(String id)
      : this._(
          type: StudentAPIType.getFeeDetailsById,
          id: id,
        );

  StudentAPI.createFeeChallan(FeesModel feesModel)
      : this._(
          type: StudentAPIType.createFeeChallan,
          feesModel: feesModel,
        );

  StudentAPI.updateStudent(StudentModel studentModel)
      : this._(
          type: StudentAPIType.updateStudent,
          studentModel: studentModel,
        );

  StudentAPI.getClassList()
      : this._(
          type: StudentAPIType.getClassList,
        );

  StudentAPI.deleteClass(String id)
      : this._(
          type: StudentAPIType.deleteClass,
          id: id,
        );

  StudentAPI.addClass(ClassModel classModel)
      : this._(
          type: StudentAPIType.addClass,
          classModel: classModel,
        );

  StudentAPI.getFreezeCount()
      : this._(
          type: StudentAPIType.getFreezeCount,
        );

  @override
  get body {
    switch (type) {
      case StudentAPIType.addStudent:
      case StudentAPIType.updateStudent:
        return json.encode(studentModel);
      case StudentAPIType.createFeeChallan:
        return json.encode(feesModel);
      case StudentAPIType.addClass:
        return json.encode(classModel);
      default:
        return {};
    }
  }

  @override
  String get path {
    switch (type) {
      case StudentAPIType.getAllStudents:
        return APIEndpoint.getAllStudents;
      case StudentAPIType.addStudent:
        return APIEndpoint.addStudent;
      case StudentAPIType.deleteStudent:
        return APIEndpoint.deleteStudent;
      case StudentAPIType.getStudentById:
        return APIEndpoint.getStudentById;
      case StudentAPIType.searchByName:
        return APIEndpoint.searchByName;
      case StudentAPIType.searchByFatherName:
        return APIEndpoint.searchByFatherName;
      case StudentAPIType.searchByGRNum:
        return APIEndpoint.searchByGRNum;
      case StudentAPIType.toggleFreezeStatus:
        return APIEndpoint.toggleFreezeStatus;
      case StudentAPIType.getFeeDetailsById:
        return APIEndpoint.getFeesById;
      case StudentAPIType.createFeeChallan:
        return APIEndpoint.createFeesChallan;
      case StudentAPIType.updateStudent:
        return APIEndpoint.updateStudent;
      case StudentAPIType.getClassList:
        return APIEndpoint.getClassListUrl;
      case StudentAPIType.deleteClass:
        return APIEndpoint.deleteClassUrl;
      case StudentAPIType.addClass:
        return APIEndpoint.addClassUrl;
      case StudentAPIType.getFreezeCount:
        return APIEndpoint.toggleCountUrl;
    }
  }

  @override
  Map<String, String>? get headers {
    switch (type) {
      case StudentAPIType.toggleFreezeStatus:
        return {'accept': '*/*'};
      default:
        return {
          'Content-Type': 'application/json; charset=utf-8',
          'accept': '*/*'
        };
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case StudentAPIType.getAllStudents:
      case StudentAPIType.getStudentById:
      case StudentAPIType.searchByName:
      case StudentAPIType.searchByFatherName:
      case StudentAPIType.searchByGRNum:
      case StudentAPIType.getFeeDetailsById:
      case StudentAPIType.getClassList:
      case StudentAPIType.getFreezeCount:
        return HTTPMethod.get;
      case StudentAPIType.addStudent:
      case StudentAPIType.createFeeChallan:
      case StudentAPIType.toggleFreezeStatus:
      case StudentAPIType.addClass:
        return HTTPMethod.post;
      case StudentAPIType.updateStudent:
        return HTTPMethod.put;
      case StudentAPIType.deleteStudent:
      case StudentAPIType.deleteClass:
        return HTTPMethod.delete;
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, String>? get urlParams {
    switch (type) {
      case StudentAPIType.getStudentById:
      case StudentAPIType.deleteStudent:
      case StudentAPIType.toggleFreezeStatus:
      case StudentAPIType.deleteClass:
        return {
          'id': id.toString(),
        };
      case StudentAPIType.getFeeDetailsById:
        return {
          'studentId': id.toString(),
        };
      case StudentAPIType.searchByName:
        return {
          'firstName': name.toString(),
        };
      case StudentAPIType.searchByFatherName:
        return {
          'fatherName': fatherName.toString(),
        };
      case StudentAPIType.searchByGRNum:
        return {
          'grNum': grNum.toString(),
        };
      default:
        return {};
    }
  }
}
