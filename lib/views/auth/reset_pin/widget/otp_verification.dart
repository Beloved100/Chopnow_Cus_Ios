
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/o_t_p_field.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';


class OTPVerificationPage extends StatelessWidget {
  const OTPVerificationPage({super.key, required this.back,  });
  final Function back;
  

  String getObscuredPhoneNumber(String phoneNumber) {
    if (phoneNumber.length >= 7) {
      return phoneNumber.replaceRange(3, phoneNumber.length - 3, '*' * (phoneNumber.length - 6));
    } else {
      return phoneNumber; // Handle case for short phone numbers if necessary
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpController());
    // String obscuredPhoneNumber = getObscuredPhoneNumber();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
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
                        back();
                      },
                      icon: Icon(
                        HeroiconsOutline.arrowLeft,
                        color: Tcolor.Text,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),
            SizedBox(height: 30.h),
            ReuseableText(
              title: "Enter verification code",
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color: Tcolor.Text,
              ),
            ),
            SizedBox(height: 10.h),
            ReuseableText(
              title: "Enter the 4-digit code sent to  to reset your PIN.",
              style: TextStyle(
                fontSize: 24.sp,
                color: Tcolor.TEXT_Label,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 50.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                OTPField(
                  controller: controller.otp1Controller,
                  focusNode: controller.focusNodes[0],
                  onChanged: (value) => controller.handleOTPInput(value, 0), 
                ),
                SizedBox(width: 20.w), // Custom space between fields
                OTPField(
                  controller: controller.otp2Controller,
                  focusNode: controller.focusNodes[1],
                  onChanged: (value) => controller.handleOTPInput(value, 1), 
                ),
                SizedBox(width: 20.w), // Custom space between fields
                OTPField(
                  controller: controller.otp3Controller,
                  focusNode: controller.focusNodes[2],
                  onChanged: (value) => controller.handleOTPInput(value, 2), 
                ),
                SizedBox(width: 20.w), // Custom space between fields
                OTPField(
                  controller: controller.otp4Controller,
                  focusNode: controller.focusNodes[3],
                  onChanged: (value) => controller.handleOTPInput(value, 3), 
                ),
              ],
            ),
             // Pushes the resend text to the bottom
             const Spacer(),
            Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.h), // Adjust padding as needed
              child: Obx(() => TextButton(
                onPressed: controller.canResend.value ? controller.resendCode : null,
                child: ReuseableText(
                  title: controller.canResend.value ? "Resend code" : "Resend code in ${controller.countdown.value} secs",
                  style: TextStyle(
                    color: controller.canResend.value ? Tcolor.PRIMARY_Button_color_1 : Tcolor.TEXT_Label,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )),
            ),
          ),
            SizedBox(height: 20.h), // Space from the bottom
          ],
        ),
      ),
    );
  }
}
