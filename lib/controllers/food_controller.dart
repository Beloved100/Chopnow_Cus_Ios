import 'dart:convert';

import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/single_food_additive_model.dart';
import 'package:chopnow/models/single_food_pack_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class FoodController extends GetxController {
  final box = GetStorage();

  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  final FoodModel food;
  var count = 1.obs;
  var packCount = 1.obs;
  RxInt totalPrice = 0.obs; // Reactive total price

  // var additiveCounts = <String, int>{}.obs;
  RxMap<String, int> additiveCounts = <String, int>{}.obs;
  RxMap<String, bool> isChecked = <String, bool>{}.obs;
  var selectedPacks =
      <Map<String, dynamic>>[].obs; // List to store selected packs

  var selectedAdditives =
      <Map<String, dynamic>>[].obs; // List to store selected additives

  var selectedItems = <SelectedItem>[].obs; // List to store selected items
  // var totalPrice = 0.obs; // Observable total price

  FoodController(this.food);
  

  void increment() {
    print("tapped food ${food.title}");
    if (count < 5) {
      count.value++;
    }
    calculateTotalPrice();
    updateSelectedItems();
  }

  void decrement() {
    if (count > 1) {
      count.value--;
      calculateTotalPrice();
      updateSelectedItems();
    }
  }

  // Function to calculate total price
  void calculateTotalPrice() {
    int additiveTotal = 0;
    int packTotal = 0;
    var total = food.price * count.value;

    // Calculate total price for additives
    for (var additive in selectedAdditives) {
      additiveTotal +=
          (additive['additivePrice'] ?? 0) as int; // Explicitly cast to int
    }

    // Calculate total price for packs
    for (var pack in selectedPacks) {
      packTotal += (pack['packPrice'] ?? 0) as int; // Explicitly cast to int
    }

    // Update the reactive total price
    totalPrice.value = additiveTotal + packTotal + total;
  }

  // Function to handle the checkbox change and update the total price
  void handleCheckboxChange(bool? value, SingleFoodPack pack) {
    if (value != null) {
      isChecked[pack.id] = value; // Update the map directly

      if (value) {
        selectedPacks.add({
          'packName': pack.packName,
          'packPrice': pack.price,
          'packCount': 1,
        });
        print(selectedPacks);
      } else {
        selectedPacks.removeWhere(
            (selectedPack) => selectedPack['packName'] == pack.packName);
        print(selectedPacks.length);
      }

      calculateTotalPrice(); // Recalculate the total price
      updateSelectedItems();
    }
  }

  void handleCheckboxChange2(bool? value, AdditiveOption additive) {
    if (value != null) {
      isChecked[additive.id] = value; // Update the map directly

      if (value) {
        if (!additiveCounts.containsKey(additive.id)) {
          additiveCounts[additive.id] = 1;
        }

        selectedAdditives.add({
          'id': additive.id,
          'additiveName': additive.additiveName,
          'additivePrice': additive.price * additiveCounts[additive.id]!,
          'additiveCount': additiveCounts[additive.id] ?? 1,
        });
        print(selectedAdditives);
      } else {
        selectedAdditives.removeWhere((selectedAdditives) =>
            selectedAdditives['additiveName'] == additive.additiveName);
        additiveCounts.remove(additive.id);
        print(selectedAdditives.length);
      }
      selectedAdditives.refresh(); // Trigger reactive updates
      calculateTotalPrice();
      updateSelectedItems();
    }
  }

  void incrementAdditiveCount(String additiveId, int price, int max) {
    if ((additiveCounts[additiveId] ?? 1) < max) {
      // Allow increment only if count is less than 10
      additiveCounts[additiveId] = (additiveCounts[additiveId] ?? 1) + 1;
      print(additiveId);

      // Update the count in selectedAdditives if it exists
      for (var selectedAdditive in selectedAdditives) {
        if (selectedAdditive['id'] == additiveId) {
          selectedAdditive['additiveCount'] = additiveCounts[additiveId];
          selectedAdditive['additivePrice'] =
              price * additiveCounts[additiveId]!;
              
        }
      }
      selectedAdditives.refresh();
      print("new additves: $selectedAdditives");
      calculateTotalPrice();
      updateSelectedItems();
    }
  }

  void decrementAdditiveCount(String additiveId, int price) {
    if ((additiveCounts[additiveId] ?? 1) > 1) {
      additiveCounts[additiveId] = (additiveCounts[additiveId] ?? 1) - 1;

      // Update the count in selectedAdditives if it exists
      for (var selectedAdditive in selectedAdditives) {
        if (selectedAdditive['id'] == additiveId) {
          selectedAdditive['additiveCount'] = additiveCounts[additiveId];
          selectedAdditive['additivePrice'] =
              price * additiveCounts[additiveId]!;
        }
      }
      selectedAdditives.refresh();
      print("new additves: $selectedAdditives");
      calculateTotalPrice();
      updateSelectedItems();
    }
  }

  // Helper method to update the price in selectedAdditives
  // void updateSelectedAdditivePrice(String additiveId, int price) {
  //   for (var additive in selectedAdditives) {
  //     if (additive['name'] == additiveId) {
  //       additive['price'] = price * additiveCounts[additiveId]!;
  //       break;
  //     }
  //   }
  //   selectedAdditives.refresh(); // Trigger reactive updates
  // }

  void clearSelections() {
    // Clear selectedAdditives and selectedPacks
    selectedAdditives.clear();
    selectedPacks.clear();
    selectedItems.clear();
    additiveCounts.clear();

    // Uncheck all checkboxes
    isChecked.clear();

    // Reset counts for additives
    additiveCounts.clear();

    print("Selections cleared!");
  }

  void resetTotalPrice() {
    totalPrice.value = 0; // Reset the total price to 0
    selectedAdditives.clear(); // Clear selected additives
    selectedPacks.clear(); // Clear selected packs
    selectedItems.clear();

    count.value = 1;
  }

  void updateSelectedItems() {
    selectedItems.clear();
    print(
        "Updating selected items for food: ${food.title}, price: ${food.price}");
    print(selectedItems.length);

    // Add selected additives
    for (var additive in selectedAdditives) {
      selectedItems.add(
        SelectedItem(
          foodTitle: food.title,
          foodPrice: food.price,
          foodCount: count.value,
          name: additive['additiveName'] ?? '',
          price: additive['additivePrice'] ?? 0,
          quantity: additive['additiveCount'] ?? 1,
          packCount: 0,
        ),
      );
    }

    // Add selected packs
    for (var pack in selectedPacks) {
      selectedItems.add(
        SelectedItem(
          foodTitle: food.title,
          foodPrice: food.price,
          foodCount: count.value,
          name: pack['packName'] ?? '',
          price: pack['packPrice'] ?? 0,
          quantity: pack["packCount"] ?? 1,
          packCount: 0,
        ),
      );
    }

    selectedItems.refresh();

    print("Selected Items: ${selectedItems.map((item) => item.toJson())}");
  }

   @override
  void onClose() {
    // Reset selections when the controller is closed
    resetSelectionsForNewFood();
    super.onClose(); // Call the parent class's onClose method
  }

  void resetSelectionsForNewFood() {
    selectedItems.clear();
    selectedAdditives.clear();
    selectedPacks.clear();
    additiveCounts.clear();
    isChecked.clear();
    count.value = 1; // Reset count to 1
    totalPrice.value = 0; // Reset total price
    print("selectedItems: ${selectedItems.length}");
  }

  Future<List<SingleFoodAdditives>> fetchAdditives(String foodId) async {
    setLoading = true;

    // String accessToken = box.read("token");
    var url = Uri.parse(
        "$appBaseUrl/api/food/fetch-single-food-additive/${foodId}/additives");

    // Map<String, String> headers = {
    //   'Content-Type': 'application/json',
    //   // 'Authorization': 'Bearer $accessToken'
    // };

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        setLoading = false;
        print(response.body);
        var data =
            json.decode(response.body); // Assuming the API response is JSON
        return List<SingleFoodAdditives>.from(
            data.map((item) => SingleFoodAdditives.fromJson(item)));
      } else {
        var error = apiErrorFromJson(response.body);
        print(error);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
    return [];
  }

  Future<List<SingleFoodPack>> fetchPacks(String foodId) async {
    setLoading = true;

    // String accessToken = box.read("token");
    var url = Uri.parse(
        "$appBaseUrl/api/food/fetch-single-food-packs/${foodId}/packs");

    // Map<String, String> headers = {
    //   'Content-Type': 'application/json',
    //   // 'Authorization': 'Bearer $accessToken'
    // };

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        setLoading = false;
        print(response.body);
        var data =
            json.decode(response.body); // Assuming the API response is JSON
        return List<SingleFoodPack>.from(
            data.map((item) => SingleFoodPack.fromJson(item)));
      } else {
        var error = apiErrorFromJson(response.body);
        print(error);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
    return [];
  }
}

class SelectedItem {
  final String foodTitle; // Title of the main food item
  final int foodPrice; // Price of the main food item
  final int foodCount; // Quantity of the main food item
  final String name; // Name of the additive or pack
  final int price; // Price of the additive or pack
  final int quantity; // Quantity of the additive
  final int packCount; // Quantity of the pack

  SelectedItem({
    required this.foodTitle,
    required this.foodPrice,
    required this.foodCount,
    required this.name,
    required this.price,
    required this.quantity,
    required this.packCount,
  });

  // Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'foodTitle': foodTitle ,
      'foodPrice': foodPrice,
      'foodCount': foodCount,
      'name': name,
      'price': price,
      'quantity': quantity,
      'packCount': packCount,
    };
  }
}
