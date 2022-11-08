import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../view/widgets/items/cart_item.dart';

class CartController extends GetxController {
  final Map _cart = {};
  final Map _quantitiesMap = {};

  Map get cart => _cart;

  void addToCart(CartItem cartItem) {
    _cart[cartItem.name] = cartItem;
    update();
  }

  void removeFromCart(String key) {
    _cart.remove(key);
    update();
  }

  void addToQuantities(int value, String key) {
    _quantitiesMap[key] = value;
    update();
  }

  void removeFromQuantities(String key) {
    _cart.remove(key);
    update();
  }
}
