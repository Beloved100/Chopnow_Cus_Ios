// ignore_for_file: avoid_print

import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/category_model.dart';
import 'package:chopnow/models/hooks_model/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchCategories() {
  final categoriesItems = useState<List<CategoryModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      final url = Uri.parse("$appBaseUrl/api/category/random");
      
      final response = await http.get(url);
      print(" UseFetchCategories: ${response.statusCode}");
      
      if (response.statusCode == 200) {
        categoriesItems.value = categoryModelFromJson(response.body);
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

  return FetchHook(
    data: categoriesItems.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
