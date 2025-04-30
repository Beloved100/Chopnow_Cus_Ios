// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/user_location_controller.dart';
import 'package:chopnow/models/address_response_model.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/hooks_model/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchDefaultAddress() {
  final controller = Get.put(UserLocationController());
  final box = GetStorage();
  final addressItems = useState<AddressResponseModel?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    String? accessToken = box.read("token");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      final url = Uri.parse("$appBaseUrl/api/address/default");

      final response = await http.get(url, headers: headers);
      print("your default address is: ${response.body}");

      if (response.statusCode == 200) {
        var data = response.body;
        box.write("defaultAddress", true);
        var decoded = jsonDecode(data);

        addressItems.value = AddressResponseModel.fromJson(decoded);
          controller.setDefaultAddress(addressItems.value!.addressLine1);
        box.write("defaultAdd", addressItems.value!.addressLine1);
        box.write("latitude", addressItems.value!.latitude);
        box.write("longitude", addressItems.value!.longitude);

      } else {
        box.write("defaultAdress", false);
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      box.write("defaultAdrress", false);
      error.value = e as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: addressItems.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
