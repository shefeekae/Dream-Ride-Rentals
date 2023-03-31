import 'package:dream_ride_rentals/service/auth_service.dart';
import 'package:dream_ride_rentals/view/bottom_nav.dart';
import 'package:dream_ride_rentals/view/login_or_register.dart';
import 'package:dream_ride_rentals/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthService authService = AuthService();

  var storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: storage.read(key: 'token').asStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return const BottomNavigation();
        } else {
          return const LoginOrRegisterPage();
        }
      },
    );
  }
}
