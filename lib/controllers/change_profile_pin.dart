// ignore_for_file: unused_element

import 'dart:convert';

import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/views/profile/widget/confim_profile_pin.dart';
import 'package:chopnow/views/profile/widget/profile_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ChangeProfilePin extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  var pin1 = ''.obs;
  var pin2 = ''.obs;
  var pin = ''.obs;

  void handleKeyPress(String value, BuildContext context) {
    if (pin.value.length < 4) {
      pin.value += value;
      if (pin.value.length == 4) {
        submitPin(context); // Pass context to submitPin1
      }
    }
  }

  void handleKeyPress1(String value, BuildContext context) {
    if (pin1.value.length < 4) {
      pin1.value += value;
      if (pin1.value.length == 4) {
        submitPin1(context); // Pass context to submitPin1
      }
    }
  }

  void handleKeyPress2(String value, BuildContext context) {
    if (pin2.value.length < 4) {
      pin2.value += value;
      if (pin1.value.length == 4) {
        submitPin2(context);
      }
    }
  }

  void clearPin() {
    pin.value = '';
  }

  void clearPin1() {
    pin1.value = '';
  }

  void clearPin2() {
    pin2.value = '';
  }

  void submitPin(BuildContext context) async {
    if (pin.value.length == 4) {
      setLoading = true;
      final accessToken = box.read("token");
      var userID = box.read('userId');
      print(userID);

      var url =
          Uri.parse("$appBaseUrl/api/users/verifyPin/$userID/${pin.value}");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };
      try {
        var response = await http.post(url, headers: headers);
        if (response.statusCode == 200) {
          // Navigator.pop(context);
          print(response.statusCode);
          clearPin();
          Navigator.of(context).pop();
          showModalBottomSheet(
            backgroundColor: Tcolor.White,
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
            ),
            builder: (BuildContext context) => const EditProfilePin(),
          );
          setLoading = false;
        } else {
          var error = apiErrorFromJson(response.body);
          Get.snackbar(
            "Wrong Pin",
            error.message,
            colorText: Tcolor.White,
            duration: const Duration(seconds: 3),
            backgroundColor: Tcolor.ERROR_Reg,
            icon: const Icon(Icons.error_outline),
          );
          clearPin();
        setLoading = false;
          print(error.message);
        }
      } catch (e) {
        debugPrint(e.toString());
        Get.snackbar(
          "Error",
          "An error occurred. Please try again.",
          colorText: Tcolor.White,
          duration: const Duration(seconds: 3),
          backgroundColor: Tcolor.ERROR_Reg,
          icon: const Icon(Icons.error_outline),
        );
        clearPin();
        setLoading = false;
      } finally {
        setLoading = false;
      }
    }
  }

  void submitPin1(BuildContext context) async {
    if (pin1.value.length == 4) {
      setLoading = true;
      setLoading = false;
      Navigator.of(context).pop();
      showModalBottomSheet(
        // backgroundColor: Tcolor.White,
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
        ),
        builder: (BuildContext context) => const ConfirmProfilePage(),
      );
    }
  }

  void submitPin2(BuildContext context) async {
    // Handle PIN 2 submission logic here
    if (pin2.value.length == 4) {
      if (pin1.value == pin2.value) {
        setLoading = true;

        // Retrieve user data from storage
        var userID = box.read('userId');

        var url =
          Uri.parse("$appBaseUrl/api/users/changePin/$userID/${pin2.value}");
        Map<String, String> headers = {'Content-Type': 'application/json'};

        try {
          var response = await http.put(url, headers: headers);
          if (response.statusCode == 201) {
            print("pin changed");
            print(response.statusCode);
            clearPin2();
             Get.back();
            
            
            setLoading = false;
          } else {
            var error = apiErrorFromJson(response.body);
            print(error.message);
            clearPin2();

            setLoading = false;
          }
        } catch (e) {
          clearPin2();
          debugPrint(e.toString());
          setLoading = false;
        }
      }
    } else {
      
    }
  }
}
