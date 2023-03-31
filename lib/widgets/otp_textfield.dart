import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField(
      {super.key, required this.controller, required this.autofocus});

  final TextEditingController controller;
  final bool autofocus;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextFormField(
        controller: controller,
        autofocus: autofocus,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
        ),
        onSaved: (pin1) {},
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
