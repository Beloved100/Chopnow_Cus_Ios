
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_search_bar.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/search_page_controller.dart';
import 'package:chopnow/views/search/category_search.dart';
import 'package:chopnow/views/search/widget/empty_container.dart';
import 'package:chopnow/views/search/widget/recent_serarch_circle_widget.dart';
import 'package:chopnow/views/search/widget/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final SearchFoodRestaurantController controller = Get.put(SearchFoodRestaurantController());

  bool _hasSearched = false;
  String _searchText = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    // Handle text changes here if needed
  }

  void _onSearchSubmitted() {
    if (_searchController.text.isNotEmpty) {
      setState(() {
        _hasSearched = true;
        _searchText = _searchController.text;
      });
      controller.searchFood(_searchController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5.h),
        child: Container(color: Tcolor.White),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReuseableText(
                    title: "Search",
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w500,
                      color: Tcolor.Text,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextWidget(
                    controller: _searchController,
                    keyboardType: TextInputType.text,
                    hintText: "Search restaurant, food, drinks, etc",
                    onFieldSubmitted: (value) {
                      _onSearchSubmitted();
                    },
                    prefixIcon: GestureDetector(
                      onTap: _onSearchSubmitted,
                      child: Icon(
                        HeroiconsOutline.magnifyingGlass,
                        size: 26.sp,
                        color: Tcolor.TEXT_Placeholder,
                      ),
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              _searchController.clear();
                              setState(() {
                                _hasSearched = false;
                                _searchText = "";
                              });
                            },
                            child: Icon(
                              HeroiconsSolid.xCircle,
                              size: 32.sp,
                              color: Tcolor.BORDER_Dark,
                            ),
                          )
                        : null,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            _hasSearched
                ? Obx(() {
                    if (controller.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (controller.foodSearch.isEmpty &&
                        controller.restaurantSearch.isEmpty) {
                      return Empty(text:  _searchText);
                    } else {
                      return FoodRestaurantSearchResult(
                        foodResults: controller.foodSearch,
                        restaurantResults: controller.restaurantSearch,
                        text: _searchText,
                      );
                    }
                  })
                : SizedBox(
                    height: height,
                    width: width,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
                            child: SizedBox(
                              height: 280.h,
                              width: width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 30.h),
                                    child: ReuseableText(
                                      title: "Recent searches",
                                      style: TextStyle(
                                          fontSize: 34.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Tcolor.Text),
                                    ),
                                  ),
                                  SizedBox(height: 40.h),
                                  Row(
                                    children: [
                                      const RecentSerarchCircleWidget(
                                        title: 'Grills',
                                      ),
                                      SizedBox(width: 10.w),
                                      const RecentSerarchCircleWidget(
                                        title: 'Plantain',
                                      ),
                                      SizedBox(width: 10.w),
                                      const RecentSerarchCircleWidget(
                                        title: 'Indomie',
                                      ),
                                      SizedBox(width: 10.w),
                                    ],
                                  ),
                                  SizedBox(height: 15.h),
                                  const RecentSerarchCircleWidget(
                                    title: 'Iya Kamo',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.w, bottom: 40.h),
                            child: Divider(
                              thickness: 25.h,
                              color: Tcolor.BACKGROUND_Regaular,
                            ),
                          ),
                          const CategorySearch(),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}



