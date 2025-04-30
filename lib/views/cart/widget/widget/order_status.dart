import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (order.orderStatus == "Placed")
          ReuseableText(
            title: "Processing order",
            style: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.w500,
                color: Tcolor.Text),
          ),
        if (order.orderStatus == "Accepted")
          ReuseableText(
            title: "Accepted by Restaurant",
            style: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.w500,
                color: Tcolor.Text),
          ),
        if (order.orderStatus == "Preparing")
          ReuseableText(
            title: "Preparing Order",
            style: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.w500,
                color: Tcolor.Text),
          ),
        if (order.orderStatus == "Out_For_Delivery")
          ReuseableText(
            title: "Handed over to rider",
            style: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.w500,
                color: Tcolor.Text),
          ),
          if (order.orderStatus == "Delivered")
          ReuseableText(
            title: "Order Completed",
            style: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.w500,
                color: Tcolor.Text),
          ),
          if (order.orderStatus == "Cancelled")
          ReuseableText(
            title: "Order Rejected",
            style: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.w500,
                color: Tcolor.Text),
          ),
      ],
    );
  }
}
