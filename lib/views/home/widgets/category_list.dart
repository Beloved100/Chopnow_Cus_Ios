
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/hooks/fetch_categories.dart';
import 'package:chopnow/models/category_model.dart';
import 'package:chopnow/views/shimmer/category_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'sub_widgets/category_widget.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    final List<CategoryModel>? categoryList = hookResult.data;
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReuseableText(
          title: "Morning starters",
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
            color: Tcolor.Text,
          ),
        ),
        SizedBox(height: 20.h),
        isLoading
            ? SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Number of shimmer items
                  itemBuilder: (context, index) => const CategoryShimmerWidget(),
                ),
              )
            : categoryList == null || categoryList.isEmpty
                ? Center(child: Text('No categories available'))
                : Container(
                    height: 200.h,
                    padding: EdgeInsets.only(left: 12.w, top: 10.h),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: (context, i) {
                        final CategoryModel category = categoryList[i];
                        return CategoryWidget(category: category);
                      },
                    ),
                  ),
      ],
    );
  }
}
