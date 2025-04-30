import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCircularCheckbox({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);  // Toggle value on tap
      },
      child: Container(
        width: 40.h,
        height: 40.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: value ? Tcolor.Primary : Tcolor.TEXT_Placeholder,
            width: 2.w,
          ),
          color: value ? Tcolor.Primary : Colors.transparent,
        ),
        child: value
            ?  Center(
                child: Icon(
                  Icons.check,
                  size: 20.sp,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}

