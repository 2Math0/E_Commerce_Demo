import 'package:flutter/material.dart';

import '../constants/const_colors.dart';

class PageHeader extends StatelessWidget {
  final String location;
  const PageHeader({
    Key? key,
    required this.size,
    required this.location,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            color: kRedColor83,
            width: 150,
            // decoration: BoxDecoration(
            //     color: kRedColor83, borderRadius: BorderRadius.circular(40)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: kWhiteGreyColor83,
                ),
                Text(
                  location,
                  style: const TextStyle(
                      color: kWhiteGreyColor83,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                )
              ]),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              shape: BoxShape.circle),
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double factor = 20.0;
    var path = Path();
    path.lineTo(0, size.height - factor);
    // bottom rounded corner
    path.quadraticBezierTo(0, size.height, factor, size.height);
    path.lineTo(size.width - factor, size.height);
    path.lineTo(size.width, size.height);

    path.quadraticBezierTo(size.width, 20, factor * 4, 0);
    path.lineTo(size.width, 0);
    path.lineTo(factor, 0);
    path.quadraticBezierTo(0, 0, 0, factor);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
