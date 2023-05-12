import 'package:dream_ride_rentals/controller/otp_controller.dart';
import 'package:dream_ride_rentals/widgets/my_button.dart';
import 'package:dream_ride_rentals/widgets/otp_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.sessionId});

  final String sessionId;

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String otp = '';

  OtpController sendOtp = OtpController();

  void verifyOtp(BuildContext context) {
    sendOtp.otpController(context: context, sessionId: sessionId, otp: otp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.white, Color.fromARGB(255, 130, 199, 255)])),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200]!.withOpacity(0.5),
          ),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Text(
                    "Phone Number Verification",
                    style: GoogleFonts.acme(fontSize: 20),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpTextField(
                        autofocus: true,
                        controller: _fieldOne,
                      ),
                      OtpTextField(
                        autofocus: false,
                        controller: _fieldTwo,
                      ),
                      OtpTextField(
                        controller: _fieldThree,
                        autofocus: false,
                      ),
                      OtpTextField(
                        controller: _fieldFour,
                        autofocus: false,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    label: 'Submit',
                    onPressed: () {
                      otp = _fieldOne.text +
                          _fieldTwo.text +
                          _fieldThree.text +
                          _fieldFour.text;

                      if (_formKey.currentState!.validate()) {
                        verifyOtp(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
