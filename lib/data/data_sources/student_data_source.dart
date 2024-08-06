// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:riverpod_clean_arch/common/resources/urls.dart';
// import 'package:riverpod_clean_arch/data/models/student_model.dart';
// import 'package:riverpod_clean_arch/data/network/end_points.dart';
//
// abstract class StudentDataSource {
//   Future<List<StudentModel>> getAllStudents();
//
//   Future<Response> addStudent({required StudentModel studentModel});
//
//   Future<Response> deleteStudent({required String id});
//
//   Future<StudentModel> getStudentById({required String id});
//
//   Future<List<StudentModel>> searchByName({required String name});
//
//   Future<List<StudentModel>> searchByFatherName({required String fatherName});
//
//   Future<StudentModel> searchByGRNum({required String number});
//
//   Future<Response> toggleFreezeStatus({required String id});
//
//   Future<FeesModel> getFeeDeatilsById({required String id});
//   Future<Response> createFeeChallan({required FeesModel model});
//   Future<Response> updateStudent({required StudentModel model});
// }
//
// class StudentDataSourceImpl extends StudentDataSource {
//   StudentDataSourceImpl();
//
//   Dio dio = Dio();
//
//   @override
//   Future<List<StudentModel>> getAllStudents() async {
//     // final token = await storage.read(key: Strings.token);
//     const url = Urls.BASE_URL + EndPoints.getAllStudents;
//
//     // dio.options.headers['Authorization'] = 'Bearer $token';
//     final response = await dio.get(
//       url,
//       options: Options(headers: {
//         "Access-Control_Allow_Origin": "*",
//         'Content-Type': 'text/plain',
//         'Accept': 'Application/json',
//       }),
//     );
//
//     List<dynamic>? jsonResponse = response.data['data'];
//
//     List<StudentModel>? studentsList =
//         jsonResponse?.map((data) => StudentModel.fromJson(data)).toList();
//
//     return studentsList ?? [];
//   }
//
//   @override
//   Future<Response> addStudent({required StudentModel studentModel}) async {
//     const url = Urls.BASE_URL + EndPoints.addStudent;
//     // dio.options.headers['Authorization'] = 'Bearer $token';
//     print(studentModel.toJson());
//     final response = await dio.post(
//       url,
//       data: studentModel,
//       options: Options(headers: {
//         'Content-Type': 'application/json',
//         'Accept': '*/*',
//       }),
//     );
//     return response;
//   }
//   @override
//   Future<Response> updateStudent({required StudentModel model}) async {
//     const url = Urls.BASE_URL + EndPoints.updateStudent;
//     // dio.options.headers['Authorization'] = 'Bearer $token';
//     print(model.toJson());
//     final response = await dio.put(
//       url,
//       data: model,
//       options: Options(headers: {
//         'Content-Type': 'application/json',
//         'Accept': '*/*',
//       }),
//     );
//     return response;
//   }
//
//   @override
//   Future<Response> deleteStudent({required String id}) async {
//     final body = jsonEncode(id);
//
//     // dio.options.headers['Authorization'] = 'Bearer $token';
//
//     const url = Urls.BASE_URL + EndPoints.deleteStudent;
//     final response = await dio.delete(url, queryParameters: {'id': id});
//
//     return response;
//   }
//
//   @override
//   Future<StudentModel> getStudentById({required String id}) async {
//     const url = Urls.BASE_URL + EndPoints.getStudentById;
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
//     StudentModel studentsList = StudentModel.fromJson(jsonResponse);
//
//     return studentsList;
//   }
//
//   @override
//   Future<List<StudentModel>> searchByName({required String name}) async {
//     const url = Urls.BASE_URL + EndPoints.searchByName;
//
//     final response = await dio.get(
//       url,
//       queryParameters: {'firstName' :name},
//       options: Options(headers: {
//         "Access-Control_Allow_Origin": "*",
//         'Content-Type': 'text/plain',
//         'Accept': 'Application/json',
//       }),
//     );
//
//     List<dynamic> jsonResponse = response.data['data'];
//
//     List<StudentModel> studentsList =
//         jsonResponse.map((data) => StudentModel.fromJson(data)).toList();
//
//     studentsList.toList();
//     return studentsList;
//   }
//
//   @override
//   Future<List<StudentModel>> searchByFatherName(
//       {required String fatherName}) async {
//     const url = Urls.BASE_URL + EndPoints.searchByFatherName;
//
//     // dio.options.headers['Authorization'] = 'Bearer $token';
//     final response = await dio.get(
//       url,
//       queryParameters: {'fatherName' :fatherName},
//       options: Options(headers: {
//         "Access-Control_Allow_Origin": "*",
//         'Content-Type': 'text/plain',
//         'Accept': 'Application/json',
//       }),
//     );
//
//     List<dynamic> jsonResponse = response.data['data'];
//
//     List<StudentModel> studentsList =
//         jsonResponse.map((data) => StudentModel.fromJson(data)).toList();
//
//     return studentsList;
//   }
//
//   @override
//   Future<StudentModel> searchByGRNum({required String number}) async {
//     const url = Urls.BASE_URL + EndPoints.searchByGRNum;
//
//     // dio.options.headers['Authorization'] = 'Bearer $token';
//     final response = await dio.get(
//       url,
//       queryParameters: {'grNum' :number},
//
//       options: Options(headers: {
//         "Access-Control_Allow_Origin": "*",
//         'Content-Type': 'text/plain',
//         'Accept': 'Application/json',
//       }),
//     );
//
//     List<dynamic> jsonResponse = response.data['data'];
//
//     List<StudentModel> studentsList = jsonResponse.map((e) =>  StudentModel.fromJson(e)).toList();
//
//     return studentsList.first;
//   }
//
//   @override
//   Future<Response> toggleFreezeStatus({required String id}) async {
//     const url = Urls.BASE_URL + EndPoints.toggleFreezeStatus;
//
//     // dio.options.headers['Authorization'] = 'Bearer $token';
//     final response = await dio.post(
//       url,
//       queryParameters: {'id' :id},
//       options: Options(headers: {
//         'Accept': '*/*',
//       }),
//     );
//
//     return response;
//   }
//
//   @override
//   Future<FeesModel> getFeeDeatilsById({required String id}) async {
//     const url = Urls.BASE_URL + EndPoints.getFeesById;
//
//     final response = await dio.get(
//       url,
//       queryParameters: {'studentId' :id},
//       options: Options(headers: {
//         'accept': '*/*',
//       }),
//     );
//
//     final json = response.data;
//     if(json['data'] != null) {
//       final FeesModel data = FeesModel.fromJson(json['data']);
//       return data;
//     }
//     return FeesModel();
//   }
//
//   @override
//   Future<Response> createFeeChallan({required FeesModel model}) async {
//     const url = Urls.BASE_URL + EndPoints.createFeesChallan;
//
//     // dio.options.headers['Authorization'] = 'Bearer $token';
//     print(model.toJson());
//     final response = await dio.post(
//       url,
//       data: model,
//       options: Options(headers: {
//         'Accept': '*/*',
//         'Content-Type': 'application/json'
//       }),
//     );
//     return response;
//   }
// }
