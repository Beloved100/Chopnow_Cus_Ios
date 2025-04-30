import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/views/onboarding/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DeleteAccountController extends GetxController {
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
          print(" pin verified: ${response.statusCode}");
          clearPin();
          setLoading = true;
          String accessToken = box.read("token");

          var url = Uri.parse("$appBaseUrl/api/users/deleteUser/$userID");
          Map<String, String> headers = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken'
          };
          try {
            var response = await http.delete(
              url,
              headers: headers,
            );
            if (response.statusCode == 200) {
              setLoading = false;
              Get.snackbar("Account Deleted",
                  "Bon appétit! Get ready to savor tasty treats with us.",
                  colorText: Tcolor.Text,
                  duration: const Duration(seconds: 2),
                  backgroundColor: Tcolor.Primary,
                  icon: const Icon(Ionicons.fast_food_outline));
              box.erase();
              Get.offAll(
                () => NextScreen(),
                transition: Transition.fade,
                duration: const Duration(milliseconds: 700),
              );
            } else {
              var error = apiErrorFromJson(response.body);
              Get.snackbar("Creating Order Unsuccessful", error.message,
                  colorText: Tcolor.White,
                  duration: const Duration(seconds: 3),
                  backgroundColor: Tcolor.ERROR_Light_1,
                  icon: const Icon(Icons.error_outline));
              print(error.message);
            }
          } catch (e) {
            debugPrint(e.toString());
          } finally {
            setLoading = false;
          }
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
}
