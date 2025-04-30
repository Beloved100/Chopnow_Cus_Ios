// ignore_for_file: avoid_print

import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/address_response_model.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/hooks_model/address_hook.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


FetchAddresses useFetchAllAddress() {
  final box= GetStorage();
  final addressItems = useState<List<AddressResponseModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    
    isLoading.value = true;
    String accessToken = box.read("token");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      final  url = Uri.parse("$appBaseUrl/api/address/all");    
      
      final response = await http.get(url, headers: headers);
     print(response.statusCode);
     print(response.body);
      if(response.statusCode == 200){
        addressItems.value = addressResponseModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) { 
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

  return FetchAddresses(
    data: addressItems.value, 
    isLoading: isLoading.value, 
    error: error.value, 
    refetch: refetch,
  );
}