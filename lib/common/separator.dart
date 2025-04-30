
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Separator extends StatelessWidget {
  const Separator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ReuseableText(
      title: "|",
      style: TextStyle(
        fontSize: 30.sp,
        color: Tcolor.TEXT_Label,
      ),
    );
  }
}
