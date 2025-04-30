
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteToVendors extends StatelessWidget {
  const NoteToVendors({
    super.key, required this.title1, required this.title2,
  });

  final String title1;
  final String title2;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.h,
        ),
        ReuseableText(
          title: "Note to store",
          style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w400,
              color: Tcolor.TEXT_Label),
        ),
        SizedBox(
          height: 15.w,
        ),
        ReuseableText(
          title: title1,
          style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w400,
              color: Tcolor.TEXT_Body),
        ),
        SizedBox(
          height: 20.h,
        ),
        Divider(
          color: Tcolor.BORDER_Light,
        ),
        SizedBox(
          height: 20.h,
        ),
        ReuseableText(
          title: "Note to rider",
          style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w400,
              color: Tcolor.TEXT_Label),
        ),
        SizedBox(
          height: 15.h,
        ),
        ReuseableText(
          title: title2,
          style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w400,
              color: Tcolor.TEXT_Body),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
