import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const MyButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ActionChip(
      pressElevation: 5,
      padding: EdgeInsets.symmetric(
          vertical: size.height * .026, horizontal: size.width * .34),
      labelStyle: const TextStyle(color: Color.fromARGB(255, 45, 45, 45)),
      backgroundColor: const Color.fromARGB(255, 151, 246, 107),
      label: Text(
        label,
        style: GoogleFonts.aBeeZee(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      onPressed: onPressed,
    );
  }
}
