// To parse this JSON data, do
//
//     final ratingRequestModel = ratingRequestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RatingRequestModel ratingRequestModelFromJson(String str) => RatingRequestModel.fromJson(json.decode(str));

String ratingRequestModelToJson(RatingRequestModel data) => json.encode(data.toJson());

class RatingRequestModel {
    final String restaurantId;
    final String userId;
    final double rating;
    final String comment;
    final String name;
    final String orderId;

    RatingRequestModel({
        required this.restaurantId,
        required this.userId,
        required this.rating,
        required this.comment,
        required this.name,
        required this.orderId
    });

    factory RatingRequestModel.fromJson(Map<String, dynamic> json) => RatingRequestModel(
        restaurantId: json["restaurantId"],
        userId: json["userId"],
        rating: json["rating"]?.toDouble(),
        comment: json["comment"],
        name: json["name"],
        orderId: json['orderId']
    );

    Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "userId": userId,
        "rating": rating,
        "comment": comment,
        "name": name,
        "orderId": orderId
    };
}
