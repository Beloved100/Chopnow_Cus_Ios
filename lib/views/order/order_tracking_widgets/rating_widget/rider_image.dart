import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow/common/capitalized_text.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/hooks/fetch_rider_datails.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:chopnow/models/rider_model.dart';
import 'package:chopnow/models/rider_user_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';


String formatDate(String dateStr) {
  DateTime dateTime = DateTime.parse(dateStr).toLocal();
  DateFormat outputFormat = DateFormat('EEE, d MMM yyyy, h:mm a', 'en_US');
  return outputFormat.format(dateTime);
}

class RiderImage extends HookWidget {
  const RiderImage( {
    super.key,
    required this.order,
    required this.rider_details,
    this.riderUser,
  });

  final OrderModel order;
  final Function(RiderModel) rider_details;
  final RiderUserModel? riderUser;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRiderDetails(order.driverId);
    final RiderModel? rider = hookResult.data;
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;

    if (rider != null) {
      rider_details(rider);
    }

    return isLoading
        ? Container(
            color: Tcolor.White,
          )
        : rider == null
            ? Container(
                color: Tcolor.White,
                child: Center(
                    child: ReuseableText(
                  title: 'No rider image available',
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
                      imageUrl: rider.userImageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ReuseableText(
                  title: "${capitalizeFirstLetter(riderUser?.firstName ?? "")} ${capitalizeFirstLetter(riderUser?.lastName ?? "")}",
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
