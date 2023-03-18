import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const MyTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
