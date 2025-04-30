

import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/cart_controller.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/hooks_model/hook_result.dart';

FetchHook useFetchOrderHistory() {
  final box = GetStorage();
  final order = useState<List<OrderModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);
  final controller = Get.put(CartController());

  Future<void> fetchData() async {
    String accessToken = box.read("token");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    isLoading.value = true;

    try {
      final url = Uri.parse("$appBaseUrl/api/order/user-order-history");
      final response = await http.get(url, headers: headers);
      print("useAllFetchorder: ${response.statusCode}");
        

      if (response.statusCode == 200) {

        order.value = orderModelFromJson(response.body);
        controller.totalCartItem.value = order.value!.length;
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      // Assigning the error without casting
      error.value = Exception(e.toString());
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
    data: order.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
