import 'package:dream_ride_rentals/controller/register_controller.dart';
import 'package:dream_ride_rentals/service/auth_service.dart';
import 'package:dream_ride_rentals/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, this.onTap});
  final Function()? onTap;
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController favoriteCarController = TextEditingController();

  final AuthService authService = AuthService();

  final RegisterController registerController = RegisterController();
  final _formKey = GlobalKey<FormState>();

  signUpUser(BuildContext context) {
    registerController.registerUser(
        context: context,
        name: nameController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        password: passwordController.text,
        answer: favoriteCarController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.white, Color.fromARGB(255, 130, 199, 255)])),
        child: Form(
          key: _formKey,
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 147),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Colors.red, Colors.orange]),
                  color: const Color.fromARGB(255, 217, 74, 13),
                  borderRadius: BorderRadius.circular(90),
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 100,
              child: Text(
                "Drive your dreams with us! \nRegister now.",
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(fontSize: 30, color: Colors.cyan),
                maxLines: 2,
              ),
            ),
            Positioned(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              top: 180,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                reverse: true,
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.grey[200]!.withOpacity(0.5)),
                  child: Column(
                    children: [
                      // Text(
                      //   "Drive your dreams with us! Register now.",
                      //   textAlign: TextAlign.center,
                      //   style: GoogleFonts.acme(fontSize: 30),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(
                        hintText: 'Name',
                        controller: nameController,
                        obscureText: false,
                        validator: (value) => Validate.validateName(value),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(
                        obscureText: false,
                        validator: (value) => Validate.validateEmail(value),
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(
                        obscureText: false,
                        validator: (value) =>
                            Validate.validatePhoneNumber(value),
                        hintText: 'Phone Number',
                        controller: phoneNumberController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(
                        obscureText: true,
                        validator: (value) => Validate.validatePassword(value),
                        hintText: 'Password',
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(
                        obscureText: false,
                        validator: (value) => Validate.validatePassword(value),
                        hintText: 'Favourite Car',
                        controller: favoriteCarController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            signUpUser(context);
                          }
                        },
                        label: 'Sign Up',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: onTap,
                            child: const Text(
                              'Login now',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
