import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/views/cart/widget/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartTabs extends StatelessWidget {
  const CartTabs({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      labelPadding: EdgeInsets.only(left: 0.w, right: 0.w),
      indicatorPadding: EdgeInsets.only(left: 5.w, right: 5.w),
      isScrollable: false,
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.fill,
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Tcolor.White),
      labelColor: Tcolor.Text,
      labelStyle: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          color: Tcolor.White),
      unselectedLabelColor: Tcolor.TEXT_Placeholder,
      unselectedLabelStyle: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          color: Tcolor.TEXT_Placeholder),
      tabs: List.generate(
        cartOrderList.length,
        (index) => TabWidget(text: cartOrderList[index]),
      ),
    );
  }
}
