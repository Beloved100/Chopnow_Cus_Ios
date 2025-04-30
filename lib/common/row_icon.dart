import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class RowIcon extends StatelessWidget {
  const RowIcon({super.key, required this.title, required this.style, this.textAlign, this.overflow, this.decoration});

  final String title;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Icon(AntDesign.checkcircle, color: Tcolor.Primary_Checkbox_icon, size: 32.sp,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            width: 250.w,
            child: Text(
                  title,
                  style: style.copyWith(
            fontFamily: style.fontFamily ?? 'HelveticaNowText',
            decoration: decoration ?? TextDecoration.none  // Default to 'Aeonik' if not provided
                  ),
                  textAlign: textAlign ?? TextAlign.left,
                  
                  overflow: overflow,
                  softWrap: false,
                ),
          ),
        )
      ],
    );
  }
}