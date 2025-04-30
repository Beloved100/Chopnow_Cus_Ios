// ignore_for_file: avoid_print

import 'dart:convert';



import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/hooks_model/hook_result.dart';
import 'package:chopnow/models/rider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;


FetchHook useFetchRiderDetails(String userId) {
  final riderDetails = useState<RiderModel?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      final  url = Uri.parse("$appBaseUrl/api/rider/rider_details/$userId");    
      // print(url.toString());
      final response = await http.get(url);
      print(response.body);
  
      if(response.statusCode == 200){
        var details = jsonDecode(response.body);
        riderDetails.value = RiderModel.fromJson(details);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      
    debugPrint(e.toString());
  
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
    data: riderDetails.value, 
    isLoading: isLoading.value, 
    error: error.value, 
    refetch: refetch,
  );
}