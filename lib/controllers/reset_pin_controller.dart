// ignore_for_file: prefer_final_fields

import 'dart:convert';


import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/enty_point.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ResetPinController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }
  // Text Controllers

  final TextEditingController phoneNumberController = TextEditingController();

  // Observables
  var isFormFilled = false.obs;

  // Dispose controllers
  @override
  void onClose() {
    phoneNumberController.dispose();

    super.onClose();
  }

  // Validate form
  void validateForm() {
    if (phoneNumberController.text.isNotEmpty) {
      isFormFilled.value = true;
    } else {
      isFormFilled.value = false;
    }
  }

  var pin = ''.obs;

  void handleKeyPress(String value) {
    if (pin.value.length < 4) {
      pin.value += value;
      if (pin.value.length == 4) {
        submitPin(); // Automatically submit when 4 digits are entered
      }
    }
  }

  void clearPin() {
    pin.value = '';
  }

  void submitPin() {
    if (pin.value.length == 4) {
      // PIN is complete, handle the submission
      Get.offAll(() => const MainScreen(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 700));

      // Perform your submission logic here, e.g., API call or navigation
    } else {
      // PIN is not complete, show an error or warning
      print("PIN must be 4 digits");
    }
  }

  void requestOtp(Function onSuccess) async {
    setLoading = true;
    Uri url = Uri.parse(
        "$appBaseUrl/api/users/forgot-pin/${phoneNumberController.text}");

    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var user = responseData['user'];

        // Save data to GetStorage
        box.write('userID', user['id']);
        box.write('firstName', user['first_name']);
        box.write('lastName', user['last_name']);
        box.write('email', user['email']);
        box.write('phone', user['phone']);

        onSuccess();
        Get.snackbar(
          "",
          "",
          titleText: ReuseableText(
            title: "One time Pin",
            style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
                color: Tcolor.Text),
          ),
          messageText: ReuseableText(
            title: "One time Pin sent to you phone",
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: Tcolor.TEXT_Placeholder),
          ),

        );
        setLoading = false;
      } else {
        var error = apiErrorFromJson(response.body);
        Get.defaultDialog(
          backgroundColor: Tcolor.White,
          title: "Failed to send One time pin",
          titleStyle: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
              color: Tcolor.TEXT_Placeholder),
          middleText: error.message,
          middleTextStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: Tcolor.TEXT_Label),
          textConfirm: "OK",
          onConfirm: () {
            Get.back();
          },
          barrierDismissible: false,
          confirmTextColor: Tcolor.Text,
          buttonColor: Tcolor.TEXT_Label,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
