import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(10.h), child: Container()),
      body: SingleChildScrollView(
        padding:  EdgeInsets.only(left: 30.w, right: 30.w),
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
                    title: "FAQs",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 32.sp,
                        color: Tcolor.Text),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h,),
            buildFAQItem(
              "1. How do I place an order?",
              "To place an order, browse through the available restaurants, add items to your cart, and proceed to checkout. You can then choose your payment method and confirm your order."
            ),
            buildFAQItem(
              "2. How can I track my order?",
              "You can track your order in real-time using the 'Order History' section in the app. Once the order is picked up by a rider, you will be able to see live updates on the rider's location."
            ),
            buildFAQItem(
              "3. What payment methods are supported?",
              "We accept multiple payment methods, including credit/debit cards, mobile money, and cash on delivery. You can choose your preferred payment method at checkout."
            ),
            buildFAQItem(
              "4. How can I cancel my order?",
              "You can cancel your order within a certain period after placing it, as long as the restaurant hasn't started preparing it. Go to 'Order History' and select the order you'd like to cancel."
            ),
            buildFAQItem(
              "5. What if I receive the wrong order?",
              "If you receive the wrong order, you can contact our support team through the app, and we will resolve the issue. Please provide details about the wrong items and any other relevant information."
            ),
            buildFAQItem(
              "6. How do I rate and review a restaurant?",
              "After your order is delivered, you can rate and review the restaurant through the 'Order History' section. We encourage you to leave feedback to help us and other users improve the experience."
            ),
            buildFAQItem(
              "7. How do I update my profile information?",
              "You can update your personal details, such as your name, email, and phone number, by going to the 'Profile' section in the app."
            ),
            buildFAQItem(
              "8. Is there a delivery fee?",
              "Yes, delivery fees vary depending on your location and the distance from the restaurant. The delivery fee will be calculated and displayed at checkout."
            ),

          ],
        ),
      ),
    );
  }
}

Widget buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: ReuseableText(
        title: question,
        style: TextStyle(
          overflow: TextOverflow.visible,
          fontWeight: FontWeight.w500,
          fontSize: 32.sp,
          color: Tcolor.Text
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ReuseableText(
            overflow: TextOverflow.visible,
            title: answer,
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w400, color: Tcolor.TEXT_Body),
          ),
        ),
      ],
    );
  }

