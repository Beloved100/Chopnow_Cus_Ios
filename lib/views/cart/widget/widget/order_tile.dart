import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:chopnow/models/single_restaurant_model.dart';
import 'package:chopnow/views/cart/widget/widget/order_restaurant_namelogo.dart';
import 'package:chopnow/views/cart/widget/widget/order_tracking_images.dart';
import 'package:chopnow/views/order/widget/track_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String formatDate(String dateStr) {
  DateTime dateTime = DateTime.parse(dateStr).toLocal();
  DateFormat outputFormat = DateFormat('EEE, d MMM yyyy, h:mm a', 'en_US');
  return outputFormat.format(dateTime);
}

String hourTime(String dateStr) {
  DateTime dateTime = DateTime.parse(dateStr).toLocal();
  DateFormat outputFormat = DateFormat('h:mm a', 'en_US');
  return outputFormat.format(dateTime);
}

class OrderTile extends HookWidget {
  const OrderTile({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final restaurant = useState<SingleRestaurantModel?>(null);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProcessingOrder(order: order,));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 30.h, bottom: 5.h),
        child: Container(
          height: 300.h,
          width: width,
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
          decoration: BoxDecoration(
            color: Tcolor.White,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.zero,
                      child: OrderRestaurantLogoName(
                        order: order,
                        onRestaurantFetched: (fetchedRestaurant) {
                          WidgetsBinding.instance.addPostFrameCallback((__) {
                            restaurant.value = fetchedRestaurant;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (order.orderStatus == "Placed")
                            ReuseableText(
                              title: "Processing Payment",
                              style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Tcolor.Text),
                            ),
                          if (order.orderStatus == "Accepted")
                            ReuseableText(
                              title: "Accepted by Restaurant",
                              style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Tcolor.Text),
                            ),
                          if (order.orderStatus == "Preparing")
                            ReuseableText(
                              title: "Preparing Order",
                              style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Tcolor.Text),
                            ),
                            if (order.orderStatus == "Out_For_Delivery")
                            ReuseableText(
                              title: "Handed over to rider",
                              style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Tcolor.Text),
                            ),
                          ReuseableText(
                            title: hourTime(order.createdAt.toString()),
                            style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                                color: Tcolor.TEXT_Label),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      OrderTrackingImages(order: order,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
