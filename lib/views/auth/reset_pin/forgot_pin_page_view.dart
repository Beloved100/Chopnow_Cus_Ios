
import 'package:chopnow/views/auth/reset_pin/reset_pin_page.dart';
import 'package:chopnow/views/auth/reset_pin/widget/otp_verification.dart';
import 'package:flutter/material.dart';

import '../../../common/size.dart';

class ForgotPinPageView extends StatefulWidget {
  const ForgotPinPageView({super.key});

  @override
  State<ForgotPinPageView> createState() => _ForgotPinPageViewState();
}

class _ForgotPinPageViewState extends State<ForgotPinPageView> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: height / 1.25,
            width: width,
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              pageSnapping: false,
              children: [
                ResetPinPage(next: () {
                  _pageController.nextPage(
                    duration:
                        const Duration(milliseconds: 300), // Reduced duration
                    curve: Curves.easeIn,
                  );
                }),
                OTPVerificationPage(
                  back: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
