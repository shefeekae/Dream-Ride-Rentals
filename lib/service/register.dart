import 'dart:convert';
import 'package:dream_ride_rentals/model/user_model.dart';
import 'package:http/http.dart' as http;

class RegisterUser {
  static Future<dynamic> registerUser(UserModel body) async {
    const url = 'http://localhost:8080/api/v1/user/register';
    final uri = Uri.parse(url);

    final encodedBody = jsonEncode(body);

    final response = await http.post(uri,
        body: encodedBody, headers: {'Content-Type': 'application/json'});

    final jsonResponse = jsonDecode(response.body);

    // print(sessionId);

    return jsonResponse['sessionId'];
  }
}
