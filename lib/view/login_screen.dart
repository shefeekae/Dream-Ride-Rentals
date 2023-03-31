import 'package:dream_ride_rentals/controller/login_controller.dart';
import 'package:dream_ride_rentals/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, this.onTap});
  final Function()? onTap;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController login = LoginController();
  final _formKey = GlobalKey<FormState>();
  void signInUser(BuildContext context) {
    login.loginUser(
        context: context,
        email: emailController.text,
        password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 4, 22, 35),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.white, Color.fromARGB(255, 130, 199, 255)])),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
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
              // Padding(
              //   padding: const EdgeInsets.only(top: 0, right: 0),
              //   child: Container(
              //     height: 600,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(100),
              //         image: const DecorationImage(
              //             image: AssetImage('assets/logo-alone.png'))),
              //   ),
              // ),
              Positioned(
                left: 65,
                top: 120,
                child: Text(
                  "Ready to roll? Let's go! \nLogin now.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.acme(fontSize: 30, color: Colors.cyan),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: SingleChildScrollView(
                  child: Container(
                    height: 600,
                    padding: const EdgeInsets.only(top: 60),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.grey[200]!.withOpacity(0.5)),
                    child: Column(
                      children: [
                        // Text(
                        //   "Ready to roll? Let's go!",
                        //   style: GoogleFonts.acme(
                        //     fontSize: 30,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 30,
                        // ),
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
                          obscureText: true,
                          validator: (value) =>
                              Validate.validatePassword(value),
                          hintText: 'Password',
                          controller: passwordController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signInUser(context);
                            }
                          },
                          label: 'Sign In',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not a member?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: onTap,
                              child: const Text(
                                'Register now',
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
            ],
          ),
        ),
      ),
    );
  }
}
