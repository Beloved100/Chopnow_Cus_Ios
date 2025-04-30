// To parse this JSON data, do
//
//     final riderUserModel = riderUserModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RiderUserModel riderUserModelFromJson(String str) => RiderUserModel.fromJson(json.decode(str));

String riderUserModelToJson(RiderUserModel data) => json.encode(data.toJson());

class RiderUserModel {
    final String id;
    final String firstName;
    final String lastName;
    final String email;
    final dynamic otp;
    final String fcm;
    final String password;
    final String pin;
    final dynamic otpExpires;
    final bool verification;
    final String phone;
    final bool phoneVerification;
    final String userType;
    final DateTime createdAt;
    final DateTime updatedAt;

    RiderUserModel({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.otp,
        required this.fcm,
        required this.password,
        required this.pin,
        required this.otpExpires,
        required this.verification,
        required this.phone,
        required this.phoneVerification,
        required this.userType,
        required this.createdAt,
        required this.updatedAt,
    });

    factory RiderUserModel.fromJson(Map<String, dynamic> json) => RiderUserModel(
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        otp: json["otp"],
        fcm: json["fcm"],
        password: json["password"],
        pin: json["pin"],
        otpExpires: json["otpExpires"],
        verification: json["verification"],
        phone: json["phone"],
        phoneVerification: json["phoneVerification"],
        userType: json["userType"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "otp": otp,
        "fcm": fcm,
        "password": password,
        "pin": pin,
        "otpExpires": otpExpires,
        "verification": verification,
        "phone": phone,
        "phoneVerification": phoneVerification,
        "userType": userType,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
