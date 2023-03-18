import 'package:dream_ride_rentals/service/login.dart';
import 'package:flutter/material.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        children: [
          MyTextFormField(
            hintText: 'Email',
            controller: emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextFormField(
            hintText: 'Password',
            controller: passwordController,
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            onPressed: () => submitData(context),
            label: 'Sign In',
          )
        ],
      ))),
    );
  }

  void submitData(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    final body = {
      "email": email,
      "password": password,
    };

    await LoginUser.loginUser(body);

    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }
}
