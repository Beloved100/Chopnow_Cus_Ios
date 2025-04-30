import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class Pickup extends StatelessWidget {
  const Pickup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 1400.h,
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child:  Column(
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
                    title: "Pick-Up Delivery",
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w700,
                        color: Tcolor.Text),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ReuseableText(
                    title: "Follow these easy steps:",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: Tcolor.TEXT_Body,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      ReuseableText(
                        title: "1.",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w400,
                          color: Tcolor.TEXT_Body,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: ReuseableText(
                          title:
                              "Select a restaurant from the app’s home screen  ",
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w400,
                            color: Tcolor.TEXT_Body,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 34.h),
                    child: ReuseableText(
                      title: "or search for your favorite spot.",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w400,
                        color: Tcolor.TEXT_Body,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      ReuseableText(
                        title: "2.",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w400,
                          color: Tcolor.TEXT_Body,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: ReuseableText(
                          title:
                              "Select Your Items: Browse the restaurant's menu",
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w400,
                            color: Tcolor.TEXT_Body,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.h),
                    child: ReuseableText(
                      title: "and select the items you'd like to order.",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w400,
                        color: Tcolor.TEXT_Body,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      ReuseableText(
                        title: "3.",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w400,
                          color: Tcolor.TEXT_Body,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: ReuseableText(
                          title: 'Add to Cart: Click the “Add to Cart” button.',
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w400,
                            color: Tcolor.TEXT_Body,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35.h),
                    child: ReuseableText(
                      title: 'The item will automatically appear in your cart',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w400,
                        color: Tcolor.TEXT_Body,
                      ),
                    ),
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