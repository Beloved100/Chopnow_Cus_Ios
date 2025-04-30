
// import 'dart:convert';

// OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

// String orderModelToJson(OrderModel data) => json.encode(data.toJson());

// class OrderModel {
//     final String id;
//     final String userId;
//     final List<OrderItem> orderItems;
//     final int orderTotal;
//     final int deliveryFee;
//     final int grandTotal;
//     final String deliveryAddress;
//     final String restaurantAddress;
//     final String paymentMethod;
//     final String paymentStatus;
//     final String orderStatus;
//     final String restaurantId;
//     final List<double> restaurantCoords;
//     final List<double> recipientCoords;
//     final String driverId;
//     final int rating;
//     final String feedback;
//     final String promoCode;
//     final int discountAmount;
//     final String notes;
//     final DateTime createdAt;
//     final DateTime updatedAt;

//     OrderModel({
//         required this.id,
//         required this.userId,
//         required this.orderItems,
//         required this.orderTotal,
//         required this.deliveryFee,
//         required this.grandTotal,
//         required this.deliveryAddress,
//         required this.restaurantAddress,
//         required this.paymentMethod,
//         required this.paymentStatus,
//         required this.orderStatus,
//         required this.restaurantId,
//         required this.restaurantCoords,
//         required this.recipientCoords,
//         required this.driverId,
//         required this.rating,
//         required this.feedback,
//         required this.promoCode,
//         required this.discountAmount,
//         required this.notes,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
//         id: json["_id"],
//         userId: json["userId"],
//         orderItems: List<OrderItem>.from(json["orderItems"].map((x) => OrderItem.fromJson(x))),
//         orderTotal: json["orderTotal"],
//         deliveryFee: json["deliveryFee"],
//         grandTotal: json["grandTotal"],
//         deliveryAddress: json["deliveryAddress"],
//         restaurantAddress: json["restaurantAddress"],
//         paymentMethod: json["paymentMethod"],
//         paymentStatus: json["paymentStatus"],
//         orderStatus: json["orderStatus"],
//         restaurantId: json["restaurantId"],
//         restaurantCoords: List<double>.from(json["restaurantCoords"].map((x) => x?.toDouble())),
//         recipientCoords: List<double>.from(json["recipientCoords"].map((x) => x?.toDouble())),
//         driverId: json["driverId"],
//         rating: json["rating"],
//         feedback: json["feedback"],
//         promoCode: json["PromoCode"],
//         discountAmount: json["discountAmount"],
//         notes: json["notes"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "userId": userId,
//         "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
//         "orderTotal": orderTotal,
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
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//     };
// }

// class OrderItem {
//     final String foodId;
//     final List<Additive> additives;
//     final String instruction;
//     final String id;
    

//     OrderItem({
//         required this.foodId,
//         required this.additives,
//         required this.instruction,
//         required this.id,
        
//     });

//     factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
//         foodId: json["foodId"],
//         additives: List<Additive>.from(json["additives"].map((x) => Additive.fromJson(x))),
//         instruction: json["instruction"],
//         id: json["_id"],
        
//     );

//     Map<String, dynamic> toJson() => {
//         "foodId": foodId,
//         "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
//         "instruction": instruction,
//         "_id": id,
        
//     };
// }

// class Additive {
//     final String foodTitle;
//     final int foodPrice;
//     final int foodCount;
//     final String name;
//     final int price;
//     final int quantity;
//     final int packCount;

//     Additive({
//         required this.foodTitle,
//         required this.foodPrice,
//         required this.foodCount,
//         required this.name,
//         required this.price,
//         required this.quantity,
//         required this.packCount,
//     });

//     factory Additive.fromJson(Map<String, dynamic> json) => Additive(
//         foodTitle: json["foodTitle"],
//         foodPrice: json["foodPrice"],
//         foodCount: json["foodCount"],
//         name: json["name"],
//         price: json["price"],
//         quantity: json["quantity"],
//         packCount: json["packCount"],
//     );

//     Map<String, dynamic> toJson() => {
//         "foodTitle": foodTitle,
//         "foodPrice": foodPrice,
//         "foodCount": foodCount,
//         "name": name,
//         "price": price,
//         "quantity": quantity,
//         "packCount": packCount,
//     };
// }
