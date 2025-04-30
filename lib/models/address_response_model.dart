
import 'dart:convert';

List<AddressResponseModel> addressResponseModelFromJson(String str) => List<AddressResponseModel>.from(json.decode(str).map((x) => AddressResponseModel.fromJson(x)));

String addressResponseModelToJson(List<AddressResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressResponseModel {
    final String id;
    final String userId;
    final String addressLine1;
    final String postalCode;
    final bool addressResponseModelDefault;
    final String deliveryInstructions;
    final double latitude;
    final double longitude;
    final DateTime createdAt;
    final DateTime updatedAt;

    AddressResponseModel({
        required this.id,
        required this.userId,
        required this.addressLine1,
        required this.postalCode,
        required this.addressResponseModelDefault,
        required this.deliveryInstructions,
        required this.latitude,
        required this.longitude,
        required this.createdAt,
        required this.updatedAt,
    });

    factory AddressResponseModel.fromJson(Map<String, dynamic> json) => AddressResponseModel(
        id: json["_id"],
        userId: json["userId"],
        addressLine1: json["addressLine1"],
        postalCode: json["postalCode"],
        addressResponseModelDefault: json["default"],
        deliveryInstructions: json["deliveryInstructions"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "addressLine1": addressLine1,
        "postalCode": postalCode,
        "default": addressResponseModelDefault,
        "deliveryInstructions": deliveryInstructions,
        "latitude": latitude,
        "longitude": longitude,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
