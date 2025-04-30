import 'dart:convert';

import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/account_creation_success_model.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/views/auth/create_account/widget/otp_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class CreateAccountController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  // Text Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  var errorMessage = ''.obs;
  var phoneNumber = ''.obs;

  // Observables
  var isFormFilled = false.obs;

  // Dispose controllers
  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.onClose();
  }

  // Validate form
  void validateForm() {
    isFormFilled.value = firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        errorMessage.value.isEmpty;
  }

  @override
  void onInit() {
    super.onInit();
    firstNameController
        .addListener(validateForm); // Call validateForm on first name change
    lastNameController
        .addListener(validateForm); // Call validateForm on last name change
    emailController
        .addListener(validateForm); // Call validateForm on email change
    phoneNumberController.addListener(() {
      phoneNumber.value = phoneNumberController.text;
      validateForm(); // Call validateForm on phone number change
    });

    debounce(phoneNumber, (_) => checkPhoneNumber(phoneNumberController.text),
        time: const Duration(milliseconds: 100));
    errorMessage.listen((_) {
      validateForm(); // Call validateForm whenever errorMessage changes
    });
  }

  Future<void> checkPhoneNumber(String phone) async {
    final response = await http.post(
      Uri.parse(
          '$appBaseUrl/verify-phone/$phone'), // Update with your backend URL
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': phone,
      }),
    );

    if (response.statusCode == 400 || response.statusCode == 404) {
      print(response.body);
      final responseData = jsonDecode(response.body);
      errorMessage.value = responseData['message'];
    } else {
      errorMessage.value = '';
    }

    validateForm(); // Ensure this is called after updating the errorMessage
  }

  void createAccountFunction(String data) async {
    setLoading = true;

    Uri url = Uri.parse("$appBaseUrl/create-account");

    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      // Get FCM Token
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? fcm = await messaging.getToken();
      print("FCM Token: $fcm");

      if (fcm == null) {
        print("Error: Unable to get FCM Token");
        return;
      }

      // Convert JSON data to Map
      Map<String, dynamic> requestData = jsonDecode(data);
      requestData['fcm'] = fcm; // Add FCM token to request body
      var response =
          await http.post(url, headers: headers, body: jsonEncode(requestData));
      print(response.body);
      if (response.statusCode == 201) {
        var responseData = jsonDecode(response.body);
        var user = responseData['user'];

        AccountCreationSuccessModel data =
            accountCreationSuccessModelFromJson(response.body);

        // Save data to GetStorage
        box.write('userID', user['id']);
        box.write('firstName', user['first_name']);
        box.write('lastName', user['last_name']);
        box.write('email', user['email']);
        box.write('phone', user['phone']);
        box.write('fcm', fcm);
        box.write('price', user['price']);

        box.write('serviceCharge', data.serviceCharge);
        box.write('minLat', data.others.minLat);
        box.write('maxLat', data.others.maxLat);
        box.write('minLng', data.others.minLng);
        box.write('maxLng', data.others.maxLng);

        print(box.read("price"));
        print(box.read("serviceCharge"));
        print(box.read("minLat"));
        print(box.read("maxLat"));
        print(box.read("minLng"));
        print(box.read("maxLng"));

        setLoading = false;
        String number = box.read("phone");

        Get.to(() => OTPPage(
              phoneNumber: number,
            ));
      } else {
        setLoading = false;
        var error = apiErrorFromJson(response.body);
        Get.defaultDialog(
          backgroundColor: Tcolor.White,
          title: "Account Creation Failed",
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
      setLoading = false;
      debugPrint(e.toString());
    }
  }
}
