
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Empty extends StatelessWidget {
  const Empty({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Tcolor.BACKGROUND_Regaular,
      child: Padding(
        padding: EdgeInsets.only(left: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            ReuseableText(
              title: '0 results for "$text"',
              style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w500,
                  color: Tcolor.Text),
            )
          ],
        ),
      ),
    );
  }
}
