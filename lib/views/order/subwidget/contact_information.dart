
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/controllers/checkout_controller.dart';
import 'package:chopnow/views/auth/widget/field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.put(CheckoutController());
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: 1000.h,
      decoration: BoxDecoration(
        color: Tcolor.White,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReuseableText(
                  title: "Contact information",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32.sp,
                    color: Tcolor.Text,
                  ),
                ),
                Container(
                  height: 70.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: Tcolor.BACKGROUND_Dark,
                    borderRadius: BorderRadius.circular(60.r),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        HeroiconsOutline.xMark,
                        color: Tcolor.Text,
                        size: 32.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 70.h),
            ReuseableText(
              title: "Full name",
              style: TextStyle(
                color: Tcolor.TEXT_Label,
                fontSize: 28.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            FieldWidget(
              prefixIcon: const Icon(HeroiconsOutline.user),
              hintText: "e.g john",
              hintColor: Tcolor.TEXT_Placeholder,
              hintFontSize: 30.sp,
              hintFontWeight: FontWeight.w600,
              cursorHeight: 30.sp,
              cursorColor: Tcolor.Primary,
              controller: controller.fullname,
              // onChanged: (value) => controller.validateForm(),
            ),
            SizedBox(height: 50.h),
            ReuseableText(
              title: "Phone number",
              style: TextStyle(
                color: Tcolor.TEXT_Label,
                fontSize: 28.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Container(
                  width: 100.w, // Adjust the width as needed
                  height:
                      115.h, // Adjust the height to match the text field height
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.w), // Padding for the icon and text
                  decoration: BoxDecoration(
                    border: Border.all(color: Tcolor.BACKGROUND_Regaular),
                    borderRadius: BorderRadius.circular(20.r),
                    color: Tcolor.BACKGROUND_Regaular,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/img/flag-for-flag-nigeria-svgrepo-com.svg",
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "+234",
                        style: TextStyle(
                          color: Tcolor.TEXT_Placeholder,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: FieldWidget(
                    prefixIcon: const Icon(HeroiconsOutline.phone),
                    hintText: "e.g john",
                    hintColor: Tcolor.TEXT_Placeholder,
                    hintFontSize: 30.sp,
                    hintFontWeight: FontWeight.w600,
                    cursorHeight: 30.sp,
                    cursorColor: Tcolor.Primary,
                    controller: controller.phone,
                    // onChanged: (value) => controller.validateForm(),
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              onTap: () {
                controller.fullnameNote.value = controller.fullname.text;

                controller.phoneNote.value = controller.phone.text;

                Get.back();
              },
              title: "Save details",
              showArrow: false,
              btnHeight: 96.sp,
              raduis: 80.r,
              fontSize: 28.sp,
              textColor: Tcolor.Text,
             btnColor: Tcolor.Primary_New,
            ),
          ],
        ),
      ),
    );
  }
}
