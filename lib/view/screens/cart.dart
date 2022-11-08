import 'package:flutter/material.dart';
import 'package:flutter_demo_task/controller/cart_controller.dart';
import 'package:flutter_demo_task/json_objs.dart';
import 'package:get/get.dart';

import '../../model/cart_model.dart';
import '../constants/const_styles.dart';
import '../widgets/items/cart_item.dart';
import '../widgets/page_header.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final List<CartElement> cartElementsList = cartFromJson(cartJson).cart;
  final CartController cartController = Get.find<CartController>();
  void myCartIsReady(Size size) {
    for (int i = 0; i <= cartElementsList.length - 1; i++) {
      cartController.addToCart(CartItem(
          size: size,
          name: cartElementsList[i].name,
          measure: cartElementsList[i].measure,
          price: cartElementsList[i].price,
          itemColor: cartElementsList[i].itemColor,
          quantity: cartElementsList[i].quantity));
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFirstBuild = cartController.quantitiesMap.keys.toList().length <
        cartController.cart.values.toList().length;
    isFirstBuild ? cartController.cartItemsKeys() : null;
    Get.log(cartController.listOfItemsKeys.toList().toString());
    Size size = MediaQuery.of(context).size;
    myCartIsReady(size);
    Get.log(cartController.cart.toString());
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
          GetBuilder<CartController>(
            builder: (controller) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.listOfItemsKeys.length,
                itemBuilder: (BuildContext context, int index) {
                  // if (isFirstBuild) {
                  //   Get.log(controller
                  //       .quantitiesMap[cartElementsList[index].name]
                  //       .toString());
                  // }
                  return controller
                      .cart[controller.listOfItemsKeys.toList()[index]];
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
