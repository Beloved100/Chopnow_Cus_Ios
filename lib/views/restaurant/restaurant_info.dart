
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/opening_hours.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:chopnow/views/restaurant/widget/restaurant_rating_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key, required this.restaurant});

  final RestaurantModel? restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 64.h,
              width: 64.h,
              decoration: BoxDecoration(
                color: Tcolor.BACKGROUND_Dark,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    HeroiconsOutline.arrowLeft,
                    color: Tcolor.Text,
                    size: 24.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 400.w,
                  child: ReuseableText(
                    title: restaurant!.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 40.sp,
                        color: Tcolor.Text,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                if (!restaurant!.isAvailabe)
                  Center(
                    child: Container(
                      width: 160.w,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: Tcolor.ERROR_Light_2,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 15.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                              color: Tcolor.ERROR_Reg,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          ReuseableText(
                            title: 'Closed',
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: Tcolor.ERROR_Reg,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (restaurant!.isAvailabe)
                  Center(
                    child: Container(
                      width: 140.w,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: Tcolor.SUCCESS_Light_2,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 15.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                              color: Tcolor.SUCCESS_Reg,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          ReuseableText(
                            title: 'Open',
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: Tcolor.SUCCESS_Reg,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      HeroiconsOutline.mapPin,
                      color: Tcolor.Text,
                      size: 35.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 500.w,
                      child: ReuseableText(
                        title: restaurant!.coords.address,
                        style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w400,
                            color: Tcolor.Text),
                            overflow: TextOverflow.ellipsis,
                      
                      ),
                    ),
                  ],
                ),
                Icon(
                  HeroiconsOutline.arrowTopRightOnSquare,
                  size: 32.sp,
                  color: Tcolor.PRIMARY_S4,
                )
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            ReuseableText(
              title: "Restaurant Rating",
              style: TextStyle(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w500,
                  color: Tcolor.Text),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return Tcolor.Primary_button.createShader(bounds);
                      },
                      child: Icon(
                        HeroiconsSolid.star,
                        size: 40.sp,
                        color: Colors
                            .white, // This color is irrelevant because the gradient shader will replace it
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: ReuseableText(
                        title: restaurant!.rating.toString(),
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600,
                          color: Tcolor.Text,
                        ),
                      ),
                    ),
                    ReuseableText(
                      title: "(${restaurant!.ratingCount})",
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w400,
                        color: Tcolor.TEXT_Label,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() =>  RestaurantRatingPageWidget(restaurant: restaurant,), transition: Transition.leftToRight, duration: const Duration(milliseconds: 700));
                  },
                  child: Icon(
                    HeroiconsOutline.chevronRight,
                    size: 28.sp,
                    color: Tcolor.Inner_Shadow_New,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            ReuseableText(
              title: "Opening hours",
              style: TextStyle(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w500,
                  color: Tcolor.Text),
            ),
            SizedBox(
              height: 40.h,
            ),
            OpeningHours(day: "Monday", time: restaurant!.time[0].close),
            SizedBox(
              height: 20.h,
            ),
            OpeningHours(day: "Tuesday", time: restaurant!.time[0].close),
            SizedBox(
              height: 20.h,
            ),
            OpeningHours(day: "Wednesday", time: restaurant!.time[0].close),
            SizedBox(
              height: 20.h,
            ),
            OpeningHours(day: "Thursday", time: restaurant!.time[0].close),
            SizedBox(
              height: 20.h,
            ),
            OpeningHours(day: "Friday", time: restaurant!.time[0].close),
            SizedBox(
              height: 20.h,
            ),
            OpeningHours(day: "Saturday", time: restaurant!.time[0].close),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    ));
  }
}
