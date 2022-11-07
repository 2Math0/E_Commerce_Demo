import 'package:flutter/material.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key? key,
    required this.bgColor,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  final Color bgColor;
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
