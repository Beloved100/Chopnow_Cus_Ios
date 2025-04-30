import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/views/profile/widget/faq.dart';
import 'package:chopnow/views/profile/widget/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void showCustomBottomSheet(
    BuildContext context, Widget content, double height) {
  showModalBottomSheet(
    backgroundColor: Tcolor.White,
    context: context,
    enableDrag: false,
    isDismissible: false,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
    ),
    builder: (context) => Container(
      constraints: BoxConstraints(
        maxHeight: height,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: content,
      ),
    ),
  );
}

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(10.h), child: Container()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Column(
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
                      title: "Help and support",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 32.sp,
                          color: Tcolor.Text),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => FAQPage(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 700));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileTile(
                      title: "FAQs",
                      icon: HeroiconsOutline.questionMarkCircle,
                      onTap: () {
                        Get.to(() => FAQPage(),
                            transition: Transition.fadeIn,
                            duration: const Duration(milliseconds: 700));
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
              GestureDetector(
                onTap: () async {
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: 'chopnowafrica@gmail.com',
                  );

                  if (await canLaunchUrl(emailUri)) {
                    await launchUrl(emailUri);
                  } else {
                    Get.snackbar(
                      "Error",
                      "Could not open email app",
                      backgroundColor: Tcolor.BACKGROUND_Regaular,
                      colorText: Tcolor.TEXT_Label,
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileTile(
                      title: "Email",
                      icon: HeroiconsOutline.envelope,
                      onTap: () async {
                        final Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: 'chopnowafrica@gmail.com',
                        );

                        if (await canLaunchUrl(emailUri)) {
                          await launchUrl(emailUri);
                        } else {
                          Get.snackbar(
                            "Error",
                            "Could not open email app",
                            backgroundColor: Tcolor.BACKGROUND_Regaular,
                            colorText: Tcolor.TEXT_Label,
                          );
                        }
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
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileTile(
                      title: "Phone",
                      icon: HeroiconsOutline.phone,
                      onTap: () {},
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
              GestureDetector(
                onTap: () async {
                  String phoneNumber =
                      "2347053837933"; // Replace with a valid WhatsApp number (e.g., "2348012345678")
                  final Uri whatsappUri = Uri.parse(
                      "https://wa.me/$phoneNumber?text=Hello%20chopnow");

                  if (await canLaunchUrl(whatsappUri)) {
                    await launchUrl(whatsappUri,
                        mode: LaunchMode.externalApplication);
                  } else {
                    Get.snackbar(
                      "Error",
                      "Could not open WhatsApp",
                      backgroundColor: Tcolor.BACKGROUND_Regaular,
                      colorText: Tcolor.TEXT_Label,
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ProfileTile(
                          title: "whatsapp",
                          icon: FontAwesome.whatsapp,
                          onTap: () async {
                            String phoneNumber =
                                "2347053837933"; // Replace with a valid WhatsApp number (e.g., "2348012345678")
                            final Uri whatsappUri = Uri.parse(
                                "https://wa.me/$phoneNumber?text=Hello%20chopnow");

                            if (await canLaunchUrl(whatsappUri)) {
                              await launchUrl(whatsappUri,
                                  mode: LaunchMode.externalApplication);
                            } else {
                              Get.snackbar(
                                "Error",
                                "Could not open WhatsApp",
                                backgroundColor: Tcolor.BACKGROUND_Regaular,
                                colorText: Tcolor.TEXT_Label,
                              );
                            }
                          },
                        ),
                      ],
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
              GestureDetector(
                onTap: () async {
                          const facebookAppUrl =
                              "fb://page/chopnowafrica"; // Opens in Facebook app
                          const facebookWebUrl =
                              "https://www.facebook.com/chopnowafrica"; // Fallback to browser

                          try {
                            // Try launching the Facebook app
                            bool launched = await launchUrl(
                              Uri.parse(facebookAppUrl),
                              mode: LaunchMode.externalApplication,
                            );

                            if (!launched) {
                              // If app fails, open the web URL
                              await launchUrl(
                                Uri.parse(facebookWebUrl),
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          } catch (e) {
                            // Handle errors or show a message
                            await launchUrl(
                              Uri.parse(facebookWebUrl),
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ProfileTile(
                          title: "Facebook",
                          icon: FontAwesome.facebook_square,
                          onTap: () async {
                          const facebookAppUrl =
                              "fb://page/chopnowafrica"; // Opens in Facebook app
                          const facebookWebUrl =
                              "https://www.facebook.com/chopnowafrica"; // Fallback to browser

                          try {
                            // Try launching the Facebook app
                            bool launched = await launchUrl(
                              Uri.parse(facebookAppUrl),
                              mode: LaunchMode.externalApplication,
                            );

                            if (!launched) {
                              // If app fails, open the web URL
                              await launchUrl(
                                Uri.parse(facebookWebUrl),
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          } catch (e) {
                            // Handle errors or show a message
                            await launchUrl(
                              Uri.parse(facebookWebUrl),
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        ),
                      ],
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
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ProfileTile(
                          title: "Instagram",
                          icon: FontAwesome.instagram,
                          onTap: () {},
                        ),
                      ],
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
              GestureDetector(
                onTap: ()async{
                          const twitterApp =
                              "x://page/chopnowafrica"; // Opens in Facebook app
                          const twitterWebApp =
                              "https://x.com/chopnowafrica"; // Fallback to browser

                          try {
                            // Try launching the Facebook app
                            bool launched = await launchUrl(
                              Uri.parse(twitterApp),
                              mode: LaunchMode.externalApplication,
                            );

                            if (!launched) {
                              // If app fails, open the web URL
                              await launchUrl(
                                Uri.parse(twitterWebApp),
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          } catch (e) {
                            // Handle errors or show a message
                            await launchUrl(
                              Uri.parse(twitterWebApp),
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ProfileTile(
                          title: "Twitter (X)",
                          icon: FontAwesome.twitter_square,
                          onTap: ()async{
                          const twitterApp =
                              "x://page/chopnowafrica"; // Opens in Facebook app
                          const twitterWebApp =
                              "https://x.com/chopnowafrica"; // Fallback to browser

                          try {
                            // Try launching the Facebook app
                            bool launched = await launchUrl(
                              Uri.parse(twitterApp),
                              mode: LaunchMode.externalApplication,
                            );

                            if (!launched) {
                              // If app fails, open the web URL
                              await launchUrl(
                                Uri.parse(twitterWebApp),
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          } catch (e) {
                            // Handle errors or show a message
                            await launchUrl(
                              Uri.parse(twitterWebApp),
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        ),
                      ],
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
            ],
          ),
        ),
      ),
    );
  }
}
