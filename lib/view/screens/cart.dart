import 'package:flutter/material.dart';
import 'package:flutter_demo_task/json_objs.dart';

import '../../model/cart_model.dart';
import '../constants/const_styles.dart';
import '../widgets/items/cart_item.dart';
import '../widgets/page_header.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final List<CartElement> cartElementsList = cartFromJson(cartJson).cart;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(size: size, location: 'Oxford Street'),
        const SizedBox(height: 32),
        const Text(
          'Cart',
          style: kTitleStyle,
        ),
        const SizedBox(height: 24),
        ListView.builder(
          shrinkWrap: true,
          itemCount: cartElementsList.length,
          itemBuilder: (BuildContext context, int index) => CartItem(
              size: size,
              name: cartElementsList[index].name,
              measure: cartElementsList[index].measure,
              price: cartElementsList[index].price,
              itemColor: cartElementsList[index].itemColor,
              quantity: cartElementsList[index].quantity),
        ),
      ],
    );
  }
}
