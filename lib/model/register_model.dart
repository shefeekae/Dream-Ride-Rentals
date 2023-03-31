// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    required this.message,
    required this.success,
    required this.sessionId,
  });

  String message;
  bool success;
  String sessionId;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        message: json["message"],
        success: json["success"],
        sessionId: json["sessionId"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "sessionId": sessionId,
      };
}
