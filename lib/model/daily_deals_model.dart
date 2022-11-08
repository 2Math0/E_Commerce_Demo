// To parse this JSON data, do
//
//     final dailyDeals = dailyDealsFromJson(jsonString);

import 'dart:convert';

DailyDeals dailyDealsFromJson(String str) =>
    DailyDeals.fromJson(json.decode(str));

String dailyDealsToJson(DailyDeals data) => json.encode(data.toJson());

class DailyDeals {
  DailyDeals({
    required this.dayDeals,
  });

  List<DayDeal> dayDeals;

  factory DailyDeals.fromJson(Map<String, dynamic> json) => DailyDeals(
        dayDeals: List<DayDeal>.from(
            json["day_deals"].map((x) => DayDeal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "day_deals": List<dynamic>.from(dayDeals.map((x) => x.toJson())),
      };
}

class DayDeal {
  DayDeal({
    required this.icon,
    required this.favourite,
    required this.name,
    required this.quantity,
    required this.distance,
    required this.price,
    required this.lastPrice,
  });

  String icon;
  bool favourite;
  String name;
  int quantity;
  String distance;
  double price;
  double lastPrice;

  factory DayDeal.fromJson(Map<String, dynamic> json) => DayDeal(
        icon: json["icon"],
        favourite: json["favourite"],
        name: json["name"],
        quantity: json["quantity"],
        distance: json["distance"],
        price: json["price"],
        lastPrice: json["last_price"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "favourite": favourite,
        "name": name,
        "quantity": quantity,
        "distance": distance,
        "price": price,
        "last_price": lastPrice,
      };
}

// {
// "day_deals" : [
// {
// "icon" : "fbedd8",
// "favourite" :  false,
// "name": "Summer Sun Ice Cream Pack",
// "quantity" : 5,
// "distance" : "15 minutes",
// "price" : 12.0,
// "last_price" : 18.0
// },
// {
// "icon" : "cdf5e7",
// "favourite" :  true,
// "name": "Summer Sun Ice Cream Pack",
// "quantity" : 5,
// "distance" : "15 minutes",
// "price" : 12.0,
// "last_price" : 18.0
// }
// ]
// }
