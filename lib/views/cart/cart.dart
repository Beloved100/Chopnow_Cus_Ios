import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/other_loading_lottie.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/login_controller.dart';
import 'package:chopnow/models/login_response_model.dart';
import 'package:chopnow/views/auth/login/login_page_view.dart';
import 'package:chopnow/views/cart/widget/widget/active_orders.dart';
import 'package:chopnow/views/cart/widget/widget/cart_order_history.dart';
import 'package:chopnow/views/cart/widget/widget/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'widget/widget/cart_tabs.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: cartOrderList.length, vsync: this);
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    print("token is: ${box.read('token')}");

    LoginResponsModel? user;
    final controller = Get.put(LoginController());

    String? token = box.read('token');
    print("the id: ${box.read('userId')}");

    if (token != null) {
      user = controller.getUserInfo();
    }

    if (token == null) {
      // Navigate to LoginPageView
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.off(() => const LoginPageView(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 500));
      });
      return const SizedBox(
        child: Center(child: OtherLottie()),
      ); //
       // Return an empty widget while navigating
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                ReuseableText(
                  title: "My Bag",
                  style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w500,
                      color: Tcolor.Text),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Tcolor.BACKGROUND_Dark),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      CartTabs(tabController: _tabController),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Tcolor.White,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: height,
                width: width,
                child: TabBarView(controller: _tabController, children: const [
                  Carts(),
                  ActiveOrders(),
                  CartOrderHistory(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
