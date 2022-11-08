// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    required this.cart,
  });

  List<CartElement> cart;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        cart: List<CartElement>.from(
            json["cart"].map((x) => CartElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
      };
}

class CartElement {
  CartElement({
    required this.name,
    required this.measure,
    required this.price,
    required this.itemColor,
    required this.quantity,
  });

  String name;
  String measure;
  int price;
  String itemColor;
  int quantity;

  factory CartElement.fromJson(Map<String, dynamic> json) => CartElement(
        name: json["name"],
        measure: json["measure"],
        price: json["price"],
        itemColor: json["itemColor"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "measure": measure,
        "price": price,
        "itemColor": itemColor,
        "quantity": quantity,
      };
}

// {
// "cart" : [{
// "name": "Turkish",
// "measure": "173 Grams",
// "price": 25,
// "itemColor": "f9bdad",
// "quantity": 2
// },
// {
// "name": "Salmon",
// "measure": "2 Serving",
// "price": 30,
// "itemColor": "b0eafd",
// "quantity": 1
// },
// {
// "name": "Red Juice",
// "measure": "1 Bottle",
// "price": 25,
// "itemColor": "ff9dc2",
// "quantity": 3
// },
// {
// "name": "Cola",
// "measure": "1 Bottle",
// "price": 11,
// "itemColor": "ccb8ff",
// "quantity": 2
// }
// ]
// }
