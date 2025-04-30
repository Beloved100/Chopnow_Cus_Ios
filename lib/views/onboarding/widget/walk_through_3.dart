
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalkThrough3 extends StatelessWidget {
  const WalkThrough3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Tcolor.White,
      child: SingleChildScrollView(
        child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.h,),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.w, right: 40.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: Image.asset(
                          "assets/img/customer_pg3.png",
                          height: 750.h,
                          ),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 40.w, right: 40.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReuseableText(
                        title: "Order Easy,",
                        style: TextStyle(
                          color: Tcolor.Text,
                          fontSize: 90.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      ReuseableText(
                        title: "Eat Fast",
                        style: TextStyle(
                          color: Tcolor.Text,
                          fontSize: 90.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ReuseableText(
                        title: "Chop Now delivers fresh, piping hot food straight",
                        style: TextStyle(
                            color: Tcolor.TEXT_Body,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w500,
                           ),
                      ),
                      ReuseableText(
                        title: "to your door, satisfying your cravings in a flash!",
                        style: TextStyle(
                            color: Tcolor.TEXT_Body,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w500,
                           ),
                      ),
                      
                    ],
                  ),
                ),
                
              ],
            ),
      ),
    );
  }
}