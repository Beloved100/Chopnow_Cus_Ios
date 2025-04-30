// To parse this JSON data, do
//
//     final additives = additivesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Additives> additivesFromJson(String str) => List<Additives>.from(json.decode(str).map((x) => Additives.fromJson(x)));

String additivesToJson(List<Additives> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Additives {
    final String foodTitle;
    final int foodCount;
    final int foodPrice;
    final List<SelectedItem> selectedItems;

    Additives({
        required this.foodTitle,
        required this.foodCount,
        required this.foodPrice,
        required this.selectedItems,
    });

    factory Additives.fromJson(Map<String, dynamic> json) => Additives(
        foodTitle: json["foodTitle"],
        foodCount: json["foodCount"],
        foodPrice: json["foodPrice"],
        selectedItems: List<SelectedItem>.from(json["selectedItems"].map((x) => SelectedItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "foodTitle": foodTitle,
        "foodCount": foodCount,
        "foodPrice": foodPrice,
        "selectedItems": List<dynamic>.from(selectedItems.map((x) => x.toJson())),
    };
}

class SelectedItem {
    final List<Item> item;

    SelectedItem({
        required this.item,
    });

    factory SelectedItem.fromJson(Map<String, dynamic> json) => SelectedItem(
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
    };
}

class Item {
    final String itemTitle;
    final int itemCount;
    final int itemPrice;

    Item({
        required this.itemTitle,
        required this.itemCount,
        required this.itemPrice,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemTitle: json["itemTitle"],
        itemCount: json["itemCount"],
        itemPrice: json["itemPrice"],
    );

    Map<String, dynamic> toJson() => {
        "itemTitle": itemTitle,
        "itemCount": itemCount,
        "itemPrice": itemPrice,
    };
}
