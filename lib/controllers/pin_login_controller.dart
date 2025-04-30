// ignore_for_file: prefer_final_fields

import 'dart:convert';


import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/set_pin_model.dart';
import 'package:chopnow/views/auth/create_account/widget/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PinLoginController extends GetxController {
  final box = GetStorage();

  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
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

  Future<void> submitPin() async {
    
    if (pin.value.length == 4) {
      // PIN is complete, handle the submission
            // Get.offAll(() => const Location(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 700));

      // Perform your submission logic here, e.g., API call or navigation
      setLoading = true;

      // Retrieve user data from storage
      var userID = box.read('userID');
      var data = jsonEncode({
        'user_id': userID,
        
      });

      Uri url = Uri.parse("$appBaseUrl/set-pin/$userID/${pin.value}");
      Map<String, String> headers = {'Content-Type': 'application/json'};

      try {
        var response = await http.post(url, headers: headers, body: data);
        if (response.statusCode == 201) {
          SetPinResponseModel responseData = setPinResponseModelFromJson(response.body);

          
          String userData = jsonEncode(responseData);

          
          box.write("token", responseData.token);
          
          setLoading = false;

          Get.offAll(() => const Location(), transition: Transition.fade, duration: const Duration(milliseconds: 700));
          
        } else {
          var error = apiErrorFromJson(response.body);
          Get.defaultDialog(
            backgroundColor: Tcolor.White,
            title: "Verification Failed",
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
          setLoading = false;
        }
      } catch (e) {
        debugPrint(e.toString());
        setLoading = false;
      }
    }
  }
    } 
