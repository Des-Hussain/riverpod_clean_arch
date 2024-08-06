import 'dart:convert';

import 'package:riverpod_clean_arch/data/network/api_endpoints.dart';
import 'package:riverpod_clean_arch/data/network/api_provider.dart';
import 'package:riverpod_clean_arch/data/network/api_request_representable.dart';

enum AuthApiType {
  login,
}

class AuthAPI implements APIRequestRepresentable {
  AuthApiType type;
  String? username, password;

  AuthAPI._({
    required this.type,
    this.username,
    this.password,
  });

  AuthAPI.login(String username, String pass)
      : this._(
          type: AuthApiType.login,
          username: username,
          password: pass,
        );

  @override
  get body {
    switch (type) {
      case AuthApiType.login:
        return jsonEncode({
          'username': username,
          'password': password,
        });
    }
  }

  @override
  String get path {
    switch (type) {
      case AuthApiType.login:
        return APIEndpoint.loginUrl;
    }
  }

  @override
  Map<String, String>? get headers {
    switch (type) {
      case AuthApiType.login:
        return {
          'Content-Type': 'application/json; charset=utf-8',
          'accept': '*/*'
        };
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case AuthApiType.login:
        return HTTPMethod.post;
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
      case AuthApiType.login:
        return {};
    }
  }
}
