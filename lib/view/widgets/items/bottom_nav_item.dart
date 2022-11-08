import 'dart:developer';

import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final String txt;
  final int position;
  final int currentTab;
  final void Function() onPress;
  final IconData icon;
  final Size size;

  const BottomNavItem({
    Key? key,
    required this.currentTab,
    required this.txt,
    required this.position,
    required this.onPress,
    required this.icon,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('${size.width * 0.018}');
    return MaterialButton(
      minWidth: 40,
      onPressed: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: size.height * 0.08,
                    maxWidth: size.height * 0.06),
                child: Center(
                  child: Icon(
                    icon,
                    size: (size.width * 0.075) < 30 ? size.width * 0.075 : 30,
                    color: currentTab == position
                        ? IconTheme.of(context).color
                        : Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.004,
            ),
            Text(
              txt,
              style: TextStyle(
                color: currentTab == position
                    ? IconTheme.of(context).color
                    : Colors.grey,
                fontSize: size.width * 0.018 < 8 ? size.width * 0.018 : 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
