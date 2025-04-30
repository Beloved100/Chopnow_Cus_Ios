import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.White,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h), child: Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              children: [
                SizedBox(
              height: 60.h,
            ),
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
                    SizedBox(
                      width: 30.w,
                    ),
                    ReuseableText(
                      title: "Privacy policy",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 32.sp,
                          color: Tcolor.Text),
                    ),
                  ],
                ),
              ],
            ),
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(
              height: 30.h,
            ),
            ReuseableText(
              title: "Chop Now - Privacy Policy",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 32.sp,
                  color: Tcolor.Text),
            ),
            SizedBox(height: 10),
            ReuseableText
            (
              overflow: TextOverflow.visible,
              title: "Your privacy is important to us. This Privacy Policy explains how Nobsafrica collects, uses, and shares your personal information when you use the Chop Now mobile application. By using the App, you agree to this Privacy Policy.",
              style: TextStyle(fontSize: 28.sp, color: Tcolor.TEXT_Body, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 50.h,
            ),
              buildSectionTitle("1. Information We Collect"),
            buildParagraph(
              "We may collect the following types of information:"
            ),
            buildBulletPoints([
              "Personal Information: such as your name, email address, phone number, and payment details.",
              "Location Data: when you use location-based features in the App, such as delivery tracking.",
              "Usage Information: including details about how you use the App, such as interaction with features, order history, and preferences."
            ]),
            buildSectionTitle("2. How We Use Your Information"),
            buildParagraph(
              "We use your personal information for the following purposes:"
            ),
            buildBulletPoints([
              "To process and fulfill your orders.",
              "To communicate with you about your account, orders, and updates.",
              "To provide personalized recommendations based on your order history.",
              "To improve the App and our services."
            ]),
            buildSectionTitle("3. Sharing Your Information"),
            buildParagraph(
              "We may share your information with:"
            ),
            buildBulletPoints([
              "Restaurants and delivery partners to fulfill your orders.",
              "Third-party service providers who help us with payment processing, analytics, and other business operations.",
              "Law enforcement or government agencies when required by law."
            ]),
            buildSectionTitle("4. Security of Your Information"),
            buildParagraph(
              "We take reasonable steps to protect your personal information from unauthorized access, use, or disclosure. However, no internet-based system is completely secure, and we cannot guarantee the security of your data."
            ),
            buildSectionTitle("5. Your Privacy Choices"),
            buildParagraph(
              "You may update your account information, including your contact details and preferences, through the Chop Now App at any time. You may also choose to delete your account by contacting our support team."
            ),
            buildSectionTitle("6. Third-Party Services"),
            buildParagraph(
              "Our App may include links to third-party websites or services. We are not responsible for the privacy practices or content of these third-party services."
            ),
            buildSectionTitle("7. Changes to This Privacy Policy"),
            buildParagraph(
              "We may update this Privacy Policy from time to time. Any changes will be posted within the App, and your continued use of the App after the updates will signify your acceptance of the new terms."
            ),
            buildSectionTitle("8. Contact Us"),
            buildParagraph(
              "If you have any questions or concerns about this Privacy Policy, please contact us at ChopNow."
            ),
            SizedBox(height: 20),
            ReuseableText(
              overflow: TextOverflow.visible,
              title: "By using the Chop Now app, you agree to this Privacy Policy.",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400, color: Tcolor.TEXT_Body),
            ),

            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}

 Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ReuseableText(
        title: title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Tcolor.Text, // You can change this color to fit your theme
        ),
      ),
    );
  }


  Widget buildParagraph(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ReuseableText(
        title: content,
        style: TextStyle(fontSize: 24.sp, color: Tcolor.TEXT_Body, fontWeight: FontWeight.w400),
        overflow: TextOverflow.visible,
        
      ),
    );
  }
  Widget buildBulletPoints(List<String> points) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: points.map((point) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\u2022 ",
                style: TextStyle(fontSize: 28.sp, color: Tcolor.TEXT_Label),
              ),
              Expanded(
                child: ReuseableText(
                  title: point,
                  style: TextStyle(fontSize: 28.sp, color: Tcolor.TEXT_Body),
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }


