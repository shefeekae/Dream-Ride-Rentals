import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginUser {
  static Future<void> loginUser(Map user) async {
    const url = 'http://localhost:8080/api/v1/user/login';
    final uri = Uri.parse(url);

    await http.post(uri,
        body: jsonEncode(user), headers: {'Content-Type': 'application/json'});
  }
}
