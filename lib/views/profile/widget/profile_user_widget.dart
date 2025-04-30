
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileUserWidget extends StatelessWidget {
  const ProfileUserWidget({
    super.key, required this.image, required this.title, required this.phone,
  });

  final String image;
  final String title;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: width,
      color: Tcolor.SECONDARY_T2,
      child: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              height: 150.h,
              width: 300.w,
              child: Image.asset(
                image,
               
                height: 50.h,
                width: 100.w,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ReuseableText(
              title: title,
           
              style: TextStyle(
                  color: Tcolor.Text,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10.h,
            ),
            ReuseableText(
              title: phone,
              
              style: TextStyle(
                  color: Tcolor.Text,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
