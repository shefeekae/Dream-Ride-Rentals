import 'package:dream_ride_rentals/model/all_cars_model.dart';
import 'package:dream_ride_rentals/view/auth_page.dart';
import 'package:dream_ride_rentals/view/bottom_nav.dart';
import 'package:dream_ride_rentals/view/login_or_register.dart';
import 'package:dream_ride_rentals/view/otp_screen.dart';
import 'package:dream_ride_rentals/view/search_screen.dart';
import 'package:dream_ride_rentals/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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

      case '/search':
        if (args is List<AllCarsModel>) {
          return PageTransition(
              child: SearchScreen(allCars: args),
              type: PageTransitionType.size,
              alignment: Alignment.center);
        }
        return _errrorRoute();

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
