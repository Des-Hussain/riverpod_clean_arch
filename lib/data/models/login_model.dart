import 'dart:convert';

class LoginModel {
  String? userId;
  String? username;
  String? role;
  String? token;

  LoginModel({
    this.userId,
    this.username,
    this.role,
    this.token,
  });

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    userId: json["userId"],
    username: json["username"],
    role: json["role"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "username": username,
    "role": role,
    "token": token,
  };
}
