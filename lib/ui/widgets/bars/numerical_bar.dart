import 'package:flutter/material.dart';

import '../../constants/const_colors.dart';
import '../../constants/const_styles.dart';
import '../buttons/rounded_icon_button.dart';

class NumericalBar extends StatelessWidget {
  const NumericalBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const RoundedIconBtn(
            icon: Icons.remove_rounded,
            bgColor: kLightBlueColor83,
            iconColor: kBlueColor83),
        SizedBox(width: size.width * 0.05),
        Text(
          '3',
          style: kTitleStyle.copyWith(fontSize: 16),
        ),
        SizedBox(width: size.width * 0.05),
        const RoundedIconBtn(
            icon: Icons.add_rounded,
            bgColor: kLightBlueColor83,
            iconColor: kBlueColor83),
      ],
    );
  }
}