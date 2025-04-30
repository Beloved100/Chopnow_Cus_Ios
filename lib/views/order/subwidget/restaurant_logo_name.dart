import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/hooks/fetch_restaurant_byId.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/single_restaurant_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantLogoName extends HookWidget {
  const RestaurantLogoName({
    super.key,
    this.food,
    required this.onRestaurantFetched,
  });

  final FoodModel? food;
  final Function(SingleRestaurantModel) onRestaurantFetched;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurantById(food!.restaurant);
    final SingleRestaurantModel? restaurant = hookResult.data;
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;

    if (restaurant != null) {
      onRestaurantFetched(restaurant);
    }

    return isLoading
        ? Container(
            color: Tcolor.White,
          )
        : restaurant == null
            ? Container(
                color: Tcolor.White,
                child: Center(
                    child: ReuseableText(
                  title: 'No restaurant logo available',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: Tcolor.Text_Secondary,
                  ),
                )),
              )
            : Row(
                children: [
                  Container(
                    height: 70.h,
                    width: 70.w,
                    color: Tcolor.White,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100.r)),
                      child: CachedNetworkImage(
                        imageUrl: restaurant.logoUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  ReuseableText(
                    title: restaurant.title,
                    style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                        color: Tcolor.Text),
                  )
                ],
              );
  }
}
