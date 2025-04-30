import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';


class SuccessLottieWidget extends StatelessWidget {
  const SuccessLottieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 180),
        child: LottieBuilder.asset("assets/animation/successfull_payment.json", width: 300.w , height: 300.h,),
      ),
    );
  }
}