// To parse this JSON data, do
//
//     final adsBanner = adsBannerFromJson(jsonString);

import 'dart:convert';

AdsBannerModel adsBannerFromJson(String str) =>
    AdsBannerModel.fromJson(json.decode(str));

String adsBannerToJson(AdsBannerModel data) => json.encode(data.toJson());

class AdsBannerModel {
  AdsBannerModel({
    required this.adBanner,
  });

  AdBanner adBanner;

  factory AdsBannerModel.fromJson(Map<String, dynamic> json) => AdsBannerModel(
        adBanner: AdBanner.fromJson(json["ad_banner"]),
      );

  Map<String, dynamic> toJson() => {
        "ad_banner": adBanner.toJson(),
      };
}

class AdBanner {
  AdBanner({
    required this.icon,
    required this.subText,
    required this.title,
    required this.price,
    required this.lastPrice,
    required this.endDate,
    required this.textColor,
  });

  String icon;
  String subText;
  String title;
  int price;
  int lastPrice;
  String endDate;
  String textColor;

  factory AdBanner.fromJson(Map<String, dynamic> json) => AdBanner(
        icon: json["icon"],
        subText: json["subText"],
        title: json["title"],
        price: json["price"],
        lastPrice: json["lastPrice"],
        endDate: json["endDate"],
        textColor: json["textColor"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "subText": subText,
        "title": title,
        "price": price,
        "lastPrice": lastPrice,
        "endDate": endDate,
        "textColor": textColor,
      };
}

// {
// "ad_banner" : {"icon": "fec8bd",
// "subText": "Mega",
// "title": "Whopper",
// "price": 17,
// "lastPrice": 32,
// "endDate": "24 December 2020",
// "textColor": "21114b"}
// }
