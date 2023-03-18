import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color.fromARGB(255, 241, 241, 241),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Image.asset('assets/72AA6788-970C-4FE9-B81C-573ED6D94AB6.PNG'),
            Text("DREAM RIDE RENTALS",
                style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold, fontSize: 35))
          ],
        ),
      ),
    );
  }
}
