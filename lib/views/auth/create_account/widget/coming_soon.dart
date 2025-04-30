import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class ComingSoonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.BACKGROUND_Regaular,
      appBar: PreferredSize(preferredSize: Size.fromHeight(80.h), child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 30.w),
              height: 70.h,
              color: Tcolor.BACKGROUND_Regaular,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0, // Align the icon to the left
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 62.h,
                        width: 62.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Tcolor.White,
                        ),
                        child: Icon(
                          HeroiconsMini.chevronLeft,
                          color: Tcolor.Text,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ReuseableText(
                      title: "",
                      style: TextStyle(
                        color: Tcolor.Text,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/NIYA.png", height: 320.h, width: 320.w,),
            SizedBox(height: 20.h),
            ReuseableText(
              title: "We don't deliver to your area quite yet, but",
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w400, color: Tcolor.Text),
            ),
            SizedBox(height: 10.h),
            ReuseableText(
              title: "stay tuned! We're always expanding, and we ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.sp, color: Tcolor.Text, fontWeight: FontWeight.w400,),
            ),
            SizedBox(height: 10.h),
            ReuseableText(
              title: "might be coming your way soon.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.sp, color: Tcolor.Text, fontWeight: FontWeight.w400,),
            ),
            SizedBox(height: 30.h),
            
          ],
        ),
      ),
    );
  }
}
