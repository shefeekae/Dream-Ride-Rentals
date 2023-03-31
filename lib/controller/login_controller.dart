import 'package:dream_ride_rentals/model/login_model.dart';
import 'package:dream_ride_rentals/service/auth_service.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class LoginController {
  AuthService userLogin = AuthService();
  Future<Login> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final body = {
      "email": email,
      "password": password,
    };

    User user = User(
        pic: '',
        isAdmin: false,
        id: '',
        name: '',
        email: email,
        password: password,
        phoneNumber: 0,
        answer: '',
        access: false,
        v: 0);

    final loginDetails =
        Login(message: '', success: false, token: '', user: user);

    final response = await userLogin.signInUser(
        context: context, body: body, jsonResponse: loginDetails);

    return response;
  }
}
