// ignore_for_file: must_be_immutable


import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.category,
  });

  CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 30.w),
        padding: EdgeInsets.only(top: 4.h),
        width: width * 0.19,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Tcolor.SECONDARY_T2),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 70.h,
              width: width / 1.5,
              child: Image.network(
                category.imageUrl,
                fit: BoxFit.contain,
              ),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(20.r),
              //   color: Tcolor.Primary,
              // ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ReuseableText(
              title: category.title,
              style: TextStyle(
                  fontSize: 24.sp,
                  color: Tcolor.Text,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
