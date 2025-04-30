import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/hooks/fetch_restaurant_byId.dart';
import 'package:chopnow/models/single_order.dart';
import 'package:chopnow/models/single_restaurant_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';


String formatDate(String dateStr) {
  DateTime dateTime = DateTime.parse(dateStr).toLocal();
  DateFormat outputFormat = DateFormat('EEE, d MMM yyyy, h:mm a', 'en_US');
  return outputFormat.format(dateTime);
}

class RestaurantLogo1 extends HookWidget {
  const RestaurantLogo1({
    super.key,
    required this.order,
    required this.onRestaurantFetched,
  });

  final SingleOrder order;
  final Function(SingleRestaurantModel) onRestaurantFetched;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurantById(order.restaurantId);
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
            : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
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
                  height: 10.h,
                ),
                ReuseableText(
                  title: restaurant.title,
                  style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w500,
                      color: Tcolor.Text),
                ),
                SizedBox(
                  height: 10.h,
                ),

                ReuseableText(
                  title: formatDate(order.updatedAt.toString()),
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: Tcolor.  TEXT_Label),
                ),
                  
              ],
            );
  }
}
