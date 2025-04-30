// To parse this JSON data, do
//
//     final singleFoodAdditives = singleFoodAdditivesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<SingleFoodAdditives> singleFoodAdditivesFromJson(String str) => List<SingleFoodAdditives>.from(json.decode(str).map((x) => SingleFoodAdditives.fromJson(x)));

String singleFoodAdditivesToJson(List<SingleFoodAdditives> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SingleFoodAdditives {
    final String id;
    final String restaurantId;
    final String additiveTitle;
    final List<AdditiveOption> options;
    final int max;
    final int min;
    final bool isAvailable;
    final DateTime createdAt;
    final DateTime updatedAt;

    SingleFoodAdditives({
        required this.id,
        required this.restaurantId,
        required this.additiveTitle,
        required this.options,
        required this.max,
        required this.min,
        required this.isAvailable,
        required this.createdAt,
        required this.updatedAt,
    });

    factory SingleFoodAdditives.fromJson(Map<String, dynamic> json) => SingleFoodAdditives(
        id: json["_id"],
        restaurantId: json["restaurantId"],
        additiveTitle: json["additiveTitle"],
        options: List<AdditiveOption>.from(json["options"].map((x) => AdditiveOption.fromJson(x))),
        max: json["max"],
        min: json["min"],
        isAvailable: json["isAvailable"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "restaurantId": restaurantId,
        "additiveTitle": additiveTitle,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "max": max,
        "min": min,
        "isAvailable": isAvailable,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class AdditiveOption {
    final String id;
    final String additiveName;
    final int price;
    final bool isAvailable;

    AdditiveOption({
        required this.id,
        required this.additiveName,
        required this.price,
        required this.isAvailable,
    });

    factory AdditiveOption.fromJson(Map<String, dynamic> json) => AdditiveOption(
        id: json["id"],
        additiveName: json["additiveName"],
        price: json["price"],
        isAvailable: json["isAvailable"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "additiveName": additiveName,
        "price": price,
        "isAvailable": isAvailable,
    };
}
