import 'package:dream_ride_rentals/service/auth_service.dart';
// import 'package:dream_ride_rentals/service/verify_otp.dart';
import 'package:flutter/material.dart';

class OtpController {
  AuthService verifyOtp = AuthService();

  otpController({
    required BuildContext context,
    required String otp,
    required String sessionId,
  }) {
    final body = {"otp": otp, "sessionId": sessionId};
    verifyOtp.verifyOtp(context: context, body: body);
  }
}
