
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchResultTile extends StatelessWidget {
  const SearchResultTile({super.key, required this.food, required this.restaurant});

  final FoodModel food;
  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(
        //   () => FoodPage(food: food),
        //   transition: Transition.fadeIn,
        //   duration: const Duration(milliseconds: 700),
        // );
      },
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 160.h,
            width: width,
            decoration: BoxDecoration(
              color: Tcolor.White,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReuseableText(
                          title: restaurant.title,
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: Tcolor.Text,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        
                        SizedBox(height: 20.h),
                        ReuseableText(
                          title: "\u20A6 ${food.price.toString()}",
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: Tcolor.Text,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(24.r)),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 164.w,
                          height: 164.h,
                          child: Image.network(
                            food.imageUrl[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (!food.isAvailable) ...[
                          Container(
                            width: 164.w,
                            height: 164.h,
                            color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
                          ),
                          Positioned(
                            bottom: 0, // Position at the bottom
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 40.h,
                              width: 164.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Tcolor.ERROR_Light_2,
                              ),
                              child: Center(
                                child: ReuseableText(
                                  title: 'Out of Stock',
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Tcolor.ERROR_Reg,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
