import 'dart:collection';
import 'package:flutter_1/api/authentication.dart';
import 'package:flutter/cupertino.dart';
import '../models/user.dart';

AuthenticationApi _authenticationApi = AuthenticationApi();

class UserProvider extends ChangeNotifier {
  User _user;
  UserProvider(this._user);

  User get user => _user;

  Future<User> loginAndSetUser (String email, String password) async {
    final loginResponse = await _authenticationApi.loginUser(email, password);
    if (loginResponse != null) {
      _user = loginResponse.user;
      notifyListeners();
      return _user;
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> logoutAndDeleteUser () async {
    final logoutResponse = await _authenticationApi.logoutUser();
    if (logoutResponse != null) {
      _user = User(id: 0, name: 'Guest', email: '', password: '');
      notifyListeners();
    } else {
      throw Exception('Failed to logout');
    }
  }
}