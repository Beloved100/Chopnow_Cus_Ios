import 'dart:convert';

import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/rider_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  final box = GetStorage();

  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

   Future<RiderUserModel?> fetchRiderUser(String id) async {
    setLoading = true;

    // String accessToken = box.read("token");
    var url = Uri.parse(
        "$appBaseUrl/api/rider/user/$id");

    // Map<String, String> headers = {
    //   'Content-Type': 'application/json',
    //   // 'Authorization': 'Bearer $accessToken'
    // };

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        setLoading = false;
        print(response.body);
        var data =
            json.decode(response.body); // Assuming the API response is JSON
        RiderUserModel user = RiderUserModel.fromJson(data); 
        return user;
      } else {
        var error = apiErrorFromJson(response.body);
        print(error);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
    return null;
  }
}