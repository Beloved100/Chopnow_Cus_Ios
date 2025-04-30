// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/payout_response_model.dart';
import 'package:chopnow/models/single_restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RatingController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;
  final RxBool showRatingSubmitted = false.obs;
  final RxBool showRatingRatingSubmitted = false.obs;

  final RxBool showOrderRatingButton = true.obs;
  final RxBool showRiderRatingButton = true.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void addRating(String data, BuildContext context) async {
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse("$appBaseUrl/api/rating");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 201) {
        setLoading = false;
        Get.snackbar(
          "Rating submitted Successfully",
          "Bon appétit! Get ready to savor tasty treats with us.",
          colorText: Tcolor.Text,
          duration: const Duration(seconds: 2),
          backgroundColor: Tcolor.Primary_New,
          icon: const Icon(Ionicons.fast_food_outline),
        );
        showOrderRatingButton.value = false;
        showRatingSubmitted.value = true;
        Navigator.of(context).pop();
      } else {
        setLoading = false;
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Process Unsuccessful", error.message,
            colorText: Tcolor.White,
            duration: const Duration(seconds: 2),
            backgroundColor: Tcolor.ERROR_Reg,
            icon: const Icon(Icons.error_outline));

            Navigator.of(context).pop();
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }


   void addRiderRating(String data, BuildContext context) async {
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse("$appBaseUrl/api/rider_rating/rider-rating/${box.read("fcm")}");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    
    try {
      var response = await http.post(url, headers: headers, body: data);
      print(response.body);
      if (response.statusCode == 201) {
        setLoading = false;
        Get.snackbar(
          "Rating submitted Successfully",
          "Bon appétit! Get ready to savor tasty treats with us.",
          colorText: Tcolor.Text,
          duration: const Duration(seconds: 2),
          backgroundColor: Tcolor.Primary_New,
          icon: const Icon(Ionicons.fast_food_outline),
        );
        showRiderRatingButton.value = false;
        showRatingRatingSubmitted.value = true;
        Navigator.of(context).pop();
      } else {
        setLoading = false;
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Process Unsuccessful", error.message,
            colorText: Tcolor.White,
            duration: const Duration(seconds: 2),
            backgroundColor: Tcolor.ERROR_Reg,
            icon: const Icon(Icons.error_outline));

            Navigator.of(context).pop();
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }

  Future<SingleRestaurantModel> fetchResturant(String id) async {
    setLoading = true;

    var url = Uri.parse("$appBaseUrl/api/restaurant/byId/$id");

    try {
      var response = await http.get(url);
        // print("Response Body: ${response.body}"); // Add this line to see the raw response

      if (response.statusCode == 200) {
        setLoading = false;

        var data =
            json.decode(response.body); // Assuming the API response is JSON
        if (data == null || data.isEmpty) {
          throw Exception('Empty or null response data');
        }
        return SingleRestaurantModel.fromJson(
            data); // Return a single restaurant model
      } else {
        var error = apiErrorFromJson(response.body);
        print(error);
        setLoading = true;
      }
    } catch (e) {
      debugPrint(e.toString());
      setLoading = false;
    } finally {
      setLoading = false;
    }
    throw Exception('Failed to fetch restaurant');
  }

   Future<PayoutResponseModel> riderPayout(String data) async {
    setLoading = true;

    Uri url = Uri.parse("$payoutUrl/delivery-payout");
    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, headers: headers, body: data);
      print(response.body);
      if (response.statusCode == 200) {
        PayoutResponseModel responseData =
            payoutResponseModelFromJson(response.body);
        setLoading = false;
        return responseData;
      } else {
        var error = jsonDecode(response.body);
        Get.defaultDialog(
          backgroundColor: Tcolor.White,
          title: "Error",
          titleStyle: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
              color: Tcolor.TEXT_Placeholder),
          middleText: "something went wrong",
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
      Get.defaultDialog(
        backgroundColor: Tcolor.White,
        title: "error",
        titleStyle: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w600,
            color: Tcolor.TEXT_Placeholder),
        middleText: "something went wrong",
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
    throw Exception('Payout Failed');
  }

}
