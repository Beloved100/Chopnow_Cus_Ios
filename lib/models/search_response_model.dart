

import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/restaurant_model.dart';

class SearchResponse {
  final List<FoodModel> foods;
  final List<RestaurantModel> restaurants;

  SearchResponse({
    required this.foods,
    required this.restaurants,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      foods: (json['foods'] as List<dynamic>)
          .map((item) => FoodModel.fromJson(item))
          .toList(),
      restaurants: (json['restaurants'] as List<dynamic>)
          .map((item) => RestaurantModel.fromJson(item))
          .toList(),
    );
  }
}
