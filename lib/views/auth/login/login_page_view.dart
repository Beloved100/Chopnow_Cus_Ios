
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/login_controller.dart';
import 'package:chopnow/views/auth/login/login_page.dart';
import 'package:chopnow/views/auth/login/widget/pin_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final PageController _pageController = PageController();
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                    LoginPage(next: () {
                         _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),  // Reduced duration
                          curve: Curves.easeIn,
                        );
                      
                    }),
                    const LoginPinPage()
                  ],
                ),
              )
            ],
          ),
        ),
        Obx(() {
                if (controller.isLoading) {
                  return Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.5), // Dim background
                      child: Center(
                        child: LottieBuilder.asset(
                          'assets/animation/loading_state.json', // Replace with your Lottie file path
                          width: 200.w,
                          height: 200.h,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
      ],
    );
  }
}
