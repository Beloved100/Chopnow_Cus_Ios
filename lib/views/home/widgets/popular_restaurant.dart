import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/hooks/fetch_popular_restaurant.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:chopnow/views/shimmer/restaurant_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sub_widgets/restaurant_widget.dart';

class PopularRestaurant extends HookWidget {
  const PopularRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchPopularRestaurants();
    final List<RestaurantModel> popularRestuarants = hookResult.data ?? [];
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;
    print("popularRestuarants.length: ${popularRestuarants.length}");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReuseableText(
          title: "Popular Restaurants",
          style: TextStyle(
              fontSize: 32.sp, fontWeight: FontWeight.w600, color: Tcolor.Text),
        ),
        SizedBox(
          height: 10.h,
        ),
        isLoading
            ? const NearbyRestaurantShimmerWidget()
            : popularRestuarants.isEmpty
                ? Center(child: Text('No Restaurant available', style: TextStyle(
              fontSize: 32.sp, fontWeight: FontWeight.w600, color: Tcolor.Text),
        ),)
                : SizedBox(
                    height: 310.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(popularRestuarants.length, (i) {
                        var restaurant = popularRestuarants[i];
                        return RestaurantWidget(
                          restaurant: restaurant,
                        );
                      }),
                    ),
                  ),
      ],
    );
  }
}
