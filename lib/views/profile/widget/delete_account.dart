
import 'package:chopnow/common/cart_lottie.dart';
import 'package:chopnow/common/circle.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/delete_account_controller.dart';
import 'package:chopnow/controllers/profile_controller.dart';
import 'package:chopnow/views/profile/widget/delete_account_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeleteAccountController());
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(10.h), child: Container()),
      body: Obx(() {
        if(controller.isLoading){
          return CartLottie();
        }else{
          return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
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
                          HeroiconsOutline.arrowLeft,
                          color: Tcolor.Text,
                          size: 24.sp,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: ReuseableText(
                      title: "Delete account",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 32.sp,
                          color: Tcolor.Text),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                height: 520.h,
                width: width,
                decoration: BoxDecoration(
                    color: Tcolor.ERROR_Light_2,
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Tcolor.ERROR_Reg)),
                child: Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 40.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 72.h,
                        width: 72.h,
                        decoration: BoxDecoration(
                            color: Tcolor.ERROR_Light_1,
                            borderRadius: BorderRadius.circular(100.r)),
                        child: Icon(
                          HeroiconsMini.trash,
                          size: 48.sp,
                          color: Tcolor.ERROR_Reg,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ReuseableText(
                        title: "Account Deletion Warning",
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: Tcolor.Text,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ReuseableText(
                        title: "You're about to permanently delete your ",
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: Tcolor.TEXT_Body,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ReuseableText(
                        title: "ChopNow account! This action will: ",
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: Tcolor.TEXT_Body,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomCirclePin(
                                  height: 10.h,
                                  width: 10.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Column(
                                    children: [
                                      ReuseableText(
                                        title:
                                            "Remove all your data, preferences, and ",
                                        style: TextStyle(
                                            fontSize: 28.sp,
                                            color: Tcolor.TEXT_Body,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.w),
                              child: ReuseableText(
                                title: "account information",
                                style: TextStyle(
                                    fontSize: 28.sp,
                                    color: Tcolor.TEXT_Body,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomCirclePin(
                                  height: 10.h,
                                  width: 10.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Column(
                                    children: [
                                      ReuseableText(
                                        title:
                                            "Require you to create a new account to use ",
                                        style: TextStyle(
                                            fontSize: 28.sp,
                                            color: Tcolor.TEXT_Body,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.w),
                              child: ReuseableText(
                                title: "our services again",
                                style: TextStyle(
                                    fontSize: 28.sp,
                                    color: Tcolor.TEXT_Body,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              ReuseableText(
                title: "Recovery Period:",
                style: TextStyle(
                    fontSize: 32.sp,
                    color: Tcolor.Text,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomCirclePin(
                          height: 10.h,
                          width: 10.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Column(
                            children: [
                              ReuseableText(
                                title:
                                    "You'll have a 30-day grace period to recover your",
                                style: TextStyle(
                                    fontSize: 28.sp,
                                    color: Tcolor.TEXT_Body,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: ReuseableText(
                        title: "account",
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: Tcolor.TEXT_Body,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomCirclePin(
                          height: 10.h,
                          width: 10.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Column(
                            children: [
                              ReuseableText(
                                title:
                                    "You'll have a 30-day grace period to recover your",
                                style: TextStyle(
                                    fontSize: 28.sp,
                                    color: Tcolor.TEXT_Body,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: ReuseableText(
                        title: "account",
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: Tcolor.TEXT_Body,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ReuseableText(
                title: "Proceed with caution!",
                style: TextStyle(
                    fontSize: 28.sp,
                    color: Tcolor.Text,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 100.h,
              ),
              CustomButton(
                onTap: (){
                  Get.to(() => const DeleteAccountPin(), transition: Transition.rightToLeftWithFade);
                },
                title: 'Delete account',
                showArrow: false,
                fontSize: 28.sp,
                btnWidth: width,
                raduis: 100.r,
                btnHeight: 92.sp,
                textColor: Tcolor.White,
                btnColor: Tcolor.ERROR_Reg,
                boxShadow: [
                  BoxShadow(
                    color: Tcolor
                        .PRIMARY_Button_Inner_Shadow, // Default shadow color
                    offset: const Offset(0, -1), // Default shadow position
                    blurRadius: 1, // Default shadow blur radius
                    spreadRadius: 0, // Default shadow spread radius
                  )
                ],
              ),

              SizedBox(
                height: 50.h,
              ),
              CustomButton(
                title: 'Cancel',
                showArrow: false,
                fontSize: 28.sp,
                btnWidth: width,
                raduis: 100.r,
                btnHeight: 92.sp,
                textColor: Tcolor.PRIMARY_S4,
                btnColor: Tcolor.White,
                onTap: () {
                  Get.back();
                },
                
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      );
        }
      })
    );
  }
}
