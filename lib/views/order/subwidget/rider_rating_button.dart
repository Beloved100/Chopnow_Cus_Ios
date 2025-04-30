import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:chopnow/models/rider_user_model.dart';
import 'package:chopnow/views/order/order_tracking_widgets/rating_widget/rate_rider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class RiderRatingButton extends StatelessWidget {
  const RiderRatingButton({
    super.key, required this.order,  this.riderUser,
  });
  final OrderModel order;
  final RiderUserModel? riderUser;
  


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isDismissible: true,
          enableDrag: false,
          context: context,
          isScrollControlled: true,
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0), 
          builder: (context) =>  RateRider(order: order, riderUser: riderUser,)

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
                title: "Rate rider",
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
