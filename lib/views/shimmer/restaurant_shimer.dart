import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


class NearbyRestaurantShimmerWidget extends StatelessWidget {
  const NearbyRestaurantShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            SizedBox(
              height: 310.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Number of shimmer items
                itemBuilder: (context, index) => _buildShimmerItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      padding: const EdgeInsets.all(5),
      width: 400.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              height: 100.h,
              width: double.infinity,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 210.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 24.sp,
                  width: 150.w,
                  color: Colors.grey,
                ),
                SizedBox(height: 7.h),
                Padding(
                  padding: EdgeInsets.only(right: 10.h),
                  child: Wrap(
                    spacing: 10.w,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 5.h,
                    children: [
                      Container(
                        height: 24.sp,
                        width: 60.w,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        height: 24.sp,
                        width: 60.w,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 44.h,
                width: 98.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.grey,
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 40.sp,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 24.sp,
                      width: 40.w,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
