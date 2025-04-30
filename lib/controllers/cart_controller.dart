
import 'dart:convert';

import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  final box = GetStorage();

   var food = Rxn<FoodModel>();
  
  var error = Rxn<Exception>();
  var apiError = Rxn<ApiError>();
  var totalCartItem = 0.obs;




  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void addToCart( String cart) async {
    setLoading = true;

    String accessToken = box.read("token");
    var url = Uri.parse("$appBaseUrl/api/cart");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.post(url, headers: headers, body: cart);
      print("Server Response: ${response.body}");
      print("cart Status code: ${response.statusCode}");
      if (response.statusCode == 200) {
        Get.snackbar('Food Added to cart', 'This Food Already exist in your cart.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Tcolor.BACKGROUND_Regaular,
            duration: const Duration(seconds: 5),
            colorText: Tcolor.TEXT_Body,
            icon: Icon(
              HeroiconsOutline.shoppingCart,
              size: 32.sp,
              color: Tcolor.Primary_New,
            ),
        );
      }
      

      if (response.statusCode == 201) {
        setLoading = false;
        print("cart Status code: ${response.statusCode}");



        Get.snackbar('Food Added to cart', 'Enjoy the awesome Experience.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Tcolor.BACKGROUND_Regaular,
            duration: const Duration(seconds: 5),
            colorText: Tcolor.TEXT_Body,
            icon: Icon(
              HeroiconsOutline.shoppingCart,
              size: 32.sp,
              color: Tcolor.Primary_New,
            ),
        );
      } else {
        var error = apiErrorFromJson(response.body);
        print(error.message);
        Get.snackbar('Error', error.message,
            snackPosition: SnackPosition.TOP,
            backgroundColor: Tcolor.ERROR_Light_1,
            duration: const Duration(seconds: 5),
            colorText: Tcolor.TEXT_Body,
            icon: Icon(
              HeroiconsOutline.shoppingCart,
              size: 32.sp,
              color: Tcolor.Primary_New,
            ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }

  void removeFromCart(String productId, Function refetch) async {
    setLoading = true;

    String accessToken = box.read("token");
    var url = Uri.parse("$appBaseUrl/api/cart/$productId");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.delete(url, headers: headers);

      if (response.statusCode == 200) {
        setLoading = false;
        print(response.body);
        // totalCartItem.value = 

        Get.snackbar('Food Removed from cart', 'Enjoy the awesome Experience.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Tcolor.BACKGROUND_Regaular,
            colorText: Tcolor.TEXT_Body,
            icon: Icon(
              HeroiconsOutline.shoppingCart,
              size: 32.sp,
              color: Tcolor.Primary_New,
            ),
        );
        refetch();
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar('Error', error.message,
            snackPosition: SnackPosition.TOP,
            backgroundColor: Tcolor.ERROR_Light_1,
            colorText: Tcolor.TEXT_Body,
            icon: Icon(
              HeroiconsOutline.shoppingCart,
              size: 32.sp,
              color: Tcolor.Primary_New,
            ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }

   Future<FoodModel?> fetchFood(String id) async {
  setLoading = true;
  try {
    final url = Uri.parse("$appBaseUrl/api/food/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var singleFood = jsonDecode(response.body);
      print("useFetchSingleFoods: ${singleFood}");
      food.value = FoodModel.fromJson(singleFood);
      setLoading = false;
      return food.value;  // Return the fetched FoodModel
    } else {
      apiError.value = apiErrorFromJson(response.body);
      return null;
    }
  } catch (e) {
    debugPrint(e.toString());
    error.value = e as Exception;
    return null;
  } finally {
    setLoading = false;
  }
}




}
