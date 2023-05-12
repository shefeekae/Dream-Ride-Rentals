import 'package:flutter/material.dart';

class ColorBall extends StatelessWidget {
  const ColorBall({
    Key? key,
    required this.begin,
    required this.height,
    required this.width,
    required this.end,
    required this.colors,
  }) : super(key: key);

  final double height;
  final double width;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: begin, end: end, colors: colors),
        borderRadius: BorderRadius.circular(90),
      ),
    );
  }
}
