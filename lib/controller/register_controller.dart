import 'package:dream_ride_rentals/model/register_model.dart';
import 'package:dream_ride_rentals/service/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterController {
  AuthService register = AuthService();
  Future<Register> registerUser({
    required BuildContext context,
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
    required String answer,
  }) async {
    final body = {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      "answer": answer,
    };

    final response = await register.signUpUser(body: body, context: context);

    return response;
  }
}
