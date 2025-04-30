import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

import '../../../common/reusable_text_widget.dart';

class ServiceFee extends StatelessWidget {
  const ServiceFee({super.key});

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
                    title: "What is the Service Fee?",
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w700,
                        color: Tcolor.Text),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ReuseableText(
                    title: "The service fee is a small charge applied to each order",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: Tcolor.TEXT_Body,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ReuseableText(
                    title:
                        "to help maintain app functionality, improve customer ",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: Tcolor.TEXT_Body,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ReuseableText(
                    title: "experience and ensure efficient delivery",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: Tcolor.TEXT_Body,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                   ReuseableText(
                    title: "operations.",
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
                      CircleAvatar(
                        radius: 5.r,
                        backgroundColor: Tcolor.Text,
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Column(
                          children: [
                            ReuseableText(
                              title:
                                  "The fee covers platform maintenance, support",
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w400,
                                color: Tcolor.TEXT_Body,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.h),
                    child: ReuseableText(
                      title: "and app upgrades",
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
                      CircleAvatar(
                        radius: 5.r,
                        backgroundColor: Tcolor.Text,
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Column(
                          children: [
                            ReuseableText(
                              title:
                                  "The service fee is displayed before placing",
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w400,
                                color: Tcolor.TEXT_Body,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.h),
                    child: ReuseableText(
                      title: 'paying foryour order.',
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
        ])
    );
  }
}