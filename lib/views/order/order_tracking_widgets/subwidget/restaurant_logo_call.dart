import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/hooks/fetch_restaurant_byId.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:chopnow/models/single_restaurant_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantLogoCall extends HookWidget {
  const RestaurantLogoCall({
    super.key,
    this.order,
    required this.onRestaurantFetched,
  });

  final OrderModel? order;
  final Function(SingleRestaurantModel) onRestaurantFetched;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurantById(order!.restaurantId);
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 55.h,
                        width: 55.w,
                        color: Tcolor.White,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.r)),
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
                  ),
                  GestureDetector(
                    onTap: () async {
                      final Uri phoneUri = Uri.parse("tel:${restaurant.phone}");
                      if (await canLaunchUrl(phoneUri)) {
                        await launchUrl(phoneUri);
                      } else {
                        print("Could not launch call");
                      }
                    },
                    child: Icon(
                      HeroiconsSolid.phone,
                      color: Tcolor.Text,
                      size: 32.sp,
                    ),
                  )
                ],
              );
  }
}
