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
          labelStyle: GoogleFonts.acme(fontSize: 15, color: Colors.black),
          focusColor: Colors.grey[300],
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black)),
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
