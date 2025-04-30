import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class OrderTrackingImages extends StatelessWidget {
  const OrderTrackingImages({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (order.orderStatus == "Placed")
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    HeroiconsSolid.creditCard,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.BACKGROUND_Dark,
                  ),
                  child: Icon(
                    HeroiconsSolid.buildingStorefront,
                    size: 35.sp,
                    color: Tcolor.TEXT_Placeholder,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.BORDER_Light,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.BACKGROUND_Dark,
                  ),
                  child: Icon(
                    Ionicons.hourglass_sharp,
                    size: 35.sp,
                    color: Tcolor.TEXT_Placeholder,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.BORDER_Light,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.BACKGROUND_Dark,
                  ),
                  child: Icon(
                    HeroiconsSolid.computerDesktop,
                    size: 35.sp,
                    color: Tcolor.TEXT_Placeholder,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.BORDER_Light,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.BACKGROUND_Dark,
                  ),
                  child: Icon(
                    HeroiconsSolid.home,
                    size: 35.sp,
                    color: Tcolor.TEXT_Placeholder,
                  ),
                ),
              ),
            ],
          ),

          if(order.orderStatus == "Accepted")
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    HeroiconsSolid.creditCard,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    HeroiconsSolid.buildingStorefront,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.BACKGROUND_Dark,
                  ),
                  child: Icon(
                    Ionicons.hourglass_sharp,
                    size: 35.sp,
                    color: Tcolor.TEXT_Placeholder,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.BORDER_Light,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.BACKGROUND_Dark,
                  ),
                  child: Icon(
                    HeroiconsSolid.computerDesktop,
                    size: 35.sp,
                    color: Tcolor.TEXT_Placeholder,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.BORDER_Light,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.BACKGROUND_Dark,
                  ),
                  child: Icon(
                    HeroiconsSolid.home,
                    size: 35.sp,
                    color: Tcolor.TEXT_Placeholder,
                  ),
                ),
              ),
            ],
          ),
          if(order.orderStatus == "Preparing")
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    HeroiconsSolid.creditCard,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    HeroiconsSolid.buildingStorefront,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    Ionicons.hourglass_sharp,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.BACKGROUND_Dark,
                  ),
                  child: Icon(
                    HeroiconsSolid.computerDesktop,
                    size: 35.sp,
                    color: Tcolor.TEXT_Placeholder,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.BORDER_Light,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.BACKGROUND_Dark,
                  ),
                  child: Icon(
                    HeroiconsSolid.home,
                    size: 35.sp,
                    color: Tcolor.TEXT_Placeholder,
                  ),
                ),
              ),
            ],
          ),




          if(order.orderStatus == "Out_For_Delivery")
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    HeroiconsSolid.creditCard,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    HeroiconsSolid.buildingStorefront,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    Ionicons.hourglass_sharp,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    HeroiconsSolid.computerDesktop,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.BACKGROUND_Dark,
                  ),
                  child: Icon(
                    HeroiconsSolid.home,
                    size: 35.sp,
                    color: Tcolor.TEXT_Placeholder,
                  ),
                ),
              ),
            ],
          ),



          if(order.orderStatus == "Delivered")
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    HeroiconsSolid.creditCard,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    HeroiconsSolid.buildingStorefront,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    Ionicons.hourglass_sharp,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    HeroiconsSolid.computerDesktop,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Tcolor.Secondary_Base,
                  height: 5.h,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h), // Updated radius
                    color: Tcolor.Secondary_Base,
                  ),
                  child: Icon(
                    HeroiconsSolid.home,
                    size: 35.sp,
                    color: Tcolor.TEXT_White,
                  ),
                ),
              ),
            ],
          ),
          
      ],
    );
  }
}
