// shimmer_food_tile.dart
import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AddressShimmer extends StatelessWidget {
  const AddressShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            addressShimmerRow(),
            SizedBox(
              height: 30.w,
            ),
            addressShimmerRow(),
            SizedBox(
              height: 30.w,
            ),
            addressShimmerRow(),
          ],
        ),
      ),
    );
  }
}

class addressShimmerRow extends StatelessWidget {
  const addressShimmerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: 500.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        SizedBox(
          width: 30.w,
        ),
        // Shimmer for Image
        Container(
          height: 70.h,
          width: 70.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
