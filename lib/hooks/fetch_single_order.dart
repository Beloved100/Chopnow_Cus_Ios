import 'dart:convert';

import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/hooks_model/hook_result.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:chopnow/models/single_order.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

FetchHook useFetchSingleOrder(String id) {
  final order = useState<OrderModel?>(null); // Corrected declaration
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      final url = Uri.parse("$appBaseUrl/api/order/fetch-order/$id");
      final response = await http.get(url);
      print("useFetchSingleOrder: ${response.body}");

      if (response.statusCode == 200) {
        var singleOrder = jsonDecode(response.body);
        order.value = OrderModel.fromJson(singleOrder);
        print("useFetchSingleOrder: ${response.statusCode}");
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
      error.value = e is Exception ? e : Exception('Unknown error');
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []); // Added dependency on id

  void refetch() {
    fetchData();
  }

  return FetchHook(
    data: order.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
