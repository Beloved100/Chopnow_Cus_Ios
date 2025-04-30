// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

String foodModelToJson(List<FoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
    final String id;
    final String title;
    final String time;
    final List<String> foodTags;
    final String category;
    final List<String> foodType;
    final String code;
    final bool isAvailable;
    final String restaurant;
    final double rating;
    final String ratingCount;
    final String description;
    final int price;
    final String priceDescription;
    final List<Additive> additive;
    final List<Pack> pack;
    final List<String> imageUrl;
    final String restaurantCategory;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;
    final bool restaurantCategoryAvailable;

    FoodModel({
        required this.id,
        required this.title,
        required this.time,
        required this.foodTags,
        required this.category,
        required this.foodType,
        required this.code,
        required this.isAvailable,
        required this.restaurant,
        required this.rating,
        required this.ratingCount,
        required this.description,
        required this.price,
        required this.priceDescription,
        required this.additive,
        required this.pack,
        required this.imageUrl,
        required this.restaurantCategory,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.restaurantCategoryAvailable,
    });

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        foodTags: List<String>.from(json["foodTags"].map((x) => x)),
        category: json["category"],
        foodType: List<String>.from(json["foodType"].map((x) => x)),
        code: json["code"],
        isAvailable: json["isAvailable"],
        restaurant: json["restaurant"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["ratingCount"],
        description: json["description"],
        price: json["price"],
        priceDescription: json["priceDescription"],
        additive: List<Additive>.from(json["additive"].map((x) => Additive.fromJson(x))),
        pack: List<Pack>.from(json["pack"].map((x) => Pack.fromJson(x))),
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        restaurantCategory: json["restaurant_category"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        restaurantCategoryAvailable: json["restaurantCategoryAvailable"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time,
        "foodTags": List<dynamic>.from(foodTags.map((x) => x)),
        "category": category,
        "foodType": List<dynamic>.from(foodType.map((x) => x)),
        "code": code,
        "isAvailable": isAvailable,
        "restaurant": restaurant,
        "rating": rating,
        "ratingCount": ratingCount,
        "description": description,
        "price": price,
        "priceDescription": priceDescription,
        "additive": List<dynamic>.from(additive.map((x) => x.toJson())),
        "pack": List<dynamic>.from(pack.map((x) => x.toJson())),
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
        "restaurant_category": restaurantCategory,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "restaurantCategoryAvailable": restaurantCategoryAvailable,
    };
}

class Additive {
    final String restaurantId;
    final String additiveId;
    final String additiveTitle;
    final List<Option> options;
    final int max;
    final int min;
    final bool isAvailable;

    Additive({
        required this.restaurantId,
        required this.additiveId,
        required this.additiveTitle,
        required this.options,
        required this.max,
        required this.min,
        required this.isAvailable,
    });

    factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        restaurantId: json["restaurantId"],
        additiveId: json["additiveId"],
        additiveTitle: json["additiveTitle"],
        options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        max: json["max"],
        min: json["min"],
        isAvailable: json["isAvailable"],
    );

    Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "additiveId": additiveId,
        "additiveTitle": additiveTitle,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "max": max,
        "min": min,
        "isAvailable": isAvailable,
    };
}

class Option {
    final String id;
    final String additiveName;
    final int price;
    final bool isAvailable;

    Option({
        required this.id,
        required this.additiveName,
        required this.price,
        required this.isAvailable,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
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

class Pack {
    final String restaurantId;
    final String packId;
    
    final String packName;
    final String packDescription;
    final int price;
    final bool isAvailable;

    Pack({
        required this.restaurantId,
        required this.packId,
        required this.packName,
        required this.packDescription,
        required this.price,
        required this.isAvailable,
    });

    factory Pack.fromJson(Map<String, dynamic> json) => Pack(
        restaurantId: json["restaurantId"],
        packId: json["packId"],
        packName: json["packName"],
        packDescription: json["packDescription"],
        price: json["price"],
        isAvailable: json["isAvailable"],
    );

    Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "packId": packId,
        "packName": packName,
        "packDescription": packDescription,
        "price": price,
        "isAvailable": isAvailable,
    };
}
