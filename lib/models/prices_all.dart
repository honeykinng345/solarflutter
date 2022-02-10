// To parse this JSON data, do
//
//     final priceWrapper = priceWrapperFromJson(jsonString);

import 'dart:convert';

PriceWrapper priceWrapperFromJson(String str) => PriceWrapper.fromJson(json.decode(str));

String priceWrapperToJson(PriceWrapper data) => json.encode(data.toJson());

class PriceWrapper {
  PriceWrapper({
    required this.error,
    required this.prices,
  });


  bool error;
  List<Price> prices;

  factory PriceWrapper.fromJson(Map<String, dynamic> json) => PriceWrapper(
    error: json["error"],
    prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
  };
}

class Price {
  Price({
    required this.id,
    required this.name,
    required this.price,
    required this.status,
  });

  String id;
  String name;
  String price;
  String status;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "status": status,
  };


}
