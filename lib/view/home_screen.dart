import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/72AA6788-970C-4FE9-B81C-573ED6D94AB6.PNG")
          ],
        ),
      ),
    );
  }
}
