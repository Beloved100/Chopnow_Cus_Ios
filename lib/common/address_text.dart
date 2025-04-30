import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/controllers/user_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddressText extends StatelessWidget {
  const AddressText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserLocationController());
    return SizedBox(
      width: 350.w,
      child: ReuseableText(
        title: controller.address == ""
            ? "No 10, Tanke, Oke Odo Ilo, Kw.St"
            : controller.address,
        // controller.address =="" ? "No 10, Tanke, Oke Odo Ilo, Kw.St" : controller.address
        style: TextStyle(
            color: Tcolor.TEXT_Label,
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
