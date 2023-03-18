import 'package:dream_ride_rentals/service/verify_otp.dart';
import 'package:dream_ride_rentals/widgets/my_button.dart';
import 'package:dream_ride_rentals/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.sessionId});

  final String sessionId;

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              MyTextFormField(hintText: 'Otp', controller: otpController),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                label: 'Submit',
                onPressed: () => sendOtp(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendOtp(BuildContext context) async {
    final String otp = otpController.text;

    final body = {"otp": otp, "sessionId": sessionId};

    await VerifyOtp.verifyOtp(body);

    Navigator.of(context).pushNamed('/login');
  }
}
