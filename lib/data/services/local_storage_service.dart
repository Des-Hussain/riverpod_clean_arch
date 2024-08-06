import 'dart:convert';
import 'package:riverpod_clean_arch/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Key { user, fcmToken, hasShownTutorial, appleName }

class LocalStorageService {
  SharedPreferences? _prefs;

  static final _singleton = LocalStorageService();

  static LocalStorageService get instance => _singleton;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  LoginModel? get user {
    final rawJson = _prefs?.getString(Key.user.toString());

    if (rawJson == null) {
      return null;
    }
    return LoginModel.fromRawJson(rawJson);
  }

  set user(LoginModel? value) {
    if (value != null) {
      _prefs?.setString(Key.user.toString(), json.encode(value).toString());
    } else {
      _prefs?.remove(Key.user.toString());
    }
  }

  void updateUserName(String newName) async {
    final rawJson = _prefs?.getString(Key.user.toString());
    if (rawJson != null) {
      LoginModel userDetails = LoginModel.fromRawJson(rawJson);

      _prefs?.setString(Key.user.toString(), json.encode(userDetails.toJson()));
    }
  }

  String? get fcmToken {
    final token = _prefs?.getString(Key.fcmToken.toString());
    if (token == null) {
      return null;
    }
    return token;
  }

  set fcmToken(String? token) {
    if (token != null) {
      _prefs?.setString(Key.fcmToken.toString(), token);
    } else {
      _prefs?.remove(Key.fcmToken.toString());
    }
  }

  String? get appleName {
    final appleName = _prefs?.getString(Key.appleName.toString());
    if (appleName == null) {
      return '';
    }
    return appleName;
  }

  set appleName(String? appleName) {
    if (appleName != null) {
      _prefs?.setString(Key.appleName.toString(), appleName);
    } else {
      _prefs?.remove(Key.appleName.toString());
    }
  }

  bool get hasShownTutorial {
    final isFirst = _prefs?.getBool(Key.hasShownTutorial.toString());
    if (isFirst == null) {
      return false;
    }
    return isFirst;
  }

  set hasShownTutorial(bool? isFirst) {
    if (isFirst != null) {
      _prefs?.setBool(Key.hasShownTutorial.toString(), isFirst);
    } else {
      _prefs?.remove(Key.hasShownTutorial.toString());
    }
  }

  logoutUser() async {
    await _prefs?.remove(Key.user.toString());
  }
}
