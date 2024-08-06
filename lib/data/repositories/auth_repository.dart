import 'dart:convert';

import 'package:riverpod_clean_arch/data/models/login_model.dart';
import 'package:riverpod_clean_arch/data/network/apis/auth_api.dart';

abstract class AuthRepository {
  Future<LoginModel> loginUser(String username, String password);
}

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<LoginModel> loginUser(String username, String password) async {
    try {
      final res = await AuthAPI.login(username, password).request();
      final json = jsonDecode(res);
      final LoginModel data = LoginModel.fromJson(json['data']);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
