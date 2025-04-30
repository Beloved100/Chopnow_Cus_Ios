import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

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
                    title: "Terms of Use",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 32.sp,
                        color: Tcolor.Text),
                  ),
                ],
              ),
              ]),
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
              title: "Welcome to Chop Now!",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 32.sp,
                  color: Tcolor.Text),
            ),
            SizedBox(
              height: 50.h,
            ),
             buildSectionTitle("1. Acceptance of Terms"),
            buildParagraph(
              "By accessing or using the App, you agree to comply with and be bound by these Terms and any additional terms and conditions that may apply. These Terms constitute a legally binding agreement between you and Nobsafrica."
            ),
             buildSectionTitle("2. Eligibility"),
            buildParagraph(
              "You must be at least 18 years old to use the App. By using the App, you represent and warrant that you meet this age requirement and have the legal capacity to enter into a binding contract."
            ),
            buildSectionTitle("3. Account Registration"),
            buildParagraph(
              "To use certain features of the App, you must create an account by providing accurate and complete information. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account or any other breach of security."
            ),
            buildSectionTitle("4. Use of the App"),
            buildParagraph(
              "The App is provided for your personal, non-commercial use. You may not use the App for any illegal or unauthorized purpose."
            ),
            buildSectionTitle("5. Order Placement and Payment"),
            buildParagraph(
              "You can place an order for food and beverages through the App by selecting items from the available restaurant menus. All payments for orders must be made through the App using the payment methods provided."
            ),
            // Continue adding more sections following the same structure...
            buildSectionTitle("6. Delivery"),
            buildParagraph(
              "Delivery times may vary depending on traffic, weather, and restaurant preparation times. You can track your delivery through the app."
            ),
            buildSectionTitle("7. User Content"),
            buildParagraph(
              "You may have the opportunity to post reviews, comments, or other content on the App. By submitting content, you grant us the right to use, modify, and distribute such content."
            ),
            buildSectionTitle("8. Privacy"),
            buildParagraph(
              "Your privacy is important to us. Please refer to our Privacy Policy for information on how we collect and use your personal data."
            ),
            buildSectionTitle("9. Intellectual Property"),
            buildParagraph(
              "All content on the App is the property of Nobsafrica or its licensors and is protected by intellectual property laws."
            ),
            buildSectionTitle("10. Limitation of Liability"),
            buildParagraph(
              "To the maximum extent permitted by law, Nobsafrica shall not be liable for any indirect or incidental damages arising out of your use of the App."
            ),
            SizedBox(height: 20),
            ReuseableText(
              title: "By using the Chop Now app, you agree to these Terms of Use.",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
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


