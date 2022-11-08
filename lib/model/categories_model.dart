// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) =>
    Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
    required this.categories,
  });

  List<Category> categories;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.icon,
    required this.name,
  });

  String icon;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        icon: json["icon"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "name": name,
      };
}

// {
// "categories" : [
// {"icon" : "fec8bd", "name" : "Steak"},
// {"icon" : "fad96d", "name" : "Vegetables"},
// {"icon" : "ccb8ff", "name" : "Beverage"},
// {"icon" : "48b6da", "name" : "Fish"},
// {"icon" : "ff9dc2", "name" : "Juice"}
// ]
// }
