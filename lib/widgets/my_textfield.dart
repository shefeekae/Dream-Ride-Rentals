import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const MyTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: GoogleFonts.b612(
              fontSize: 15,
              color: const Color.fromARGB(255, 45, 45, 45),
              fontWeight: FontWeight.normal),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 213, 213, 213))),
          // hintText: hintText,
          // disabledBorder:
          //     OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}
