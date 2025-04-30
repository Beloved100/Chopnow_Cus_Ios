import 'package:chopnow/common/cart_lottie.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/hooks/fetch_order_history.dart.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:chopnow/views/cart/widget/widget/order_history_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartOrderHistory extends HookWidget {
  const CartOrderHistory({super.key});

  @override
  Widget build(BuildContext context) {

    final hookResult = useFetchOrderHistory();
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
              padding: EdgeInsets.only(top: 20),
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
                    return OrderHistoryTile(order: order);
                  },
                ),
              ),
            ),
    );
  }
}