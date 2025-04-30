
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:chopnow/views/restaurant/resturant_tile.dart';
import 'package:chopnow/views/search/widget/search_food_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class AllSearchResultsPage extends StatelessWidget {
  const AllSearchResultsPage({
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

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Tcolor.White,
          automaticallyImplyLeading: false,
          surfaceTintColor: Tcolor.White,
          title: Row(
            children: [
              Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: Tcolor.BACKGROUND_Dark),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    HeroiconsOutline.arrowLeft,
                    size: 32.sp,
                    color: Tcolor.Text,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: ReuseableText(
                  title: 'Search result',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                    color: Tcolor.Text,
                  ),
                ),
              ),
            ],
          )),
      body: Container(
        height: height,
        color: Tcolor.White,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 30.w, top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 20.w),
                child: ReuseableText(
                  title: foodResults.isNotEmpty ? 'Items' : 'Restaurants',
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700,
                    color: Tcolor.Text,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: ReuseableText(
                  title: '${results.length} results for "$text"',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w400,
                    color: Tcolor.TEXT_Label,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, i) {
                    if (i < foodResults.length) {
                      final food = foodResults[i];
                      return SearchFoodTile(food: food);
                    } else {
                      final restaurant =
                          restaurantResults[i - foodResults.length];
                      return RestaurntTile(restaurant: restaurant);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
