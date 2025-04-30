import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chopnow/views/auth/login/login_page_view.dart';
import 'package:get_storage/get_storage.dart';

class InactivityHandler {
  final box = GetStorage();
  final Duration timeoutDuration;
  Timer? _timer;

  InactivityHandler({required this.timeoutDuration});

  void startTracking() {
    _resetTimer();
  }

  void stopTracking() {
    _timer?.cancel();
  }

   // Reset or initialize the timer
  void _resetTimer() {
    _timer?.cancel(); // Cancel the previous timer if any
    _timer = Timer(timeoutDuration, _logoutUser); // Set a new timer
  }

  void _logoutUser() {
    // Navigate to the login page or log out the user
    box.erase();
    Get.offAll(() => LoginPageView(),
        transition: Transition.rightToLeft,
        duration: const Duration(
            milliseconds: 700)); // Replace with your logout navigation logic
  }

  void onUserInteraction() {
    _resetTimer();
  }

  // Cancel the timer when not needed
  void dispose() {
    _timer?.cancel();
  }
}
