import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_clean_arch/data/models/class_model.dart';
import 'package:riverpod_clean_arch/data/models/student_model.dart';
import 'package:riverpod_clean_arch/data/network/apis/student_api.dart';
import 'package:flutter/material.dart';

abstract class StudentRepository {
  Future<List<StudentModel>> getAllStudents();

  Future<StudentModel> getStudentById({required String id});

  Future<String> addStudent({required StudentModel studentModel});

  Future<String> updateStudent({required StudentModel model});

  Future<Response> deleteStudent({required String id});

  Future<List<StudentModel>> searchByName({required String name});

  Future<List<StudentModel>> searchByFatherName({required String fatherName});

  Future<StudentModel> searchByGRNum({required String number});

  Future<String> toggleFreezeStatus({required String id});

  Future<FeesModel> getFeeDetailsById({required String id});

  Future<String> createFeeChallan({required FeesModel model});

  Future<List<ClassModel>> getClassList();

  Future<String> addClass(ClassModel classModel);

  Future<String> deleteClass(String id);

  Future<String> getFreezeCount();
}

class StudentRepositoryImpl extends StudentRepository {
  @override
  Future<List<StudentModel>> getAllStudents() async {
    try {
      final response = await StudentAPI.getAllStudents().request();
      final json = jsonDecode(response);

      final List<dynamic> j = json['data'];

      List<StudentModel> data = j.map((e) => StudentModel.fromJson(e)).toList();

      return data;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<String> addStudent({required StudentModel studentModel}) async {
    try {
      final response = await StudentAPI.addStudent(studentModel).request();
      final json = jsonDecode(response)['message'];
      return json;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<Response> deleteStudent({required String id}) async {
    try {
      final response = await StudentAPI.deleteStudent(id).request();
      return response;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<StudentModel> getStudentById({required String id}) async {
    try {
      final response = await StudentAPI.getStudentById(id).request();
      final json = jsonDecode(response);

      final dynamic j = json['data'];

      StudentModel data = StudentModel.fromJson(j);

      return data;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<List<StudentModel>> searchByName({required String name}) async {
    try {
      final response = await StudentAPI.searchByName(name).request();
      final json = jsonDecode(response);

      final List<dynamic> j = json['data'];

      List<StudentModel> data = j.map((e) => StudentModel.fromJson(e)).toList();

      return data;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<List<StudentModel>> searchByFatherName(
      {required String fatherName}) async {
    try {
      final response =
          await StudentAPI.searchByFatherName(fatherName).request();
      final json = jsonDecode(response);

      final List<dynamic> j = json['data'];

      List<StudentModel> data = j.map((e) => StudentModel.fromJson(e)).toList();

      return data;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<StudentModel> searchByGRNum({required String number}) async {
    try {
      final response = await StudentAPI.searchByGRNum(number).request();
      final json = jsonDecode(response);

      StudentModel data = StudentModel.fromJson(json);

      return data;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<String> toggleFreezeStatus({required String id}) async {
    try {
      final response = await StudentAPI.toggleFreezeStatus(id).request();
      return response;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<FeesModel> getFeeDetailsById({required String id}) async {
    try {
      print(id);
      final response = await StudentAPI.getFeeDetailsById(id).request();
      final json = jsonDecode(response);

      final FeesModel data = FeesModel.fromJson(json);

      return data;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<String> createFeeChallan({required FeesModel model}) async {
    try {
      final response = await StudentAPI.createFeeChallan(model).request();
      return jsonDecode(response)['message'];
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<String> updateStudent({required StudentModel model}) async {
    try {
      final response = await StudentAPI.updateStudent(model).request();
      final json = jsonDecode(response)['message'];
      return json;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<ClassModel>> getClassList() async {
    try {
      final response = await StudentAPI.getClassList().request();
      final List<dynamic> json = jsonDecode(response)['data'];
      final List<ClassModel> data =
          json.map((e) => ClassModel.fromJson(e)).toList();
      return data;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<String> deleteClass(String id) async {
    try {
      final response = await StudentAPI.deleteClass(id).request();
      final String json = jsonDecode(response)['message'];
      return json;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<String> addClass(ClassModel classModel) async {
    try {
      final response = await StudentAPI.addClass(classModel).request();
      final String json = jsonDecode(response)['message'];
      return json;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<String> getFreezeCount() async {
    try {
      final response = await StudentAPI.getFreezeCount().request();
      final String json = jsonDecode(response)['count'].toString();
      return json;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
