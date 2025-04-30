import 'package:chopnow/common/cart_lottie.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/hooks/fetch_all_user_order.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:chopnow/views/cart/widget/widget/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ActiveOrders extends HookWidget {
  const ActiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useAllUserFetchOrder();
    final List<OrderModel> orders = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;
    final apiError = hookResult.error;
    

    return Container(
      height: height,
      width: width,
      color: Tcolor.BACKGROUND_Regaular,
      child: isLoading
          ? Center(child: const CartLottie())
          : Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: SizedBox(
                width: width,
                height: height,
                child: ListView.builder(
                  itemCount:
                      orders.length + 1, // Add an extra item for the SizedBox
                  itemBuilder: (context, i) {
                    if (i == orders.length) {
                      return SizedBox(
                          height:
                              1000.h); // Add extra space at the end of the list
                    }
                    var order = orders[i];
                    return OrderTile(order: order);
                  },
                ),
              ),
            ),
    );
  }
}
