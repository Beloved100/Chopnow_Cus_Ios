import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerWidget extends StatelessWidget {
  const CategoryShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.only(right: 30.w),
        padding: EdgeInsets.only(top: 4.h),
        width: width * 0.19,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,  // Use a neutral color as the base
        ),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              height: 70.h,
              width: width / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.grey,  // Use grey as the shimmer effect
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              height: 24.sp, // Match the font size of the text
              width: 100.w, // Adjust width as needed
              color: Colors.grey,  // Placeholder color
            ),
          ],
        ),
      ),
    );
  }
}
