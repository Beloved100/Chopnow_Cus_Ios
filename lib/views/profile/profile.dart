
import 'package:chopnow/common/capitalized_text.dart';
import 'package:chopnow/common/cart_lottie.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/other_loading_lottie.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/controllers/login_controller.dart';
import 'package:chopnow/models/login_response_model.dart';
import 'package:chopnow/views/auth/create_account/widget/location.dart';
import 'package:chopnow/views/auth/login/login_page_view.dart';
import 'package:chopnow/views/profile/widget/addresses.dart';
import 'package:chopnow/views/profile/widget/delete_account.dart';
import 'package:chopnow/views/profile/widget/help_and_support.dart';
import 'package:chopnow/views/profile/widget/privacy_policies.dart';
import 'package:chopnow/views/profile/widget/profile_details.dart';
import 'package:chopnow/views/profile/widget/terms_of_use.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:chopnow/controllers/profile_controller.dart';


import 'widget/profile_tile.dart';
import 'widget/profile_user_widget.dart';

 

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final box = GetStorage();
    LoginResponsModel? user;
    

    String? token = box.read('token');

    if (token != null) {
      user = controller.getUserInfo();
    }

    if (token == null) {
      // Navigate to LoginPageView
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.off(() => const LoginPageView(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 500));
      });
      return const SizedBox(
        child: Center(child: OtherLottie()),
      ); // Return an empty widget while navigating
    }
    
    final profileController = Get.put(ProfileController());
    final phone = box.read('phone');

    
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Obx(() => ProfileUserWidget(
              image: 'assets/img/bottombar_profile.png',
              title: "${capitalizeFirstLetter(profileController.firstName.value)} ${capitalizeFirstLetter(profileController.lastName.value)}",
              phone: "${profileController.phone.value}",
            )),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseableText(
                  title: "ACCOUNT",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                      color: Tcolor.TEXT_Label),
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileTile(
                      title: 'Profile Details',
                      icon: HeroiconsOutline.user,
                      onTap: () {
                        Get.to(
                          () => const ProfileDetails(),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 700),
                          
                        );
                      },
                    ),
                    Icon(
                      HeroiconsOutline.chevronRight,
                      size: 32.sp,
                      color: Tcolor.TEXT_Label,
                    )
                  ],
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const Addresses(),
                      transition: Transition.leftToRight,
                      duration: const Duration(milliseconds: 700),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileTile(
                        title: 'Addresses',
                        icon: HeroiconsOutline.mapPin,
                        onTap: () {
                          Get.to(
                      () => const Addresses(),
                      transition: Transition.leftToRight,
                      duration: const Duration(milliseconds: 700),
                    );
                        },
                      ),
                      Icon(
                        HeroiconsOutline.chevronRight,
                        size: 32.sp,
                        color: Tcolor.TEXT_Label,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 70.h),
                ReuseableText(
                  title: "MORE",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                      color: Tcolor.TEXT_Label),
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const HelpAndSupport(),
                      transition: Transition.leftToRightWithFade,
                      duration: const Duration(milliseconds: 700),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileTile(
                        title: 'Help and Support',
                        icon: HeroiconsOutline.questionMarkCircle,
                        onTap: () {
                          Get.to(
                      () => const HelpAndSupport(),
                      transition: Transition.leftToRightWithFade,
                      duration: const Duration(milliseconds: 700),
                    );
                        },
                      ),
                      Icon(
                        HeroiconsOutline.chevronRight,
                        size: 32.sp,
                        color: Tcolor.TEXT_Label,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: () {
                     Get.to(() => PrivacyPolicy(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 700));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileTile(
                        title: 'Privacy policy',
                        icon: HeroiconsOutline.documentText,
                        onTap: () {
                          Get.to(() => PrivacyPolicy(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 700));
                        },
                      ),
                      Icon(
                        HeroiconsOutline.chevronRight,
                        size: 32.sp,
                        color: Tcolor.TEXT_Label,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: () {
                    Get.to(() => TermsOfUse(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 700));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileTile(
                        title: 'Terms of use',
                        icon: HeroiconsOutline.documentText,
                        onTap: () {
                          Get.to(() => TermsOfUse(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 700));
                        },
                      ),
                      Icon(
                        HeroiconsOutline.chevronRight,
                        size: 32.sp,
                        color: Tcolor.TEXT_Label,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 110.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileTile(
                      title: 'Logout',
                      icon: HeroiconsOutline.arrowRightOnRectangle,
                      onTap: () {
                        controller.logout();
                      },
                    ),
                    Icon(
                      HeroiconsOutline.chevronRight,
                      size: 32.sp,
                      color: Tcolor.TEXT_Label,
                    )
                  ],
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const DeleteAccount(),
                      transition: Transition.leftToRightWithFade,
                      duration: const Duration(milliseconds: 700),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileTile(
                        title: 'Delete account',
                        icon: HeroiconsOutline.trash,
                        color: Tcolor.ERROR_Reg,
                        onTap: () {
                          Get.to(
                            () => const DeleteAccount(),
                            transition: Transition.leftToRightWithFade,
                            duration: const Duration(milliseconds: 700),
                          );
                        },
                      ),
                      Icon(
                        HeroiconsOutline.chevronRight,
                        size: 32.sp,
                        color: Tcolor.TEXT_Label,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40.h),

                // SizedBox(height: 100,)
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
