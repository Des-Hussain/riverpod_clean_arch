// import 'dart:convert';
// import 'package:dio/dio.dart';
//
// import '../../common/resources/urls.dart';
// import '../models/teacher_model.dart';
// import '../network/end_points.dart';
//
// abstract class TeacherDataSource {
//   Future<List<TeacherModel>> getAllTeachers();
//
//   Future<Response> addTeacher({required TeacherModel teacherModel});
//
//   Future<Response> deleteTeacher({required String id});
//
//   Future<TeacherModel> updateTeacher({required TeacherModel teacherModel});
//
//   Future<TeacherModel> getTeacherById({required String id});
// }
//
// class TeacherDataSourceImpl extends TeacherDataSource {
//   TeacherDataSourceImpl();
//
//   Dio dio = Dio();
//
//   @override
//   Future<List<TeacherModel>> getAllTeachers() async {
//     // final token = await storage.read(key: Strings.token);
//     const url = Urls.BASE_URL + EndPoints.getAllTeacher;
//
//     // dio.options.headers['Authorization'] = 'Bearer $token';
//     final response = await dio.get(
//       url,
//       options: Options(headers: {
//         'Content-Type': 'application/json',
//         'Accept': '*/*',
//       }),
//     );
//
//     List<dynamic> jsonResponse = response.data['data'];
//
//     print(jsonResponse.toList());
//     List<TeacherModel> teachersList =
//         jsonResponse.map((data) => TeacherModel.fromJson(data)).toList();
//
//     return teachersList;
//   }
//
//   @override
//   Future<Response> addTeacher({required TeacherModel teacherModel}) async {
//     const url = Urls.BASE_URL + EndPoints.addTeacher;
//     // dio.options.headers['Authorization'] = 'Bearer $token';
//     final response = await dio.post(
//       url,
//       data: teacherModel,
//       options: Options(headers: {
//         'Content-Type': 'application/json',
//         'Accept': '*/*',
//       }),
//     );
//     return response;
//   }
//
//   @override
//   Future<Response> deleteTeacher({required String id}) async {
//     final body = jsonEncode(id);
//
//     // dio.options.headers['Authorization'] = 'Bearer $token';
//
//     const url = Urls.BASE_URL + EndPoints.deleteTeacher;
//     final response = await dio.delete(url, queryParameters: {'id': id});
//
//     return response;
//   }
//
//   @override
//   Future<TeacherModel> getTeacherById({required String id}) async {
//     const url = Urls.BASE_URL + EndPoints.getTeacherById;
//
//     final response = await dio.get(
//       url,
//       queryParameters: ({'id': id}),
//       options: Options(headers: {
//         "Access-Control_Allow_Origin": "*",
//         'Content-Type': 'text/plain',
//         'Accept': 'Application/json',
//       }),
//     );
//
//     dynamic jsonResponse = response.data['data'];
//
//     final teachersList = TeacherModel.fromJson(jsonResponse);
//
//     return teachersList;
//   }
//
//   @override
//   Future<TeacherModel> updateTeacher(
//       {required TeacherModel teacherModel}) async {
//     print(teacherModel.id);
//     const url = Urls.BASE_URL + EndPoints.addTeacher;
//
//     final response = await dio.put(
//       url,
//       data: teacherModel,
//       options: Options(
//         headers: {
//           "Access-Control_Allow_Origin": "*",
//           'Content-Type': 'text/plain',
//           'Accept': 'Application/json',
//         },
//       ),
//     );
//
//     dynamic jsonResponse = response.data['data'];
//
//     final teacherData = TeacherModel.fromJson(jsonResponse);
//
//     return teacherData;
//   }
// }
