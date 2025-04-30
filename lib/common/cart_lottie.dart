import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CartLottie extends StatelessWidget {
  const CartLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 200.w,
      color: Tcolor.BACKGROUND_Regaular,
      child: LottieBuilder.asset(
        'assets/animation/loading_state.json', // Replace with your Lottie file path
        width: 150.w,
        height: 150.h,
      ),
    );
  }
}
