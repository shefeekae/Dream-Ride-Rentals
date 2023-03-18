import 'package:dream_ride_rentals/model/user_model.dart';
import 'package:dream_ride_rentals/service/register.dart';
import 'package:flutter/material.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController favoriteCarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        children: [
          MyTextFormField(
            hintText: 'Name',
            controller: nameController,
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextFormField(
            hintText: 'Email',
            controller: emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextFormField(
            hintText: 'Phone Number',
            controller: phoneNumberController,
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
          MyTextFormField(
            hintText: 'Favourite Car',
            controller: favoriteCarController,
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            onPressed: () => submitData(context),
            label: 'Sign Up',
          )
        ],
      ))),
    );
  }

  void submitData(BuildContext context) async {
    final name = nameController.text;
    final email = emailController.text;
    final phoneNumber = phoneNumberController.text;
    final password = passwordController.text;
    final favoriteCar = favoriteCarController.text;

    final body = UserModel(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        answer: favoriteCar);

    final sessionId = await RegisterUser.registerUser(body);

    // Navigator.pushNamed(context, '/otp');

    Navigator.of(context).pushNamed('/otp', arguments: sessionId);
  }
}
