import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/format_price.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
    required this.title,
    required this.price,
    this.color,
  });

  final String title;
  final String price;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReuseableText(
          title: title,
          style: TextStyle(
              fontSize: 28.sp,
              color: color ?? Tcolor.TEXT_Label,
              fontWeight: FontWeight.w500),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "₦",
              style: TextStyle(
                color: Tcolor.Text,
                fontWeight: FontWeight.w400,
                fontSize: 25.sp,
                decoration: TextDecoration.none,
              ),
            ),
            ReuseableText(
              title: formatPrice(price),
              style: TextStyle(
                  fontSize: 28.sp,
                  color: color ?? Tcolor.TEXT_Body,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
