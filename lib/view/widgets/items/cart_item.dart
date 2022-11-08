import 'package:flutter/material.dart';

import '../../constants/const_colors.dart';
import '../../constants/const_styles.dart';
import '../bars/numerical_bar.dart';
import '../rounded_corner.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.size,
    required this.name,
    required this.quantity,
    required this.price,
    required this.itemColor,
  }) : super(key: key);

  final Size size;
  final String name;
  final int quantity;
  final int price;
  final Color itemColor;

  String get quantityFixer => (quantity / 1000) > 1
      ? '${(quantity / 1000).toStringAsFixed(1)} Kilos'
      : '$quantity Grams';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ColoredRoundedSquare(edge: size.width / 7, color: itemColor),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: kNormalText),
                  Text(
                    quantityFixer,
                    style: kSmallText.copyWith(color: Colors.black54),
                  ),
                  Text(
                    '\$ $price',
                    style:
                        const TextStyle(fontSize: 18, color: kRedTextColor83),
                  )
                ],
              ),
            ],
          ),
          NumericalBar(size: size),
        ],
      ),
    );
  }
}
