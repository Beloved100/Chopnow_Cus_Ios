// shimmer_food_tile.dart
import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFoodTile extends StatelessWidget {
  const ShimmerFoodTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shimmer for Title
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: 200.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    // Shimmer for Description
                    Container(
                      width: width / 2,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Shimmer for Price
                    Container(
                      width: 80.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                    
                
                  ],
                ),
                // Shimmer for Image
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24.r)),
                  child: Container(
                    width: 164.w,
                    height: 164.h,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
