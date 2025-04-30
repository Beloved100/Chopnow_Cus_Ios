
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/format_price.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/food_controller.dart';

class ItemsAndPrice extends StatelessWidget {
  const ItemsAndPrice({
    super.key,
    required this.selectedItems,
  });

  final List<SelectedItem> selectedItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: selectedItems.length,
      itemBuilder: (context, index) {
        final item = selectedItems[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Container(
            color: Tcolor.White,
            height: 90.h,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReuseableText(
                      title: item.name,
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w400,
                        color: Tcolor.TEXT_Body,
                      ),
                    ),
                    ReuseableText(
                      title: "x${item.quantity}",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w400,
                        color: Tcolor.TEXT_Body,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "₦",
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  color: Tcolor.TEXT_Label,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              ReuseableText(
                                title: formatPrice(item.price ~/ item.quantity) ,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Tcolor.TEXT_Label,
                                ),
                              ),
                            ],
                          ),
                
              ],
            ),
          ),
        );
      },
    );
  }
}
