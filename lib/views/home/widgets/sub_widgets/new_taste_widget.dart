import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/format_price.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/views/food/food_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewTasteWidget extends StatelessWidget {
  const NewTasteWidget({super.key, required this.food});

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            isDismissible: false,
            enableDrag: false,
            context: context,
            isScrollControlled: true,
            backgroundColor:
                Colors.transparent, // Make the background transparent
            builder: (context) => FoodPage(
                  food: food,
                ));
        print(food.title);

        // Get.to(() => FoodPage(food: food,));
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Tcolor.White,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: SizedBox(
                height: 220.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.network(
                      food.imageUrl[0],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    if (!food.isAvailable)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black54, // Semi-transparent overlay
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Container(
                            height: 50.h,
                            width: 190.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Tcolor.ERROR_Light_2,
                            ),
                            child: Center(
                              child: ReuseableText(
                                title: 'Unavailable',
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Tcolor.ERROR_Reg,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 240.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReuseableText(
                    title: food.title,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Tcolor.Text,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0, right: 10.h),
                        child: Wrap(
                          spacing: 10.w,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 5.h,
                          children: [
                            ReuseableText(
                              title: food.title,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                                color: Tcolor.TEXT_Label,
                              ),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              width: 10.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                color: Tcolor.BORDER_Light,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "₦",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    color: Tcolor.TEXT_Label,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                ReuseableText(
                                  title: formatPrice(food.price),
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Tcolor.TEXT_Label,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 44.h,
                  width: 98.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Tcolor.PRIMARY_T5,
                  ),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 40.sp,
                        color: Tcolor.Primary_New
                      ),
                      ReuseableText(
                        title: food.rating.toString(),
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Tcolor.Text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
