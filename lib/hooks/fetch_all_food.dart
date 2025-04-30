// ignore_for_file: avoid_print



import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/hooks_model/food_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

FetchFoods useFetchAllFoods(String code) {
  final food = useState<List<FoodModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      final url = Uri.parse("$appBaseUrl/api/food/random/$code");
      final response = await http.get(url);
      print("useFetchAllFoods: ${response.statusCode}");
      

      if (response.statusCode == 200) {
        food.value = foodModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
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

  return FetchFoods(
    data: food.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
