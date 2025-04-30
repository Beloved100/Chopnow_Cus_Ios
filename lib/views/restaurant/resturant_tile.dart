
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:chopnow/views/restaurant/restaurant_page_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestaurntTile extends StatelessWidget {
  const RestaurntTile({
    super.key,
    required this.restaurant,
  });

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => RestaurantPageTest(
            restaurant: restaurant,
          ),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 700),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 160.h,
            width: width,
            decoration: BoxDecoration(
              color: Tcolor.White,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    bottomLeft: Radius.circular(40.r),
                    topRight: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: SizedBox(
                      width: 100.w,
                      height: 100.h,
                      child: Image.network(
                        restaurant.logoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 35.h, bottom: 35.h, left: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReuseableText(
                        title: restaurant.title,
                        style: TextStyle(
                            color: Tcolor.Text,
                            fontWeight: FontWeight.w500,
                            fontSize: 32.sp),
                      ),
                      Wrap(
                        spacing: 10.w,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: 5.h,
                        children: [
                          ReuseableText(
                            title: restaurant.time[0].close,
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
                          ReuseableText(
                            title: "20km",
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
            
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.w, right: 30.w),
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
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return Tcolor.Primary_button.createShader(bounds);
                          },
                          child: Icon(
                            Icons.star_rounded,
                            size: 40.sp,
                            color: Colors
                                .white, // This color is irrelevant because the gradient shader will replace it
                          ),
                        ),
                        ReuseableText(
                          title: restaurant.rating.toString(),
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
    );
  }
}
