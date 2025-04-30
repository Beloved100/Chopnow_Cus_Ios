// To parse this JSON data, do
//
//     final setPinResponseModel = setPinResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SetPinResponseModel setPinResponseModelFromJson(String str) => SetPinResponseModel.fromJson(json.decode(str));

String setPinResponseModelToJson(SetPinResponseModel data) => json.encode(data.toJson());

class SetPinResponseModel {
    final bool status;
    final String message;
    final String token;

    SetPinResponseModel({
        required this.status,
        required this.message,
        required this.token,
    });

    factory SetPinResponseModel.fromJson(Map<String, dynamic> json) => SetPinResponseModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
    };
}
