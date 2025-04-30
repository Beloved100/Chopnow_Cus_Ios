// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    final String phone;
    final String pin;

    LoginModel({
        required this.phone,
        required this.pin,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        phone: json["phone"],
        pin: json["pin"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "pin": pin,
    };
}
