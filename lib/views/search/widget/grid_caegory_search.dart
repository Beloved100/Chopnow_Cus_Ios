
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/category_search_model.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/views/food/widget/food_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GridCaegorySearch extends StatelessWidget {
  const GridCaegorySearch({
    super.key, required this.category,
  });

  final CategorySearchModel category;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(category.id);
        print(category.title);
        Get.to(() => FoodByCategory(id: category.id, title: category.title,));
      },
      child: Container(
        height: height,
        margin: EdgeInsets.only(right: 30.w),
        padding: EdgeInsets.only(top: 4.h),
        width: width * 0.01,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Tcolor.SECONDARY_T2),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 70.h,
              width: width / 1.5,
              child: Image.network(
                category.imageUrl,
                fit: BoxFit.contain,
              ),
              
            ),
            SizedBox(
              height: 30.h,
            ),
            ReuseableText(
              title: category.title,
              style: TextStyle(
                  fontSize: 24.sp,
                  color: Tcolor.Text,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
