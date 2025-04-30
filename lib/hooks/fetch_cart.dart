// ignore_for_file: avoid_print

import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/cart_controller.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/cart_response.dart';
import 'package:chopnow/models/hooks_model/hook_result.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


FetchHook useFetchCart() {
  final box = GetStorage();
  final cart = useState<List<CartResponse>?>(null);
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
      final  url = Uri.parse("$appBaseUrl/api/cart");    
      
      final response = await http.get(url, headers: headers);
      
      if(response.statusCode == 200){
        cart.value = cartResponseFromJson(response.body);
        controller.totalCartItem.value = cart.value!.length;
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
    //debugPrint(e.toString());
    error.value = e as Exception;
  
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    //Future.delayed(const Duration(seconds: 3));
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }


  return FetchHook(
    data: cart.value, 
    isLoading: isLoading.value, 
    error: error.value, 
    refetch: refetch,
  );
}