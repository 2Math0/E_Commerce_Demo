import 'package:flutter/material.dart';

class ColoredRoundedSquare extends StatelessWidget {
  const ColoredRoundedSquare({
    Key? key,
    required this.edge,
    required this.color,
    this.isSquare = true,
    this.height = 0.0,
    this.child,
  }) : super(key: key);

  final double edge;
  final Color color;
  final bool isSquare;
  final double height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
            width: edge,
            height: isSquare ? edge : height,
            color: color,
            child: child));
  }
}
