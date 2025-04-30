
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/hooks/fetch_restaurant_rating.dart';
import 'package:chopnow/models/rating_model.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:chopnow/views/restaurant/widget/rating_tile.dart';
import 'package:chopnow/views/shimmer/food_tile_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingPage extends HookWidget {
  const RatingPage({super.key, required this.restaurant});
  final RestaurantModel? restaurant;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurantRating(restaurant!.id);
    final List<RatingModel>? ratingList = hookResult.data;
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;

    return Scaffold(
      body: Container(
        color: Tcolor.White,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              child: ReuseableText(
                title: '${ratingList?.length ?? 0} Reviews',
                style: TextStyle(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w500,
                  color: Tcolor.Text,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: isLoading
                  ? const ShimmerFoodTile()
                  : ratingList == null || ratingList.isEmpty
                      ? Center(
                          child: Text(
                            'No ratings available',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Tcolor.White,
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                            child: Column(
                              children: List.generate(ratingList.length, (i) {
                                RatingModel rating = ratingList[i];
                                return RatingTile(
                                  rating: rating,
                                );
                              }),
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
