
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/controllers/onboarding_controller.dart';
import 'package:chopnow/views/onboarding/widget/page_indicator.dart';
import 'package:chopnow/views/onboarding/widget/walk_through_1.dart';
import 'package:chopnow/views/onboarding/widget/walk_through_2.dart';
import 'package:chopnow/views/onboarding/widget/walk_through_3.dart';
import 'package:chopnow/views/onboarding/widget/walk_through_4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Get.to(() => const OnboardingCompletionBottomSheet());
      showModalBottomSheet(
              context: context,
              isScrollControlled: true, // Optional: Controls if the bottom sheet can scroll
              backgroundColor: Colors.transparent,
              enableDrag: false,
              isDismissible: false, // Optional: Makes the background transparent
              
              builder: (context) => const OnboardingCompletionBottomSheet(), // Show the bottom sheet content
            );
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              WalkThrough1(),
              WalkThrough2(),
              WalkThrough3(),
            ],
          ),
          Positioned(
            left: 32.w,
            bottom: 70.h,
            child: PageIndicator(currentPage: _currentPage, pageCount: 3),
          ),
          Positioned(
            right: 50.w,
            bottom: 40.h,
            child: CustomButton(
              title: "Get choppin’",
              btnWidth: 300.w,
              btnHeight: 80.h,
              raduis: 50.r,
              btnColor: onboardingController.getButtonColor(_currentPage),
              showArrow: true,
              textColor: onboardingController.getButtonTextColor(_currentPage),
              fontSize: 30.sp,
              arrowColor: onboardingController.getArrowColor(_currentPage),
              onTap: _nextPage,
              
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
