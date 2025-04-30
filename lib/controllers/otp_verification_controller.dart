import 'dart:async';
import 'package:chopnow/views/auth/reset_pin/widget/reset_login_pin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPVerificationController extends GetxController {
  var otp = List.generate(4, (index) => ''.obs).obs;
  var canResend = false.obs;
  var countdown = 60.obs;

  late TextEditingController otp1Controller,
      otp2Controller,
      otp3Controller,
      otp4Controller;
  late List<FocusNode> focusNodes;

  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    otp1Controller = TextEditingController();
    otp2Controller = TextEditingController();
    otp3Controller = TextEditingController();
    otp4Controller = TextEditingController();
    focusNodes = List.generate(4, (_) => FocusNode());
    startTimer();
  }

  @override
  void onClose() {
    otp1Controller.dispose();
    otp2Controller.dispose();
    otp3Controller.dispose();
    otp4Controller.dispose();
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }

  void handleOTPInput(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      otp[index].value = value;
      focusNodes[index + 1].requestFocus();
    } else if (index == 3 && value.isNotEmpty) {
      otp[index].value = value;
      submitOTP();
    }
  }

  void clearOTP() {
    for (var i = 0; i < otp.length; i++) {
      otp[i].value = '';
    }
    otp1Controller.clear();
    otp2Controller.clear();
    otp3Controller.clear();
    otp4Controller.clear();
    focusNodes[0].requestFocus();
  }

  void submitOTP() {
    String fullOTP = otp.map((e) => e.value).join();
    if (fullOTP.length == 4) {
      // Handle OTP submission logic here
      Get.offAll(() => const ResetLoginPinWidget(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 700));
    }
  }

  void startTimer() {
    canResend.value = false;
    countdown.value = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value == 0) {
        canResend.value = true;
        _timer.cancel();
      } else {
        countdown.value--;
      }
    });
  }

  void resendCode() {
    // Logic to resend the code
    startTimer(); // Restart the timer
  }
}
