import 'package:dream_ride_rentals/view/auth_page.dart';
import 'package:dream_ride_rentals/view/bottom_nav.dart';
import 'package:dream_ride_rentals/view/login_or_register.dart';
import 'package:dream_ride_rentals/view/login_screen.dart';
import 'package:dream_ride_rentals/view/otp_screen.dart';
import 'package:dream_ride_rentals/view/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case '/otp':
        if (args is String) {
          return MaterialPageRoute(
            builder: (context) => OtpScreen(sessionId: args),
          );
        }
        return _errrorRoute();

      case '/loginOrRegister':
        return MaterialPageRoute(
          builder: (context) => const LoginOrRegisterPage(),
        );
      case '/bottomNav':
        return MaterialPageRoute(
          builder: (context) => const BottomNavigation(),
        );
      case '/auth':
        return MaterialPageRoute(
          builder: (context) => const AuthPage(),
        );
      default:
        return _errrorRoute();
    }
  }

  static Route<dynamic> _errrorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(
            child: Text('There is Some error in the routing'),
          ),
        );
      },
    );
  }
}
