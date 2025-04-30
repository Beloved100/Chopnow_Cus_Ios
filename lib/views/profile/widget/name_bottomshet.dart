
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/edit_profile_name.dart';
import 'package:chopnow/controllers/profile_controller.dart';
import 'package:chopnow/views/auth/widget/field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:lottie/lottie.dart';

class NameProfileBottomSheet extends StatelessWidget {
  const NameProfileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final iD = box.read("userId");
    final controller = Get.put(EditProfileName());
    final profileController = Get.put(ProfileController());
    return Stack(
      children: [
        Container(
          width: width,
          height: 1200.h,
          decoration: BoxDecoration(
            color: Tcolor.White,
             borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r))
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReuseableText(
                      title: "Edit name",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 32.sp,
                          color: Tcolor.Text),
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
                SizedBox(
                  height: 80.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReuseableText(
                          title: "First Name",
                          style: TextStyle(
                            color: Tcolor.TEXT_Label,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        FieldWidget(
                          prefixIcon: Icon(
                            HeroiconsOutline.user,
                            size: 32.sp,
                          ),
                          hintText: "e.g john",
                          hintColor: Tcolor.TEXT_Placeholder,
                          hintFontSize: 30.sp,
                          hintFontWeight: FontWeight.w600,
                          cursorHeight: 30.sp,
                          cursorColor: Tcolor.Primary,
                          controller: controller.firstNameController,
                          onChanged: (value) => controller.validateForm(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ReuseableText(
                          title: "Last Name",
                          style: TextStyle(
                            color: Tcolor.TEXT_Label,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        FieldWidget(
                          prefixIcon: Icon(
                            HeroiconsOutline.user,
                            size: 32.sp,
                          ),
                          hintText: "e.g john",
                          hintColor: Tcolor.TEXT_Placeholder,
                          hintFontSize: 30.sp,
                          hintFontWeight: FontWeight.w600,
                          cursorHeight: 30.sp,
                          cursorColor: Tcolor.Primary,
                          controller: controller.lastNameController,
                          onChanged: (value) => controller.validateForm(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  title: "Save Changes",
                  showArrow: false,
                  fontSize: 28.sp,
                  textColor: Tcolor.Text,
                  raduis: 100.r,
                  btnWidth: width / 1,
                  btnHeight: 96.sp,
                  btnColor: Tcolor.Primary_New,
                  onTap: () {
                     profileController.changeName(iD, controller.firstNameController.text, controller.lastNameController.text);
                     controller.firstNameController.text = "";
                     controller.lastNameController.text = "";
                     
                    // 
        
                    print(iD);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                
              ],
            ),
          ),
        ),
        Obx(() {
                if (profileController.isLoading) {
                  return Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.5), // Dim background
                      child: Center(
                        child: LottieBuilder.asset(
                          'assets/animation/loading_state.json', // Replace with your Lottie file path
                          width: 200.w,
                          height: 200.h,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
      ],
    );
  }
}
