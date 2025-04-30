
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/hooks/fetch_all_category.dart';
import 'package:chopnow/models/category_search_model.dart';
import 'package:chopnow/views/shimmer/category_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/grid_caegory_search.dart';

class CategorySearch extends HookWidget {
  const CategorySearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllCategories();
    final List<CategorySearchModel>? categoryList = hookResult.data;
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;


    return Padding(
      padding: EdgeInsets.only(left: 40.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReuseableText(
            title: "All categories",
            style: TextStyle(
                fontSize: 34.sp,
                fontWeight: FontWeight.w500,
                color: Tcolor.Text),
          ),
          SizedBox(height: 20.h,),
          isLoading ? SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Number of shimmer items
                  itemBuilder: (context, index) => const CategoryShimmerWidget(),
                ),
              ) : categoryList == null || categoryList.isEmpty
                ? Center(child: Text('No categories available'))
                 : SizedBox(
            height: height,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categoryList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Number of items per row
                childAspectRatio: 1, // Adjust this ratio as needed
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 15.h,
              ),
              itemBuilder: (context, index) {
                final CategorySearchModel category = categoryList[index];
                       
                return GridCaegorySearch(category: category, );
              },
            ),
          ),
        ],
      ),
    );
  }
}
