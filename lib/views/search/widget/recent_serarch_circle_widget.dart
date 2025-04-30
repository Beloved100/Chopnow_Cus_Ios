
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class RecentSerarchCircleWidget extends StatelessWidget {
  const RecentSerarchCircleWidget({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74.h,
      width: 200.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(color: Tcolor.BORDER_Light)
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 10.w,),
        child: Row(
          children: [
            ReuseableText(title: title, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400, color: Tcolor.Text),),
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Transform.translate(
                offset: const Offset(0, -5),
                child: Icon(HeroiconsMini.arrowUpRight,size: 34.sp, color: Tcolor.TEXT_Label,),
                ),
            )
          ],
        ),
      ),
    );
  }
}
