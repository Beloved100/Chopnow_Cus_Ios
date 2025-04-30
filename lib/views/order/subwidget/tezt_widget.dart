
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeztWidget extends StatelessWidget {
  const TeztWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      child: SizedBox(
        width: 1000.h,
        child: ReuseableText(
          title: text,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            color: Tcolor.TEXT_Label,
          ),
        ),
      ),
    );
  }
}
