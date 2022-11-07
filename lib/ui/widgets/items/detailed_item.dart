import 'package:flutter/material.dart';

import '../../constants/const_colors.dart';
import '../../constants/const_styles.dart';
import '../rounded_corner.dart';

class DetailedItem extends StatelessWidget {
  const DetailedItem({
    Key? key,
    required this.size,
    required this.color,
    required this.name,
    required this.location,
    required this.price,
    required this.lastPrice,
    required this.quantity,
  }) : super(key: key);

  final Size size;
  final Color color;
  final String name;
  final String location;
  final double price;
  final double lastPrice;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Stack(
              children: [
                ColoredRoundedSquare(edge: size.width / 4, color: color),
                Positioned(
                    top: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: const BoxDecoration(
                            color: kWhiteGreyColor83, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.favorite,
                          color: kRedColor83,
                          size: 12,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            height: size.width / 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  name,
                  style: kSecTitleStyle,
                ),
                Text(
                  'Pieces $quantity',
                  style: kNormalText,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.black54,
                      size: 12,
                    ),
                    SizedBox(width: 12),
                    Text(
                      '15 minutes away',
                      style: kSmallText,
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '\$  $price',
                      style: const TextStyle(
                          color: kRedColor83, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 24),
                    Text(
                      '\$  $lastPrice',
                      style: const TextStyle(
                        color: Colors.black38,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
