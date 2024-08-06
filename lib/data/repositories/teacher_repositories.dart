import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_clean_arch/data/models/teacher_model.dart';
import 'package:riverpod_clean_arch/data/network/apis/teacher_api.dart';
import 'package:flutter/material.dart';

abstract class TeacherRepository {
  Future<List<TeacherModel>> getAllTeachers();

  Future<String> addTeacher({required TeacherModel teacherModel});

  Future<String> updateTeacher({required TeacherModel teacherModel});

  Future<Response> deleteTeacher({required String id});

  Future<TeacherModel> getTeacherById({required String id});

  Future<List<TeacherModel>> searchTeacher({required String name});
}

class TeacherRepositoryImpl extends TeacherRepository {
  @override
  Future<List<TeacherModel>> getAllTeachers() async {
    try {
      final response = await TeacherAPI.getAllTeachers().request();
      final json = jsonDecode(response);

      final List<dynamic> j = json['data'];

      List<TeacherModel> data = j.map((e) => TeacherModel.fromJson(e)).toList();

      return data;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<String> addTeacher({required TeacherModel teacherModel}) async {
    try {
      final response = await TeacherAPI.addTeacher(teacherModel).request();
      final json = jsonDecode(response)['message'];
      return json;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<Response> deleteTeacher({required String id}) async {
    try {
      final response = await TeacherAPI.deleteTeacher(id).request();
      return response;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<TeacherModel> getTeacherById({required String id}) async {
    try {
      final response = await TeacherAPI.getTeacherById(id).request();
      final json = jsonDecode(response);
      //
      // final dynamic j = json['data'];

      TeacherModel data = TeacherModel.fromJson(json);

      return data;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<String> updateTeacher({required TeacherModel teacherModel}) async {
    try {
      final response = await TeacherAPI.updateTeacher(teacherModel).request();
      final json = jsonDecode(response)['message'];
      return json;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  @override
  Future<List<TeacherModel>> searchTeacher({required String name}) async {
    try {
      final response = await TeacherAPI.searchTeacher(name).request();
      final List<dynamic> json = jsonDecode(response);
      final List<TeacherModel> data =
          json.map((e) => TeacherModel.fromJson(e)).toList();
      return data;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }
}
