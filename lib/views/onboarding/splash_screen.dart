import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/splash_animation.dart';
import 'package:chopnow/views/onboarding/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to NextScreen after 4 seconds
    Future.delayed(const Duration(seconds: 6), () {
      Get.off(() => const NextScreen(),
          transition: Transition.fadeIn, duration: const Duration(milliseconds: 700));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: 700.h, // Adjust the container size to fit the video
          width: 700.w,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(100.r), // Optional: Apply border radius to the container as well
          ),
          child: const VideoAnimation(), // Use the video with the border radius
        ),
      ),
    );
  }
}
