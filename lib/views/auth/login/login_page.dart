
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/controllers/login_controller.dart';
import 'package:chopnow/views/auth/widget/field_widget.dart';
import 'package:chopnow/views/onboarding/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.next});
  final Function next;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = Get.put(LoginController());


   @override
  void dispose() {
    controller.phoneNumberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: [
        Padding(
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
                  borderRadius: BorderRadius.circular(40.r),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => NextScreen());
                    },
                    icon: Icon(
                      HeroiconsOutline.arrowLeft,
                      color: Tcolor.Text,
                      size: 32.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              ReuseableText(
                title: "Login",
                style: TextStyle(
                  color: Tcolor.Text,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w600,
                  wordSpacing: 2.sp,
                ),
              ),
              SizedBox(height: 10.h),
              ReuseableText(
                title: "Let’s get you back right into your account.",
                style: TextStyle(
                  color: Tcolor.TEXT_Label,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 90.h),
              ReuseableText(
                title: "Phone number",
                style: TextStyle(
                  color: Tcolor.TEXT_Body,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150.w,
                    height: 110.h,
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Tcolor.BACKGROUND_Regaular),
                      borderRadius: BorderRadius.circular(20.r),
                      color: Tcolor.BACKGROUND_Regaular,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/img/flag-for-flag-nigeria-svgrepo-com.svg",
                            height: 40.h,
                            width: 40.w,
                          ),
                          SizedBox(width: 14.w),
                          Expanded(
                            child: Text(
                              "+234",
                              style: TextStyle(
                                color: Tcolor.TEXT_Label,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 30.w),
                  Expanded(
                    child: FieldWidget(
                      prefixIcon: const Icon(Icons.phone),
                      hintText: "81 343 XXXX",
                      hintColor: Tcolor.TEXT_Placeholder,
                      hintFontSize: 30.sp,
                      hintFontWeight: FontWeight.w600,
                      cursorHeight: 30.sp,
                      cursorColor: Tcolor.Primary,
                      controller: controller.phoneNumberController,
                      onChanged: (value) => controller.validateForm(),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.all(30.sp),
          child: Obx(
            () => CustomButton(
              title: "Login",
              showArrow: false,
              btnColor: controller.isFormFilled.value
                  ? Tcolor.Primary_New
                  : Tcolor.PRIMARY_T4,
              btnHeight: 96.h,
              raduis: 50.r,
              btnWidth: double.infinity,
              textColor: controller.isFormFilled.value
                  ? Tcolor.Text
                  : Tcolor.Text_Secondary,
              fontSize: 32.sp,
              onTap:  controller.isFormFilled.value? () {
                widget.next();
              } : null,
            ),
          ),
        ),
      ],
    );
  }
}
