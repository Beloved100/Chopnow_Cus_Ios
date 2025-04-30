import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/single_order.dart';
import 'package:chopnow/views/notification/subwidgets/rating_order_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class RatingButton1 extends StatelessWidget {
  const RatingButton1({
    super.key, required this.order,
  });
  final SingleOrder order;
  


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isDismissible: true,
          enableDrag: false,
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent, // Make the background transparent
          builder: (context) =>  RatingOrder1(order: order,)

        );
      },
      child: Container(
        width: width,
        height: 90.h,
        decoration: BoxDecoration(
            color: Tcolor.White,
            border: Border.all(color: Tcolor.BORDER_Regular),
            borderRadius: BorderRadius.circular(100.r)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return Tcolor.Primary_button.createShader(bounds);
                },
                child: Icon(
                  HeroiconsSolid.star,
                  size: 40.sp,
                  color: Colors
                      .white, // This color is irrelevant because the gradient shader will replace it
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              ReuseableText(
                title: "Rate order",
                style: TextStyle(
                  fontSize: 28.sp,
                  color: Tcolor.Text,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
