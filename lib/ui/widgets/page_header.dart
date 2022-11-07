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
        Container(
          width: size.width / 3,
          decoration: BoxDecoration(
              color: kRedColor83, borderRadius: BorderRadius.circular(40)),
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
