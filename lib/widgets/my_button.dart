import 'package:flutter/material.dart';

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
    return ActionChip(
      pressElevation: 5,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 135),
      labelStyle: TextStyle(color: Colors.grey[100]),
      backgroundColor: Colors.deepOrange,
      label: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
      onPressed: onPressed,
    );
  }
}
