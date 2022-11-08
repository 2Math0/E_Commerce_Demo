import 'package:flutter/material.dart';

import '../../constants/const_styles.dart';
import '../rounded_corner.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    Key? key,
    required this.size,
    required this.color,
    required this.name,
  }) : super(key: key);

  final Size size;
  final String color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: Column(
        children: [
          ColoredRoundedSquare(
              edge: size.width / 7, color: Color(int.parse("0xFF$color"))),
          const SizedBox(
            height: 6,
          ),
          Text(name, style: kNormalText),
        ],
      ),
    );
  }
}
