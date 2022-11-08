import 'package:flutter/material.dart';

import '../../constants/const_colors.dart';
import '../../constants/const_styles.dart';
import '../rounded_corner.dart';

class AdsBanner extends StatelessWidget {
  const AdsBanner({
    Key? key,
    required this.size,
    required this.color,
    required this.subText,
    required this.title,
    required this.price,
    required this.lastPrice,
    required this.endDate,
    required this.textColor,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Color textColor;
  final String subText;
  final String title;
  final int price;
  final int lastPrice;
  final String endDate;

  @override
  Widget build(BuildContext context) {
    return ColoredRoundedSquare(
      edge: size.width,
      isSquare: false,
      height: size.height * 0.2,
      color: color,
      child: Row(
        children: [
          SizedBox(width: size.width / 2.8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                subText,
                style: kNormalText.copyWith(color: kPrimaryColor83),
              ),
              Text.rich(
                TextSpan(
                    text: title.toUpperCase().substring(0, title.length - 2),
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 32),
                    children: [
                      TextSpan(
                        text: title
                            .toUpperCase()
                            .substring(title.length - 2, title.length - 1),
                        style: const TextStyle(
                            color: kPrimaryColor83,
                            fontWeight: FontWeight.w700,
                            fontSize: 32),
                      ),
                      TextSpan(
                          text: title
                              .toUpperCase()
                              .substring(title.length - 1, title.length),
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 32))
                    ]),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '\$  $price',
                    style: const TextStyle(
                        color: kRedColor83,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  const SizedBox(width: 24),
                  Text(
                    '\$  $lastPrice',
                    style: const TextStyle(
                        color: Colors.white70,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 14),
                  ),
                ],
              ),
              Text(
                '* Available until $endDate',
                style: kSmallText.copyWith(color: Colors.white70),
              )
            ],
          )
        ],
      ),
    );
  }
}
