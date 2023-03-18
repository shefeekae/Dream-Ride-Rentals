import 'package:dream_ride_rentals/view/home_screen.dart';
import 'package:dream_ride_rentals/view/login_screen.dart';
import 'package:dream_ride_rentals/view/otp_screen.dart';
import 'package:dream_ride_rentals/view/register_screen.dart';
import 'package:dream_ride_rentals/view/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case '/otp':
        if (args is String) {
          return MaterialPageRoute(
            builder: (context) => OtpScreen(sessionId: args),
          );
        }
        return _errrorRoute();

      case '/login':
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
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
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
