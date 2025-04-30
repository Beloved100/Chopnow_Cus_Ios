
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutRow extends StatelessWidget {
  const CheckoutRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Tcolor.BACKGROUND_Regaular,
      height: 100.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReuseableText(
              title: "Order summary",
              style: TextStyle(
                  fontSize: 28.sp,
                  color: Tcolor.Text,
                  fontWeight: FontWeight.w500),
            ), 
            ReuseableText(
              title: "Clear cart",
              style: TextStyle(
                  fontSize: 28.sp,
                  color: Tcolor.ERROR_Reg,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
