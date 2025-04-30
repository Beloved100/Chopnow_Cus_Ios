import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    Key? key,
    this.keyboardType,
    this.controller,
    this.onEditingComplete,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.onFieldSubmitted,
  }) : super(key: key);

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: Tcolor.BACKGROUND_Regaular,
        border: Border.all(color: Tcolor.White),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        obscureText: obscureText ?? false,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Tcolor.Text,
          fontSize: 32.sp,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: 30.sp,
            color: Tcolor.TEXT_Placeholder,
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          contentPadding: EdgeInsets.only(top: 10.h),
        ),
      ),
    );
  }
}