import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_cost_controller.dart';
import '../../controller/controller.dart';
import '../constants/const_colors.dart';
import '../widgets/items/bottom_nav_item.dart';
import 'cart.dart';
import 'favourite.dart';
import 'grocery.dart';
import 'news.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Widget> screens = [
    GroceryPage(),
    const NewsPage(),
    FavouritePage(),
    CartPage(),
  ];

  final CartCostController cartCostController = Get.find<CartCostController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: GetBuilder<Controller>(
                builder: (controller) => screens[controller.indexPage]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // FAB has fixed Size so its children should has fixed values also

          backgroundColor: kPrimaryColor83,
          onPressed: () {},
          child: Stack(
            children: [
              const Positioned(
                  bottom: 0,
                  right: 15,
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 25,
                  )),
              Center(
                  child: Obx(() => Text(
                        '\$${cartCostController.totalCost.value}',
                        style: const TextStyle(
                            fontSize: 12, fontFamily: 'Helvetica'),
                      ))),
            ],
          ),
        ),
        // Docked make the Float in the middle of Bottom Navigation
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: GetBuilder<Controller>(
          builder: (controller) => BottomAppBar(
            child: Container(
              height: size.height * 0.1,
              color: kShadedWhiteGreyColor83,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BottomNavItem(
                    currentTab: controller.indexPage,
                    icon: Icons.store,
                    onPress: () => controller.changeSelectedValue(0),
                    txt: 'Grocery',
                    position: 0,
                    size: size,
                  ),
                  BottomNavItem(
                    currentTab: controller.indexPage,
                    icon: Icons.notifications_outlined,
                    onPress: () => controller.changeSelectedValue(1),
                    txt: 'News',
                    position: 1,
                    size: size,
                  ),
                  const SizedBox(width: 1),
                  BottomNavItem(
                    currentTab: controller.indexPage,
                    icon: Icons.favorite_outline_rounded,
                    onPress: () => controller.changeSelectedValue(2),
                    txt: 'Favourites',
                    position: 2,
                    size: size,
                  ),
                  BottomNavItem(
                    currentTab: controller.indexPage,
                    icon: Icons.account_balance_wallet_outlined,
                    onPress: () => controller.changeSelectedValue(3),
                    txt: 'Cart',
                    position: 3,
                    size: size,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
