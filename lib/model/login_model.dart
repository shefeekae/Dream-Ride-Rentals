// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

import 'package:dream_ride_rentals/model/user_model.dart';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

User userFromJson(String str) => User.fromJson(json.decode(str));
User userLoginFromJson(String str) => User.fromJson(json.decode(str)["user"]);

class Login {
  Login({
    required this.message,
    required this.success,
    required this.token,
    required this.user,
  });

  String message;
  bool success;
  String token;
  User user;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        message: json["message"],
        success: json["success"],
        token: json["token"],
        user: User.fromJson(json["user"], json["token"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "token": token,
        "user": user.toJson(),
      };
}
