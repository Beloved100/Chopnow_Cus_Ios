
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/hooks/fetch_user_order.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:chopnow/views/order/widget/track_order.dart';
import 'package:chopnow/views/shimmer/food_tile_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TrackingProcessingOrder extends HookWidget {
  const TrackingProcessingOrder({super.key});

  
  @override
  Widget build(BuildContext context) {

    String paymentStatus = "Completed";
  String orderStatus = "Placed";

    final hookResult = useFetchOrder(paymentStatus, orderStatus);
    final List<OrderModel>? orderList = hookResult.data ;
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;

    return Container(
      color: Tcolor.White,
      
      child: 
        SizedBox(
          height: height,
          // padding: EdgeInsets.only(left: 12.w, top: 10.h),
          child:  isLoading ? ShimmerFoodTile() : orderList == null || orderList.isEmpty
                ? Center(child: Text('No categories available', style: TextStyle(fontSize: 30.sp),)):
               ListView(
                physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: orderList.isNotEmpty ? [
              ProcessingOrder(order: orderList.last)
            ] : []
            ),
          ),
        );
      
    
  }
}
