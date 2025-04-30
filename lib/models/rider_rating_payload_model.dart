// To parse this JSON data, do
//
//     final riderRatingPayLoadModel = riderRatingPayLoadModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RiderRatingPayLoadModel riderRatingPayLoadModelFromJson(String str) => RiderRatingPayLoadModel.fromJson(json.decode(str));

String riderRatingPayLoadModelToJson(RiderRatingPayLoadModel data) => json.encode(data.toJson());

class RiderRatingPayLoadModel {
    final String riderId;
    final String userId;
    final String orderId;
    final double rating;
    final String comment;
    final String name;

    RiderRatingPayLoadModel({
        required this.riderId,
        required this.userId,
        required this.orderId,
        required this.rating,
        required this.comment,
        required this.name,
    });

    factory RiderRatingPayLoadModel.fromJson(Map<String, dynamic> json) => RiderRatingPayLoadModel(
        riderId: json["riderId"],
        userId: json["userId"],
        orderId: json["orderId"],
        rating: json["rating"]?.toDouble(),
        comment: json["comment"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "riderId": riderId,
        "userId": userId,
        "orderId": orderId,
        "rating": rating,
        "comment": comment,
        "name": name,
    };
}
