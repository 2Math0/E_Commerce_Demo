// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    required this.address,
  });

  List<AddressElement> address;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: List<AddressElement>.from(
            json["address"].map((x) => AddressElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
      };
}

class AddressElement {
  AddressElement({
    required this.type,
    required this.icon,
    required this.street,
    required this.streetNumber,
  });

  String type;
  String icon;
  String street;
  String streetNumber;

  factory AddressElement.fromJson(Map<String, dynamic> json) => AddressElement(
        type: json["type"],
        icon: json["icon"],
        street: json["street"],
        streetNumber: json["street number"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "icon": icon,
        "street": street,
        "street number": streetNumber,
      };
}

// "address" : [{
// "type" : "Home Address",
// "icon" : "fbedd8",
// "street" : "Mustafa St. NO:2",
// "street number" : "Street x12"},
// {
// "type" : "Office Address",
// "icon" : "fbedd8",
// "street" : "Mustafa St. NO:2",
// "street number" : "Street x12"
// }]
