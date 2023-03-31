import 'package:dream_ride_rentals/service/auth_service.dart';
import 'package:flutter/material.dart';

import '../model/login_model.dart';
import '../model/user_model.dart';

class GetUser {
  AuthService authService = AuthService();
  Future<User> getUserData(BuildContext context) async {
    final response = await authService.getUserData(context);

    return response;
  }
}
