import 'package:dream_ride_rentals/model/login_model.dart';

import 'package:flutter/material.dart';

import '../model/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      name: '',
      email: '',
      phoneNumber: 0,
      password: '',
      answer: '',
      access: false,
      id: '',
      isAdmin: false,
      pic: '',
      v: 0,
      token: '');

  String token = '';

  User get user => _user;

  void setToken(String newToken) {
    token = newToken;
    notifyListeners();
  }

  void setUser(String user) {
    _user = userFromJson(user);
    notifyListeners();
  }

  void setUserLogin(String user) {
    _user = userLoginFromJson(user);
    notifyListeners();
  }

  void setUserModel(User user) {
    _user = user;
    notifyListeners();
  }
}
