import 'package:dream_ride_rentals/providers/user_provider.dart';
import 'package:dream_ride_rentals/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: {
      // '/home': (context) => const HomeScreen(),
      // '/login': (context) => LoginScreen(),
      // '/': (context) => RegisterPage(),
      // '/otp': (context) => OtpScreen()
      // },
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
