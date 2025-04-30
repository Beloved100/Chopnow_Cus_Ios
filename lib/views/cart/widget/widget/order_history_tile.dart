import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:chopnow/models/single_restaurant_model.dart';
import 'package:chopnow/views/cart/widget/widget/order_history_rstaurant_name.dart';
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

// String hourTime(String dateStr) {
//   DateTime dateTime = DateTime.parse(dateStr).toLocal();
//   DateFormat outputFormat = DateFormat('h:mm a', 'en_US');
//   return outputFormat.format(dateTime);
// }

class OrderHistoryTile extends HookWidget {
  const OrderHistoryTile({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final restaurant = useState<SingleRestaurantModel?>(null);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProcessingOrder(order: order));
      },
      child: Container(
        height: 250.h,
        width: width,
        color: Tcolor.White,
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
        
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: OrderRestaurantName(
                      order: order,
                      onRestaurantFetched: (fetchedRestaurant) {
                        WidgetsBinding.instance.addPostFrameCallback((__) {
                          restaurant.value = fetchedRestaurant;
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      ReuseableText(
                        title: "Order ID: ",
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: Tcolor.TEXT_Label),
                      ),
                      SizedBox(
                        width: 100.w,
                        child: ReuseableText(
                          title: "${order.orderSubId}", 
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: Tcolor.Text),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              
              SizedBox(height: 30.h),
              if (order.orderStatus == "Cancelled")
                ReuseableText(
                  title: "Your order was cancelled",
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: Tcolor.Text),
                ),
              if (order.orderStatus == "Delivered")
                ReuseableText(
                  title: "Order delivered",
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: Tcolor.Text),
                ),
              SizedBox(
                height: 20.h,
              ),
              ReuseableText(
                title: formatDate(order.createdAt.toString()),
                style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500,
                    color: Tcolor.TEXT_Label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
