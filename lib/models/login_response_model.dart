// To parse this JSON data, do
//
//     final loginResponsModel = loginResponsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponsModel loginResponsModelFromJson(String str) => LoginResponsModel.fromJson(json.decode(str));

String loginResponsModelToJson(LoginResponsModel data) => json.encode(data.toJson());

class LoginResponsModel {
    final String id;
    final String firstName;
    final String lastName;
    final String email;
    final String fcm;
    final String pin;
    final dynamic otpExpires;
    final bool verification;
    final String phone;
    final bool phoneVerification;
    final String userType;
    final int v;
    final String token;
    final int price;
    final double seviceCharge;
    final Location location;

    LoginResponsModel({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.fcm,
        required this.pin,
        required this.otpExpires,
        required this.verification,
        required this.phone,
        required this.phoneVerification,
        required this.userType,
        required this.v,
        required this.token,
        required this.price,
        required this.seviceCharge,
        required this.location,
    });

    factory LoginResponsModel.fromJson(Map<String, dynamic> json) => LoginResponsModel(
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        fcm: json["fcm"],
        pin: json["pin"],
        otpExpires: json["otpExpires"],
        verification: json["verification"],
        phone: json["phone"],
        phoneVerification: json["phoneVerification"],
        userType: json["userType"],
        v: json["__v"],
        token: json["token"],
        price: json["price"],
        seviceCharge: json["sevice_charge"]?.toDouble(),
        location: Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "fcm": fcm,
        "pin": pin,
        "otpExpires": otpExpires,
        "verification": verification,
        "phone": phone,
        "phoneVerification": phoneVerification,
        "userType": userType,
        "__v": v,
        "token": token,
        "price": price,
        "sevice_charge": seviceCharge,
        "location": location.toJson(),
    };
}

class Location {
    final String id;
    final double minLat;
    final double maxLat;
    final double minLng;
    final double maxLng;
    final DateTime createdAt;
    final DateTime updatedAt;

    Location({
        required this.id,
        required this.minLat,
        required this.maxLat,
        required this.minLng,
        required this.maxLng,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["_id"],
        minLat: json["minLat"]?.toDouble(),
        maxLat: json["maxLat"]?.toDouble(),
        minLng: json["minLng"]?.toDouble(),
        maxLng: json["maxLng"]?.toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "minLat": minLat,
        "maxLat": maxLat,
        "minLng": minLng,
        "maxLng": maxLng,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
