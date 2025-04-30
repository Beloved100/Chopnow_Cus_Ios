import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class RiderDetails extends HookWidget {
  const RiderDetails(   {super.key, required this.order, this.riderName, this.color, this.onTap,});
  final OrderModel order;
  final String? riderName;
  final Color? color;
  final Function()? onTap; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                height: 55.h,
                width: 55.w,
                decoration: BoxDecoration(
                    gradient: Tcolor.SECONDARY_Button_gradient,
                    borderRadius: BorderRadius.circular(100.r)),
                child: Icon(
                  HeroiconsSolid.computerDesktop,
                  size: 28.sp,
                  color: Tcolor.White,
                )),
            SizedBox(
              width: 20.w,
            ),

            if(order.driverId.isEmpty)
            Container(
              color: Tcolor.BORDER_Light,
              height: 5.h,
              width: 30.w,
            ),

            if(order.driverId.isNotEmpty)
            SizedBox(
              child: ReuseableText(
                title: riderName!,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30.sp,
                    color: Tcolor.Text),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 60.h,
            width: 60.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.h),
                border: Border.all(color: Tcolor.BORDER_Light), // Updated radius
                color: Tcolor.White),
            child: Icon(
              HeroiconsSolid.phone,
              color: color,
              size: 28.sp,
            ),
          ),
        ),
      ],
    );
  }
}
