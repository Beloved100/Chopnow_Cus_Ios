import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/enty_point.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AddressController extends GetxController {
  final box = GetStorage();
   RxString selectedAddress = ''.obs; // Add this line
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

    void updateSelectedAddress(String newAddress) {
    selectedAddress.value = newAddress;
    box.write('defaultAdd', newAddress); // Save to persistent storage
  }

  void addAddress(String data) async {
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse("$appBaseUrl/api/address");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 201) {
        setLoading = false;
        Get.snackbar("Address submitted Successfully",
            "Bon appétit! Get ready to savor tasty treats with us.",
            colorText: Tcolor.Text,
            duration: const Duration(seconds: 2),
            backgroundColor: Tcolor.Primary,
            icon: const Icon(Ionicons.fast_food_outline));
        print(response.body);

        Get.to(() => MainScreen());
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Process Unsuccessful", error.message,
            colorText: Tcolor.White,
            duration: const Duration(seconds: 2),
            backgroundColor: Tcolor.ERROR_Reg,
            icon: const Icon(Icons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }

  void addAddressProfile(String data, Function refetch, context) async {
  setLoading = true;
  String accessToken = box.read("token");

  var url = Uri.parse("$appBaseUrl/api/address");
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken'
  };
  try {
    var response = await http.post(url, headers: headers, body: data);
    if (response.statusCode == 201) {
      setLoading = false;

      Get.snackbar("Address submitted Successfully", "Address Added Successfully.",
          colorText: Tcolor.Text,
          duration: const Duration(seconds: 2),
          backgroundColor: Tcolor.Primary,
          icon: const Icon(Ionicons.fast_food_outline));

      refetch();
       Navigator.of(context).pop();
      //  box.write(d, value)

      // Get.off(() => const MainScreen(), arguments: 4);
    } else {
      var error = apiErrorFromJson(response.body);
      Get.snackbar("Process Unsuccessful", error.message,
          colorText: Tcolor.White,
          duration: const Duration(seconds: 2),
          backgroundColor: Tcolor.ERROR_Reg,
          icon: const Icon(Icons.error_outline));
    }
  } catch (e) {
    debugPrint(e.toString());
  } finally {
    setLoading = false;
  }
}


  void deleeAddress(String addressId, Function refetch) async {
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse("$appBaseUrl/api/address/$addressId");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      var response = await http.delete(url, headers: headers);
      print(" status code: ${response.statusCode}");
      if (response.statusCode == 201) {
        setLoading = false;
        refetch();

        Get.snackbar("Address removed successfully",
            "Bon appétit! Get ready to savor tasty treats with us.",
            duration: const Duration(seconds: 2),
            colorText: Tcolor.Text,
            backgroundColor: Tcolor.Primary,
            icon: const Icon(Ionicons.fast_food_outline));
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Deleting from Address unsuccessful", error.message,
            duration: const Duration(seconds: 2),
            colorText: Tcolor.White,
            backgroundColor: Tcolor.ERROR_Reg,
            icon: const Icon(Icons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }

  void setDefaultAddress (String addressId, Function refetch) async{
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse("$appBaseUrl/api/address/default/$addressId");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      var response = await http.patch(url, headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        setLoading = false;
        refetch();

        Get.snackbar("Address removed successfully",
            "Bon appétit! Get ready to savor tasty treats with us.",
            duration: const Duration(seconds: 2),
            colorText: Tcolor.Text,
            backgroundColor: Tcolor.Primary,
            icon: const Icon(Ionicons.fast_food_outline));
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Deleting from Address unsuccessful", error.message,
        duration: const Duration(seconds: 2),
            colorText: Tcolor.White,
            backgroundColor: Tcolor.ERROR_Reg,
            icon: const Icon(Icons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }
}
