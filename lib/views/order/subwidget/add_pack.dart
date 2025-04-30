
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class AddPack extends StatelessWidget {
  const AddPack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.sp,
      width: 400.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(
              color: Tcolor.BACKGROUND_Regaular,
              width: 3.h),
          boxShadow: [
            BoxShadow(
                color: Tcolor.BORDER_Regular_Inner_shadow,
                blurRadius: 2,
                offset: Offset(0, -2.h))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            HeroiconsSolid.plus,
            color: Tcolor.Text,
            size: 20,
          ),
          SizedBox(width: 15.w,),
          ReuseableText(
            title: "Add another pack",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: Tcolor.Text,
            ),
          ),
        ],
      ),
    );
  }
}
