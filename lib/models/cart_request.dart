import 'package:meta/meta.dart';
import 'dart:convert';

CartRequest cartRequestFromJson(String str) => CartRequest.fromJson(json.decode(str));

String cartRequestToJson(CartRequest data) => json.encode(data.toJson());

class CartRequest {
    final String productId;
    final List<Additive> additives;
    final int totalPrice;
    final String userId;

    CartRequest({
        required this.productId,
        required this.additives,
        required this.totalPrice,
        required this.userId
    });

    factory CartRequest.fromJson(Map<String, dynamic> json) => CartRequest(
        productId: json["productId"],
        additives: List<Additive>.from(json["additives"].map((x) => Additive.fromJson(x))),
        totalPrice: json["totalPrice"],
        userId: json['userId']
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
        "totalPrice": totalPrice,
        "userId": userId
    };
}

class Additive {
    final String foodTitle;
    final int foodPrice;
    final int foodCount;
    final String name;
    final int price;
    final int quantity;
    final int packCount;

    Additive({
        required this.foodTitle,
        required this.foodPrice,
        required this.foodCount,
        required this.name,
        required this.price,
        required this.quantity,
        required this.packCount,
    });

    factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        foodTitle: json["foodTitle"],
        foodPrice: json["foodPrice"],
        foodCount: json["foodCount"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        packCount: json["packCount"],
    );

    Map<String, dynamic> toJson() => {
        "foodTitle": foodTitle,
        "foodPrice": foodPrice,
        "foodCount": foodCount,
        "name": name,
        "price": price,
        "quantity": quantity,
        "packCount": packCount,
    };
}
