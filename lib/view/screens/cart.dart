import 'package:flutter/material.dart';

import '../constants/const_colors.dart';
import '../constants/const_styles.dart';
import '../widgets/items/cart_item.dart';
import '../widgets/page_header.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(size: size, location: 'Oxford Street'),
          const SizedBox(height: 32),
          const Text(
            'Cart',
            style: kTitleStyle,
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CartItem(
                  size: size,
                  name: 'Turkish',
                  measure: '123',
                  price: 23,
                  itemColor: kPinkColor83,
                  quantity: 3),
              CartItem(
                  size: size,
                  name: 'Turkish',
                  measure: '20000',
                  price: 23,
                  itemColor: kPinkColor83,
                  quantity: 3),
              CartItem(
                  size: size,
                  name: 'Turkish',
                  measure: '500',
                  price: 23,
                  itemColor: kPinkColor83,
                  quantity: 3),
              CartItem(
                  size: size,
                  name: 'Turkish',
                  measure: '123',
                  price: 23,
                  itemColor: kPinkColor83,
                  quantity: 3),
            ],
          ),
        ],
      ),
    );
  }
}
