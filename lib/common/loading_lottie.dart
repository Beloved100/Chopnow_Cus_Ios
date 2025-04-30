import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Tcolor.White,
      child: LottieBuilder.asset(
        'assets/animation/loading_state.json', // Replace with your Lottie file path
        width: 150.w,
        height: 150.h,
      ),
    );
  }
}
