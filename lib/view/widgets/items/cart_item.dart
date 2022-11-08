import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../controller/cart_cost_controller.dart';
import '../../constants/const_colors.dart';
import '../../constants/const_styles.dart';
import '../buttons/rounded_icon_button.dart';
import '../rounded_corner.dart';

class CartItem extends StatelessWidget {
  CartItem({
    Key? key,
    required this.size,
    required this.name,
    required this.measure,
    required this.price,
    required this.itemColor,
    required this.quantity,
  }) : super(key: key);

  final Size size;
  final String name;
  final String measure;
  final double price;
  final String itemColor;
  final int quantity;

  // String get quantityFixer => (weight / 1000) > 1
  //     ? '${(weight / 1000).toStringAsFixed(1)} Kilos'
  //     : '$weight Grams';

  final CartCostController cartCostController = Get.find<CartCostController>();
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ColoredRoundedSquare(
                  edge: size.width / 7,
                  color: Color(int.parse("0xFF$itemColor"))),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: kNormalText),
                  Text(
                    measure,
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
          Row(
            children: [
              RoundedIconBtn(
                  onTap: () {
                    Get.log('clicked');
                    Get.log(cartCostController.totalCost.value.toString());
                    if (cartController.quantitiesMap[name] > 0) {
                      cartCostController.decrement(price);
                      cartController.decrementQuantity(name);
                    }
                  },
                  icon: Icons.remove_rounded,
                  bgColor: kLightBlueColor83,
                  iconColor: kBlueColor83),
              SizedBox(width: size.width * 0.05),
              Text(
                "$quantity",
                style: kTitleStyle.copyWith(fontSize: 16),
              ),
              SizedBox(width: size.width * 0.05),
              RoundedIconBtn(
                  onTap: () {
                    cartCostController.increment(price);
                    cartController.incrementQuantity(name);
                  },
                  icon: Icons.add_rounded,
                  bgColor: kLightBlueColor83,
                  iconColor: kBlueColor83),
            ],
          )
        ],
      ),
    );
  }
}
