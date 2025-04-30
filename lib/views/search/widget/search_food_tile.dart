

import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/hooks/fetch_restaurant_byId.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/single_restaurant_model.dart';
import 'package:chopnow/views/food/food_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchFoodTile extends HookWidget {
  const SearchFoodTile({
    super.key,
    required this.food,
  });

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurantById(food.restaurant);
    final SingleRestaurantModel? restaurantList = hookResult.data;
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;
    return GestureDetector(
      onTap: () {
        Get.to(
          () => FoodPage(
            food: food,
          ),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 700),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 160.h,
            width: width,
            decoration: BoxDecoration(
              color: Tcolor.White,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      bottomLeft: Radius.circular(30.r),
                      topRight: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: SizedBox(
                        width: 100.w,
                        height: 100.h,
                        child: Image.network(
                          food.imageUrl[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 35.h, bottom: 35.h, left: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReuseableText(
                        title: food.title,
                        style: TextStyle(
                            color: Tcolor.Text,
                            fontWeight: FontWeight.w500,
                            fontSize: 32.sp),
                      ), isLoading ? SizedBox(height: 2.h, width: 2.w,):
                      ReuseableText(
                        title: restaurantList!.title,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: Tcolor.TEXT_Label,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.w, right: 30.w),
            child: Align(
                  alignment: Alignment.topRight,
                  child: ReuseableText(
                        title: "NGN ${food.price.toString()}",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Tcolor.Text,
                        ),
                      ),
                ),
          ),
        ],
      ),
    );
  }
}
