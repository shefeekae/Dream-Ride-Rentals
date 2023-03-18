import 'dart:convert';

import 'package:http/http.dart' as http;

class VerifyOtp {
  static Future<void> verifyOtp(Map body) async {
    const url = 'http://localhost:8080/api/v1/user/verify-otp';
    final uri = Uri.parse(url);

    final encodedBody = jsonEncode(body);

    await http.post(uri,
        body: encodedBody, headers: {'Content-Type': 'application/json'});
  }
}
