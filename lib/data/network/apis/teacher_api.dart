import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:riverpod_clean_arch/data/models/teacher_model.dart';
import 'package:riverpod_clean_arch/data/network/api_endpoints.dart';
import 'package:riverpod_clean_arch/data/network/api_provider.dart';
import 'package:riverpod_clean_arch/data/network/api_request_representable.dart';

enum TeacherAPIType {
  getAllTeachers,
  addTeacher,
  deleteTeacher,
  updateTeacher,
  getTeacherById,
  searchTeacher,
}

class TeacherAPI implements APIRequestRepresentable {
  TeacherAPIType type;
  String? id, name;
  TeacherModel? teacherModel;

  TeacherAPI._({
    required this.type,
    this.id,
    this.name,
    this.teacherModel,
  });

  TeacherAPI.getAllTeachers() : this._(type: TeacherAPIType.getAllTeachers);

  TeacherAPI.addTeacher(TeacherModel teacherModel)
      : this._(
          type: TeacherAPIType.addTeacher,
          teacherModel: teacherModel,
        );

  TeacherAPI.deleteTeacher(String id)
      : this._(
          type: TeacherAPIType.deleteTeacher,
          id: id,
        );

  TeacherAPI.updateTeacher(TeacherModel teacherModel)
      : this._(
          type: TeacherAPIType.updateTeacher,
          teacherModel: teacherModel,
        );

  TeacherAPI.getTeacherById(String id)
      : this._(
          type: TeacherAPIType.getTeacherById,
          id: id,
        );

  TeacherAPI.searchTeacher(String name)
      : this._(
          type: TeacherAPIType.searchTeacher,
          name: name,
        );

  @override
  get body {
    switch (type) {
      case TeacherAPIType.addTeacher:
      case TeacherAPIType.updateTeacher:
        return json.encode(teacherModel);
      default:
        return {};
    }
  }

  @override
  String get path {
    switch (type) {
      case TeacherAPIType.getAllTeachers:
        return APIEndpoint.getAllTeacher;
      case TeacherAPIType.addTeacher:
        return APIEndpoint.addTeacher;
      case TeacherAPIType.deleteTeacher:
        return APIEndpoint.deleteTeacher;
      case TeacherAPIType.updateTeacher:
        return APIEndpoint.updateTeacher;
      case TeacherAPIType.getTeacherById:
        return APIEndpoint.getTeacherById;
      case TeacherAPIType.searchTeacher:
        return APIEndpoint.searchTeacherUrl;
    }
  }

  @override
  Map<String, String>? get headers {
    return {'Content-Type': 'application/json; charset=utf-8', 'accept': '*/*'};
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case TeacherAPIType.getAllTeachers:
      case TeacherAPIType.getTeacherById:
      case TeacherAPIType.searchTeacher:
        return HTTPMethod.get;
      case TeacherAPIType.addTeacher:
        return HTTPMethod.post;
      case TeacherAPIType.updateTeacher:
        return HTTPMethod.put;
      case TeacherAPIType.deleteTeacher:
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
      case TeacherAPIType.getTeacherById:
      case TeacherAPIType.deleteTeacher:
        return {
          'id': id.toString(),
        };
      case TeacherAPIType.searchTeacher:
        return {
          'name': name.toString(),
        };
      default:
        return {};
    }
  }
}
