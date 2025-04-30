// To parse this JSON data, do
//
//     final singleFoodPack = singleFoodPackFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<SingleFoodPack> singleFoodPackFromJson(String str) => List<SingleFoodPack>.from(json.decode(str).map((x) => SingleFoodPack.fromJson(x)));

String singleFoodPackToJson(List<SingleFoodPack> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SingleFoodPack {
    final String id;
    final String restaurantId;
    final String packName;
    final String packDescription;
    final int price;
    final bool isAvailable;
    final DateTime createdAt;
    final DateTime updatedAt;

    SingleFoodPack({
        required this.id,
        required this.restaurantId,
        required this.packName,
        required this.packDescription,
        required this.price,
        required this.isAvailable,
        required this.createdAt,
        required this.updatedAt,
    });

    factory SingleFoodPack.fromJson(Map<String, dynamic> json) => SingleFoodPack(
        id: json["_id"],
        restaurantId: json["restaurantId"],
        packName: json["packName"],
        packDescription: json["packDescription"],
        price: json["price"],
        isAvailable: json["isAvailable"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "restaurantId": restaurantId,
        "packName": packName,
        "packDescription": packDescription,
        "price": price,
        "isAvailable": isAvailable,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
