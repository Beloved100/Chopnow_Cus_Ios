
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/notes.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class NoteToStore extends StatelessWidget {
  const NoteToStore({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.put(CheckoutController());
    return Container(
      height: 1000.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.r),
          topLeft: Radius.circular(50.r),
        ),
        color: Tcolor.White,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReuseableText(
                  title: "Note to restaurant",
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
            SizedBox(height: 50.h,),
            NoteToVendors(
              controller: controller.noToRestaurant,
            ),
            const Spacer(), // This pushes the button to the bottom
            CustomButton(
              onTap: (){
                controller.restaurantNote.value = controller.noToRestaurant.text;
                
                Get.back();
              },
              title: "Save note",
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
