import 'package:dio/dio.dart';

abstract class AuthDataSource {
  Future<Response> loginUser({
    required String username,
    required String password,
  });
}

