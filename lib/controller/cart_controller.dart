import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../view/widgets/items/cart_item.dart';

class CartController extends GetxController {
  final Map<String, CartItem> _cart = {};
  final Map _quantitiesMap = {};
  Set _listOfItemKeys = {};

  Map get cart => _cart;
  Map get quantitiesMap => _quantitiesMap;
  Set get listOfItemsKeys => _listOfItemKeys;

  void addToCart(CartItem cartItem) {
    _cart[cartItem.name] = cartItem;
    _listOfItemKeys.add(cartItem.name);
    addToQuantities(1, cartItem.name);
    update();
  }

  void cartItemsKeys() {
    _listOfItemKeys = _cart.keys.toList().toSet();
    for (int i = 0; i < _listOfItemKeys.length - 1; i++) {
      addToQuantities(_cart[_listOfItemKeys.toList()[i]]!.quantity,
          _listOfItemKeys.toList()[i]);
    }
    update();
  }

  void removeFromCart(String key) {
    _cart.remove(key);
    _listOfItemKeys.remove(key);
    update();
  }

  void addToQuantities(int value, String key) {
    _quantitiesMap[key] = value;
    update();
  }

  void removeFromQuantities(String key) {
    _quantitiesMap.remove(key);
    update();
  }

  void incrementQuantity(String key) {
    _quantitiesMap[key] += 1;
    _cart[key] = CartItem(
        size: cart[key].size,
        name: cart[key].name,
        measure: cart[key].measure,
        price: cart[key].price,
        itemColor: cart[key].itemColor,
        quantity: _quantitiesMap[key]);
    update();
  }

  void decrementQuantity(String key) {
    if (_quantitiesMap[key] > 0) {
      _quantitiesMap[key] -= 1;
      _cart[key] = CartItem(
          size: cart[key].size,
          name: cart[key].name,
          measure: cart[key].measure,
          price: cart[key].price,
          itemColor: cart[key].itemColor,
          quantity: _quantitiesMap[key]);
      update();
    }
  }
}
