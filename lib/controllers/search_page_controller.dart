// ignore_for_file: unused_local_variable, prefer_final_fields

import 'dart:convert';


import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:chopnow/models/search_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class SearchFoodRestaurantController extends GetxController {
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  RxList<FoodModel> foodSearch = RxList<FoodModel>();
  RxList<RestaurantModel> restaurantSearch = RxList<RestaurantModel>();

  void searchFood(String key) async {
    isLoading = true;
    Uri url = Uri.parse("$appBaseUrl/api/food/search-food-restaurant/$key");

    try {
      var response = await http.get(url);
      print("searched Foods or restaurants: ${response.body}");
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var searchResponse = SearchResponse.fromJson(jsonResponse);
        foodSearch.assignAll(searchResponse.foods ?? []);
        restaurantSearch.assignAll(searchResponse.restaurants ?? []);
      } else {
        var error = apiErrorFromJson(response.body);
        // Handle error accordingly
      }
    } catch (e) {
      debugPrint(e.toString());
      // Handle error accordingly
    } finally {
      isLoading = false;
    }
  }
}

