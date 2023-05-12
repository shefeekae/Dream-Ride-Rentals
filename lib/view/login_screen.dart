import 'package:dream_ride_rentals/controller/login_controller.dart';
import 'package:dream_ride_rentals/validator/validation.dart';
import 'package:dream_ride_rentals/widgets/color_ball.dart';
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color.fromARGB(255, 4, 22, 35),
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Colors.white,
              //  Color.fromARGB(255, 2, 198, 243)
              Color.fromARGB(255, 210, 252, 198)
            ])),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Positioned(
                left: size.width * 0.5,
                top: size.height * 0.16,
                child: const ColorBall(
                  begin: Alignment.centerRight,
                  end: Alignment.bottomLeft,
                  height: 70,
                  width: 70,
                  colors: [
                    Color.fromARGB(255, 178, 250, 53),
                    Color.fromARGB(255, 51, 71, 255),
                  ],
                ),
              ),
              Positioned(
                left: size.width * 0.2,
                top: size.height * 0.2,
                child: const ColorBall(
                  begin: Alignment.centerRight,
                  end: Alignment.bottomLeft,
                  height: 150,
                  width: 150,
                  colors: [
                    Color.fromARGB(255, 127, 239, 52),
                    Color.fromARGB(255, 0, 149, 255)
                  ],
                ),
              ),
              Positioned(
                left: size.width * 0.4,
                top: size.height * 0.3,
                child: const ColorBall(
                  begin: Alignment.centerRight,
                  end: Alignment.bottomLeft,
                  height: 110,
                  width: 110,
                  colors: [
                    Color.fromARGB(255, 45, 239, 223),
                    Color.fromARGB(255, 0, 149, 255),
                  ],
                ),
              ),
              ListView(
                physics: const BouncingScrollPhysics(),
                reverse: true,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        ),
                        color: Colors.grey[200]!.withOpacity(0.5)),
                    child: Column(
                      children: [
                        Text(
                          "Login",
                          style: GoogleFonts.b612(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
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
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
