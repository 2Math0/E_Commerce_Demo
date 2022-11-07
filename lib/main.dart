import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_task/controller/controller.dart';
import 'package:flutter_demo_task/ui/constants/const_colors.dart';
import 'package:flutter_demo_task/ui/screens/cart.dart';
import 'package:flutter_demo_task/ui/screens/category.dart';
import 'package:flutter_demo_task/ui/screens/favourite.dart';
import 'package:flutter_demo_task/ui/screens/news.dart';
import 'package:get/get.dart';

import 'ui/widgets/bottom_nav_item.dart';

void main() {
  runApp(const MyApp());
  // for transparent status Bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eighty Three Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor83,
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: kWhiteGreyColor83,
          iconTheme: const IconThemeData(color: kPrimaryColor83)),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final int cost = 32;
  final List<Widget> screens = const [
    GroceryPage(),
    NewsPage(),
    FavouritePage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: GetBuilder<Controller>(
            init: Controller(),
            builder: (controller) => screens[controller.indexPage]),
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
                  child: Text(
                '\$$cost',
                style: const TextStyle(fontSize: 12, fontFamily: 'Helvetica'),
              )),
            ],
          ),
        ),
        // Docked make the Float in the middle of Bottom Navigation
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: GetBuilder<Controller>(
          init: Controller(),
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
                  const SizedBox(
                    width: 40,
                  ),
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
