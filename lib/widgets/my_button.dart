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
      padding: const EdgeInsets.all(15),
      labelStyle: const TextStyle(color: Colors.white),
      backgroundColor: Colors.blue,
      label: Text(label),
      onPressed: onPressed,
    );
  }
}
