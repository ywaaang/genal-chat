import 'dart:async';

import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/models/chat/chat.dart';
import 'package:boilerplate/models/chat/chat_list.dart';
import 'package:sembast/sembast.dart';

import 'local/constants/db_constants.dart';
import 'network/apis/login/login_api.dart';

class Repository {
  // login objects
  final LoginApi _loginApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._sharedPrefsHelper, this._loginApi);

  // Login:---------------------------------------------------------------------
  Future login(String username, String password) async {
    try {
      return await _loginApi
          .login({"username": username, "password": password}).then((res) {
        return res;
      }).catchError((error) => throw error);
    } catch (err) {
      throw err;
    }
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}
