import 'package:flutter/material.dart';
import 'package:flutter_demo_task/controller/cart_controller.dart';
import 'package:flutter_demo_task/controller/cart_cost_controller.dart';
import 'package:flutter_demo_task/controller/favourite_controller.dart';
import 'package:flutter_demo_task/view/widgets/items/cart_item.dart';
import 'package:get/get.dart';

import '../../constants/const_colors.dart';
import '../../constants/const_styles.dart';
import '../rounded_corner.dart';

class DetailedItem extends StatelessWidget {
  DetailedItem({
    Key? key,
    required this.size,
    required this.color,
    required this.name,
    required this.location,
    required this.price,
    required this.lastPrice,
    required this.quantity,
    required this.isFavourite,
  }) : super(key: key);

  final Size size;
  final String color;
  final String name;
  final String location;
  final double price;
  final double lastPrice;
  final int quantity;
  bool isFavourite;

  final FavouriteController favouriteController =
      Get.find<FavouriteController>();

  final CartController cartController = Get.find<CartController>();
  final CartCostController cartCostController = Get.find<CartCostController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.log('clicked');
        List<String> words = name.split(' ');
        cartController.addToCart(CartItem(
            size: size,
            name: '${words[0]} ${words[2]} ${words[3]}',
            measure: 'scoop',
            price: price,
            itemColor: color,
            quantity: 1));
        cartCostController.increment(price);
        Get.log(cartController.cart.toString());
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Stack(
                children: [
                  ColoredRoundedSquare(
                      edge: size.width / 4,
                      color: Color(int.parse("0xFF$color"))),
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
                          child: GetBuilder<FavouriteController>(
                            builder: (controller) => IconButton(
                              icon: Icon(
                                isFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: isFavourite ? kRedColor83 : kGreyColor83,
                                size: 12,
                              ),
                              onPressed: () {
                                isFavourite
                                    ? favouriteController
                                        .removeFromFavourites(name)
                                    : favouriteController.addToFavourites(
                                        DetailedItem(
                                            size: size,
                                            color: color,
                                            name: name,
                                            location: location,
                                            price: price,
                                            lastPrice: lastPrice,
                                            quantity: quantity,
                                            isFavourite: isFavourite));
                                isFavourite = !isFavourite;
                              },
                            ),
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
      ),
    );
  }
}
