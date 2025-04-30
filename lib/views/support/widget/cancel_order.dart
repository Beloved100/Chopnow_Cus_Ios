import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class CancelOrder extends StatelessWidget {
  const CancelOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 1400.h,
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: Tcolor.BACKGROUND_Dark,
                  borderRadius: BorderRadius.circular(60.r),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      HeroiconsOutline.xMark,
                      color: Tcolor.Text,
                      size: 32.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Container(
            height: 1000.h,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  ReuseableText(
                    title: "Can I cancel an order?",
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w700,
                        color: Tcolor.Text),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}