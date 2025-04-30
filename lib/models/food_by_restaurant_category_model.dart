// To parse this JSON data, do
//
//     final foodByRestaurantCategoryModel = foodByRestaurantCategoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<FoodByRestaurantCategoryModel> foodByRestaurantCategoryModelFromJson(String str) => List<FoodByRestaurantCategoryModel>.from(json.decode(str).map((x) => FoodByRestaurantCategoryModel.fromJson(x)));

String foodByRestaurantCategoryModelToJson(List<FoodByRestaurantCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodByRestaurantCategoryModel {
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
    final List<Additive> additive;
    final List<String> imageUrl;
    final String restaurantCategory;
    final DateTime createdAt;
    final DateTime updatedAt;

    FoodByRestaurantCategoryModel({
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
        required this.additive,
        required this.imageUrl,
        required this.restaurantCategory,
        required this.createdAt,
        required this.updatedAt,
    });

    factory FoodByRestaurantCategoryModel.fromJson(Map<String, dynamic> json) => FoodByRestaurantCategoryModel(
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
        additive: List<Additive>.from(json["additive"].map((x) => Additive.fromJson(x))),
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        restaurantCategory: json["restaurant_category"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
        "additive": List<dynamic>.from(additive.map((x) => x.toJson())),
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
        "restaurant_category": restaurantCategory,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Additive {
    final int id;
    final Title title;
    final List<Option> options;

    Additive({
        required this.id,
        required this.title,
        required this.options,
    });

    factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        id: json["id"],
        title: titleValues.map[json["title"]]!,
        options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
    };
}

class Option {
    final String name;
    final String price;

    Option({
        required this.name,
        required this.price,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        name: json["name"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
    };
}

enum Title {
    DRINK,
    PACKAGE,
    PROTEIN,
    SWALLOW
}

final titleValues = EnumValues({
    "Drink": Title.DRINK,
    "package": Title.PACKAGE,
    "Protein": Title.PROTEIN,
    "Swallow": Title.SWALLOW
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
