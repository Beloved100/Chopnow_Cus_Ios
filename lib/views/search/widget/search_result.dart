import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:chopnow/views/restaurant/resturant_tile.dart';
import 'package:chopnow/views/search/widget/all_results.dart';
import 'package:chopnow/views/search/widget/search_food_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodRestaurantSearchResult extends StatelessWidget {
  const FoodRestaurantSearchResult({
    Key? key,
    required this.foodResults,
    required this.restaurantResults,
    required this.text,
  }) : super(key: key);

  final List<FoodModel> foodResults;
  final List<RestaurantModel> restaurantResults;
  final String text;

  @override
  Widget build(BuildContext context) {
    final results = [...foodResults, ...restaurantResults];

    return Container(
      height: height,
      color: Tcolor.BACKGROUND_Regaular,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
            child: ReuseableText(
              title: '${results.length} results for "$text"',
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w500,
                color: Tcolor.Text,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          if (results.length > 1)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => AllSearchResultsPage(
                      foodResults: foodResults,
                      restaurantResults: restaurantResults,
                      text: text,
                    ),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 1000),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReuseableText(
                      title: foodResults.isNotEmpty ? 'Items' : 'Restaurants',
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w500,
                        color: Tcolor.TEXT_Label,
                      ),
                    ),
                    ReuseableText(
                      title: "See all",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                        color: Tcolor.PRIMARY_S4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: results.length > 2 ? 4 : results.length,
              itemBuilder: (context, i) {
                if (i < foodResults.length) {
                  final food = foodResults[i];
                  return SearchFoodTile(food: food);
                } else {
                  final restaurant = restaurantResults[i - foodResults.length];
                  return RestaurntTile(restaurant: restaurant);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
