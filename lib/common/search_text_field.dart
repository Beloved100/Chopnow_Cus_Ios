
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onClear;
  final Widget? prefixIcon;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.onClear, this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 30.sp,
        color: Tcolor.TEXT_Body,
        fontWeight: FontWeight.w500,
      ),
      autofocus: true,
      cursorHeight: 30.sp,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Tcolor.White,
        prefixIcon: prefixIcon,
        suffixIcon: Padding(
          padding: EdgeInsets.all(50.sp),
          child: GestureDetector(
            onTap: () {
              controller.clear(); // Clear the text field
              onClear(); // Call the onClear callback
              Get.back(); // Go back
            },
            child: ReuseableText(
              title: "Cancel",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
                color: Tcolor.TEXT_Placeholder,
              ),
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(12),
      ),
      onChanged: (value) {
        // This part may need to be handled outside this widget if 
        // onChanged triggers external state updates
      },
    );
  }
}
