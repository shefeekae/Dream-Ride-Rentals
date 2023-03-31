import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
        () => Navigator.of(context).pushReplacementNamed('/auth'));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: SafeArea(
        child: Center(
          child: Container(
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * .05,
                ),
                Image.asset('assets/72AA6788-970C-4FE9-B81C-573ED6D94AB6.PNG',
                    height: 200),
                Text("DREAM RIDE RENTALS",
                    style: GoogleFonts.acme(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: const Color.fromARGB(246, 2, 30, 53))),
                SizedBox(
                  height: size.height * .05,
                ),
                Lottie.asset("assets/72049-red-car.json",
                    fit: BoxFit.scaleDown, height: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
