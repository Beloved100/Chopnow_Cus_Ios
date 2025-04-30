
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class MakeOrder extends StatelessWidget {
  const MakeOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 1400.h,
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      
      child: Column(
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
                    title: "How to make an order",
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
                          title: "Select a Restaurant: Choose your preferred ",
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
                      title: "restaurant from our list of available options.",
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
                          title: "Select Your Items: Browse the restaurant's menu",
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
                          title: 'Proceed to Payment: Click "Checkout" and select ',
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
                      title: '"Pay with Flutterwave" as your payment method.',
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
                        title: "4.",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w400,
                          color: Tcolor.TEXT_Body,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: ReuseableText(
                          title: "Complete Payment: Enter your payment details and",
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
                      title: "complete the transaction via Flutterwave.",
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
                        title: "5.",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w400,
                          color: Tcolor.TEXT_Body,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: ReuseableText(
                          title: "Order Registered: Your order is now registered and",
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
                      title: "will be processed by the restaurant.",
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
          ),
        ],
      ),
    );
  }
}
