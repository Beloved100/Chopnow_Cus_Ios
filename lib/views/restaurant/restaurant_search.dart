
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/search_text_field.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/search_controller.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:chopnow/views/restaurant/widget/search_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class RestaurantSearch extends StatefulWidget {
  const RestaurantSearch({super.key, this.restaurant});

  @override
  State<RestaurantSearch> createState() => _RestaurantSearchState();

  final RestaurantModel? restaurant;
}

class _RestaurantSearchState extends State<RestaurantSearch> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchRestaurantFoodController());

    return Obx(() => Scaffold(
        appBar: AppBar(
          backgroundColor: Tcolor.White,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: SearchTextField(
              controller: _searchController,
              prefixIcon: GestureDetector(
                  onTap: () {
                    controller.searchFood(
                      widget.restaurant!.id,
                      _searchController.text,
                      _searchController.text,
                    );
                    print(widget.restaurant!.id,);
                    print(_searchController.text,);
                  },
                  child: Icon(
                    HeroiconsOutline.magnifyingGlass,
                    size: 34.sp,
                    color: Tcolor.TEXT_Body,
                  )),
              onClear: () {
                // Clear the search results if applicable
              },
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: controller.isLoading
                ? const CircularProgressIndicator()
                : controller.foodSearch == null
                    ? Container(
                        height: height,
                        width: width,
                        color: Tcolor.White,
                        child: ReuseableText(title: "No Food Found", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600, color: Tcolor.TEXT_Body),),
                      )
                    : const SearchResults(),
          ),
        )));
  }
}
