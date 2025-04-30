import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalkThrough1 extends StatelessWidget {
  const WalkThrough1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Tcolor.White,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 110.h,
            // ),
            SizedBox(
              height: 100.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(left: 40.w, right: 40.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r), 
                  child: Image.asset(
                    "assets/img/customer_pg1.png",
                    fit: BoxFit.contain,
                    height: 750.h,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40.w, right: 40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReuseableText(
                    title: "Welcome to",
                    style: TextStyle(
                      color: Tcolor.Text,
                      fontSize: 90.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  ReuseableText(
                    title: "ChopNow!",
                    style: TextStyle(
                      color: Tcolor.Text,
                      fontSize: 90.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ReuseableText(
                    title: "We connect you with your favorite restaurants",
                    style: TextStyle(
                      color: Tcolor.TEXT_Body,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ReuseableText(
                    title: "so you can enjoy a wide variety of meals",
                    style: TextStyle(
                      color: Tcolor.TEXT_Body,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ReuseableText(
                    title: "without ever leaving your couch.",
                    style: TextStyle(
                      color: Tcolor.TEXT_Body,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
