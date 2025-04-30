
import 'package:chopnow/hooks/fetch_by_restaurant_category.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/views/food/food_tile.dart';
import 'package:chopnow/views/shimmer/food_tile_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantMenuWidget extends HookWidget {
  const RestaurantMenuWidget({
    super.key,
    required this.restaurantCategory,
    required this.restaurantId,
    required this.emptyMessage,
  });

  final String restaurantCategory;
  final String restaurantId;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoodsByRestaurantCategory(restaurantId, restaurantCategory);
    final List<FoodModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      body: isLoading
          ? ListView.builder(
              itemCount: 2, // Display a few shimmer tiles while loading
              itemBuilder: (context, index) => const ShimmerFoodTile(),
            )
          : foods == null || foods.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      emptyMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50.sp, // Adjust the font size as needed
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 222, 14, 14), // Adjust the color as needed
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    FoodModel food = foods[index];
                    return FoodTile(food: food);
                  },
                ),
    );
  }
}
