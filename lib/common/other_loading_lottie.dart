import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OtherLottie extends StatelessWidget {
  const OtherLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 200.w,
      color: Tcolor.White,
      child: LottieBuilder.asset(
        'assets/animation/loading_state.json', // Replace with your Lottie file path
        width: 150.w,
        height: 150.h,
      ),
    );
  }
}
