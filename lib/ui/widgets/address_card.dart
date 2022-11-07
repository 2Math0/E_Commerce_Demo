import 'package:flutter/material.dart';
import 'package:flutter_demo_task/ui/widgets/rounded_corner.dart';

import '../constants/const_colors.dart';
import '../constants/const_styles.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    required this.size,
    required this.color,
    required this.addressType,
    required this.address,
    required this.streetNumber,
  }) : super(key: key);

  final Size size;
  final Color color;
  final String addressType;
  final String address;
  final String streetNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: kGreyColor83),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: [
          const Padding(
            padding: EdgeInsets.all(6.0),
            child: ColoredRoundedSquare(
              edge: 40,
              color: kGreyColor83,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                addressType,
                style: titleStyle,
              ),
              Text(address, style: smallText),
              Text(
                streetNumber,
                style: smallText,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
