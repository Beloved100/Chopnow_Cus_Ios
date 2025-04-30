import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/other_loading_lottie.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/hooks/fetch_food_by_categories.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/views/food/food_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class FoodByCategory extends HookWidget {
  const FoodByCategory({super.key, required this.id, required this.title});
  final String id;
  final String title;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoodsByCategories(id);
    final List<FoodModel>? foodlist = hookResult.data;
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;

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
                color: Tcolor.BACKGROUND_Dark,
              ),
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
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: ReuseableText(
                title: title,
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                  color: Tcolor.Text,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: height,
        color: Tcolor.White,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 30.w, top: 10.h),
          child: isLoading
              ? Center(child: const OtherLottie()) // Show loading state
              : error != null
                  ? Center(
                      // Display an error message
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 16.h),
                          ReuseableText(
                           title: "Failed to load food items.",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: Tcolor.Text,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          ElevatedButton(
                            onPressed: () {
                              // Retry logic can be implemented here
                            },
                            child: Text("Retry"),
                          ),
                        ],
                      ),
                    )
                  : foodlist == null || foodlist.isEmpty
                      ? Center(
                          child: Text(
                            "No food items found.",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: Tcolor.TEXT_Body,
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: foodlist.length,
                            itemBuilder: (context, i) {
                              FoodModel food = foodlist[i];
                              return Padding(
                                padding:  EdgeInsets.only(left: 20.w, right:20.w),
                                child: FoodTile(food: food),
                              );
                            },
                          ),
                        ),
        ),
      ),
    );
  }
}
