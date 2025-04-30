
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/hooks/fetch_resaurant.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:chopnow/views/home/widgets/sub_widgets/nearby_restaurant.dart';
import 'package:chopnow/views/shimmer/restaurant_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NearbyRestaurant extends HookWidget {
  const NearbyRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurants("241105");
    final List<RestaurantModel>? restaurantList = hookResult.data ?? [];
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReuseableText(
          title: "Nearby Restaurants",
          style: TextStyle(
              fontSize: 32.sp, fontWeight: FontWeight.w600, color: Tcolor.Text),
        ),
        SizedBox(height: 20.h,),
        isLoading ? const NearbyRestaurantShimmerWidget() : SizedBox(
          height: 310.h,
          // padding: EdgeInsets.only(left: 12.w, top: 10.h),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(restaurantList!.length, (i) {
              RestaurantModel restaurant = restaurantList[i];
              return NearbyRestaurantWidget(restaurant: restaurant,
                
              );
            }),
          ),
        ),
      ],
    );
  }
}
