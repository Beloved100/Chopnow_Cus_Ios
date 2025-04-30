// // To parse this JSON data, do
// //
// //     final orderRequest = orderRequestFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// OrderRequest orderRequestFromJson(String str) =>
//     OrderRequest.fromJson(json.decode(str));

// String orderRequestToJson(OrderRequest data) => json.encode(data.toJson());

// class OrderRequest {
//   final String userId;
//   final List<OrderItem> orderItems;
//   final int orderTotal;
//   final int orderSubId;
//   final int deliveryFee;
//   final int grandTotal;
//   final String deliveryAddress;
//   final String restaurantAddress;
//   final String paymentMethod;
//   final String paymentStatus;
//   final String orderStatus;
//   final String restaurantId;
//   final List<double> restaurantCoords;
//   final List<double> recipientCoords;
//   final String driverId;
//   final int rating;
//   final String feedback;
//   final String promoCode;
//   final int discountAmount;
//   final String notes;
//   final String customerName;
//   final String customerPhone;

//   OrderRequest({
//     required this.userId,
//     required this.orderItems,
//     required this.orderTotal,
//     required this.orderSubId,
//     required this.deliveryFee,
//     required this.grandTotal,
//     required this.deliveryAddress,
//     required this.restaurantAddress,
//     required this.paymentMethod,
//     required this.paymentStatus,
//     required this.orderStatus,
//     required this.restaurantId,
//     required this.restaurantCoords,
//     required this.recipientCoords,
//     required this.driverId,
//     required this.rating,
//     required this.feedback,
//     required this.promoCode,
//     required this.discountAmount,
//     required this.notes,
//     required this.customerName,
//     required this.customerPhone,
//   });

//   factory OrderRequest.fromJson(Map<String, dynamic> json) => OrderRequest(
//         userId: json["userId"],
//         orderItems: List<OrderItem>.from(
//             json["orderItems"].map((x) => OrderItem.fromJson(x))),
//         orderTotal: json["orderTotal"],
//         orderSubId: json["orderSubId"],
//         deliveryFee: json["deliveryFee"],
//         grandTotal: json["grandTotal"],
//         deliveryAddress: json["deliveryAddress"],
//         restaurantAddress: json["restaurantAddress"],
//         paymentMethod: json["paymentMethod"],
//         paymentStatus: json["paymentStatus"],
//         orderStatus: json["orderStatus"],
//         restaurantId: json["restaurantId"],
//         restaurantCoords: List<double>.from(
//             json["restaurantCoords"].map((x) => x?.toDouble())),
//         recipientCoords: List<double>.from(
//             json["recipientCoords"].map((x) => x?.toDouble())),
//         driverId: json["driverId"],
//         rating: json["rating"],
//         feedback: json["feedback"],
//         promoCode: json["PromoCode"],
//         discountAmount: json["discountAmount"],
//         notes: json["notes"],
//         customerName: json["customerName"],
//         customerPhone: json["customerPhone"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
//         "orderTotal": orderTotal,
//         "orderSubId": orderSubId,
//         "deliveryFee": deliveryFee,
//         "grandTotal": grandTotal,
//         "deliveryAddress": deliveryAddress,
//         "restaurantAddress": restaurantAddress,
//         "paymentMethod": paymentMethod,
//         "paymentStatus": paymentStatus,
//         "orderStatus": orderStatus,
//         "restaurantId": restaurantId,
//         "restaurantCoords": List<dynamic>.from(restaurantCoords.map((x) => x)),
//         "recipientCoords": List<dynamic>.from(recipientCoords.map((x) => x)),
//         "driverId": driverId,
//         "rating": rating,
//         "feedback": feedback,
//         "PromoCode": promoCode,
//         "discountAmount": discountAmount,
//         "notes": notes,
//         "customerName": customerName,
//         "customerPhone": customerPhone,
//       };
// }

// To parse this JSON data, do
//
//     final orderRequest = orderRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderRequest orderRequestFromJson(String str) => OrderRequest.fromJson(json.decode(str));

String orderRequestToJson(OrderRequest data) => json.encode(data.toJson());

class OrderRequest {
    final String userId;
    final List<OrderItem> orderItems;
    final int orderTotal;
    final int orderSubId;
    final int deliveryFee;
    final String customerFcm;
    final String restaurantFcm;
    final String riderFcm;
    final int grandTotal;
    final String deliveryAddress;
    final String restaurantAddress;
    final String paymentMethod;
    final String paymentStatus;
    final String orderStatus;
    final String riderStatus;
    final String restaurantId;
    final List<double> restaurantCoords;
    final List<double> recipientCoords;
    final String driverId;
    final List<dynamic> rejectedBy;
    final int rating;
    final bool restaurantRating;
    final bool riderRating;
    final String feedback;
    final String promoCode;
    final String customerName;
    final String customerPhone;
    final int discountAmount;
    final String notes;
    final bool riderAssigned;

    OrderRequest({
        required this.userId,
        required this.orderItems,
        required this.orderTotal,
        required this.orderSubId,
        required this.deliveryFee,
        required this.customerFcm,
        required this.restaurantFcm,
        required this.riderFcm,
        required this.grandTotal,
        required this.deliveryAddress,
        required this.restaurantAddress,
        required this.paymentMethod,
        required this.paymentStatus,
        required this.orderStatus,
        required this.riderStatus,
        required this.restaurantId,
        required this.restaurantCoords,
        required this.recipientCoords,
        required this.driverId,
        required this.rejectedBy,
        required this.rating,
        required this.restaurantRating,
        required this.riderRating, 
        required this.feedback,
        required this.promoCode,
        required this.customerName,
        required this.customerPhone,
        required this.discountAmount,
        required this.notes,
        required this.riderAssigned,
    });

    factory OrderRequest.fromJson(Map<String, dynamic> json) => OrderRequest(
        userId: json["userId"],
        orderItems: List<OrderItem>.from(json["orderItems"].map((x) => OrderItem.fromJson(x))),
        orderTotal: json["orderTotal"],
        orderSubId: json["orderSubId"],
        deliveryFee: json["deliveryFee"],
        customerFcm: json["customerFcm"],
        restaurantFcm: json["restaurantFcm"],
        riderFcm: json["riderFcm"],
        grandTotal: json["grandTotal"],
        deliveryAddress: json["deliveryAddress"],
        restaurantAddress: json["restaurantAddress"],
        paymentMethod: json["paymentMethod"],
        paymentStatus: json["paymentStatus"],
        orderStatus: json["orderStatus"],
        riderStatus: json["riderStatus"],
        restaurantId: json["restaurantId"],
        restaurantCoords: List<double>.from(json["restaurantCoords"].map((x) => x?.toDouble())),
        recipientCoords: List<double>.from(json["recipientCoords"].map((x) => x?.toDouble())),
        driverId: json["driverId"],
        rejectedBy: List<dynamic>.from(json["rejectedBy"].map((x) => x)),
        rating: json["rating"],
        restaurantRating: json["restaurantRating"],
        riderRating: json["riderRating"],
        feedback: json["feedback"],
        promoCode: json["PromoCode"],
        customerName: json["customerName"],
        customerPhone: json["customerPhone"],
        discountAmount: json["discountAmount"],
        notes: json["notes"],
        riderAssigned: json["riderAssigned"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "orderTotal": orderTotal,
        "orderSubId": orderSubId,
        "deliveryFee": deliveryFee,
        "customerFcm": customerFcm,
        "restaurantFcm": restaurantFcm,
        "riderFcm": riderFcm,
        "grandTotal": grandTotal,
        "deliveryAddress": deliveryAddress,
        "restaurantAddress": restaurantAddress,
        "paymentMethod": paymentMethod,
        "paymentStatus": paymentStatus,
        "orderStatus": orderStatus,
        "riderStatus": riderStatus,
        "restaurantId": restaurantId,
        "restaurantCoords": List<dynamic>.from(restaurantCoords.map((x) => x)),
        "recipientCoords": List<dynamic>.from(recipientCoords.map((x) => x)),
        "driverId": driverId,
        "rejectedBy": List<dynamic>.from(rejectedBy.map((x) => x)),
        "rating": rating,
        "restaurantRating": restaurantRating,
        "riderRating": riderRating,
        "feedback": feedback,
        "PromoCode": promoCode,
        "customerName": customerName,
        "customerPhone": customerPhone,
        "discountAmount": discountAmount,
        "notes": notes,
        "riderAssigned": riderAssigned,
    };
}

class OrderItem {
  final String foodId;
  final int numberOfPack;

  final List<Additive> additives;
  final String instruction;

  OrderItem(
      {required this.foodId,
      required this.additives,
      required this.instruction,
      required this.numberOfPack});

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        foodId: json["foodId"],
        numberOfPack: json['numberOfPack'],
        additives: List<Additive>.from(
            json["additives"].map((x) => Additive.fromJson(x))),
        instruction: json["instruction"],
      );

  Map<String, dynamic> toJson() => {
        "foodId": foodId,
        "numberOfPack": numberOfPack,
        "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
        "instruction": instruction,
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
