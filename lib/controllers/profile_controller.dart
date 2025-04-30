
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/change_profile_name_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final box = GetStorage();

  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString phone = ''.obs;

  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set setLoading(bool value) {
    _isLoading.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    firstName.value = box.read('first_name') ?? '';
    lastName.value = box.read('last_name') ?? '';
    phone.value = box.read("phone") ?? '';
  }

  Future<void> changeName(
      String id, String first_name, String last_name) async {
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse(
        "$appBaseUrl/api/users/updateUserName/$id/$first_name/$last_name");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      var response = await http.put(url, headers: headers);
      if (response.statusCode == 200) {
        print(response.statusCode);

        // Parse the response body into ChangeProfileName object
        ChangeProfileName data = changeProfileNameFromJson(response.body);

        // Update the reactive variables
        firstName.value = data.updatedUser.firstName;
        lastName.value = data.updatedUser.lastName;

        // Save the updated data to GetStorage
        _saveUserData(data);

        Get.snackbar(
          "Profile name changed Successfully",
          "Bon appétit! Get ready to savor tasty treats with us.",
          colorText: Tcolor.Text,
          duration: const Duration(seconds: 2),
          backgroundColor: Tcolor.Primary,
          icon: const Icon(Ionicons.fast_food_outline),
        );
         Get.back();
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar(
          "Changing Profile name Unsuccessful",
          error.message,
          colorText: Tcolor.White,
          duration: const Duration(seconds: 3),
          backgroundColor: Tcolor.ERROR_Reg,
          icon: const Icon(Icons.error_outline),
        );
        print(error.message);
         Get.back();
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        "Error",
        "An error occurred while changing your profile name. Please try again.",
        colorText: Tcolor.White,
        duration: const Duration(seconds: 3),
        backgroundColor: Tcolor.ERROR_Reg,
        icon: const Icon(Icons.error_outline),
      );
       Get.back();
       setLoading = false;
    } finally {
      setLoading = false;
       Get.back();
    }
  }

  Future<void> changePhone(
      String id, String phone_number) async {
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse(
        "$appBaseUrl/api/users/updateUserName/$id/$phone_number");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      var response = await http.put(url, headers: headers);
      if (response.statusCode == 200) {
        print(response.statusCode);

        // Parse the response body into ChangeProfileName object
        ChangeProfileName data = changeProfileNameFromJson(response.body);

        // Update the reactive variables
        phone.value = data.updatedUser.phone;      

        // Save the updated data to GetStorage
        _saveUserData(data);

        Get.snackbar(
          "Phone number changed Successfully",
          "Bon appétit! Get ready to savor tasty treats with us.",
          colorText: Tcolor.Text,
          duration: const Duration(seconds: 2),
          backgroundColor: Tcolor.Primary,
          icon: const Icon(Ionicons.fast_food_outline),
        );
         Get.back();
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar(
          "Phone number change Unsuccessful",
          error.message,
          colorText: Tcolor.White,
          duration: const Duration(seconds: 3),
          backgroundColor: Tcolor.ERROR_Reg,
          icon: const Icon(Icons.error_outline),
        );
        print(error.message);
         Get.back();
         setLoading = false;
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        "Error",
        "An error occurred while changing your your Phonr number. Please try again.",
        colorText: Tcolor.White,
        duration: const Duration(seconds: 3),
        backgroundColor: Tcolor.ERROR_Reg,
        icon: const Icon(Icons.error_outline),
      );
      Get.back();
    } finally {
      setLoading = false;
      Get.back();
    }
  }

  void _saveUserData(ChangeProfileName data) {
    box.write("verification", data.updatedUser.phoneVerification);
    box.write("first_name", data.updatedUser.firstName);
    box.write("last_name", data.updatedUser.lastName);
    box.write("phone", data.updatedUser.phone);
    box.write("email", data.updatedUser.email);
  }

  Future<void> deleteUser(String id) async {
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse("$appBaseUrl/api/users/deleteUser/$id");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      var response = await http.delete(url, headers: headers,);
      if (response.statusCode == 200) {
        setLoading = false;
        Get.snackbar("Account Deleted",
            "Bon appétit! Get ready to savor tasty treats with us.",
            colorText: Tcolor.Text,
            duration: const Duration(seconds: 2),
            backgroundColor: Tcolor.Primary,
            icon: const Icon(Ionicons.fast_food_outline));
        Get.back();
        
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Something went wrong", error.message,
            colorText: Tcolor.White,
            duration: const Duration(seconds: 3),
            backgroundColor: Tcolor.ERROR_Light_1,
            icon: const Icon(Icons.error_outline));
        print(error.message);
        Get.back();
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.back();
    } finally {
      setLoading = false;
      Get.back();
    }
  }
}
