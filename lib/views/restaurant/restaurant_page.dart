import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/separator.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:chopnow/views/restaurant/restaurant_info.dart';
import 'package:chopnow/views/restaurant/restaurant_search.dart';
import 'package:chopnow/views/restaurant/widget/restaurant_menu_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';



class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
  final RestaurantModel? restaurant;
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(
      length: widget.restaurant!.restaurantCategories.length, vsync: this);

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: widget.restaurant!.restaurantCategories.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: widget.restaurant!.restaurantCategories.length,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Background Image
                  CachedNetworkImage(
                    imageUrl: widget.restaurant!.imageUrl,
                    height: 350.h, // Adjust the height as needed
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // Dark Overlay if not available
                  if (!widget.restaurant!.isAvailabe)
                    Container(
                      height: 350.h,
                      width: double.infinity,
                      color: Colors.black
                          .withOpacity(0.5), // Semi-transparent overlay
                    ),
                  // "Closed" Message if not available
                  if (!widget.restaurant!.isAvailabe)
                    Positioned(
                      top: 150.h, // Center vertically
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 180.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: Tcolor.ERROR_Light_2,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 15.w,
                                height: 15.h,
                                decoration: BoxDecoration(
                                  color: Tcolor.ERROR_Reg,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 15.w),
                              ReuseableText(
                                title: 'Closed',
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  color: Tcolor.ERROR_Reg,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  // if(!restaurant.)
                  // Icons on top of the image
                  Positioned(
                    top: 150.h, // Adjust the vertical position
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back Icon
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              width: 70.w,
                              height: 70.h,
                              decoration: BoxDecoration(
                                color: Tcolor.BACKGROUND_Dark,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: Tcolor.Text,
                                size: 45.sp,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              // Search Icon
                              GestureDetector(
                                onTap: () {
                                  // Implement your search functionality here
                                  Get.to(
                                    () =>  RestaurantSearch( restaurant: widget.restaurant,),
                                    transition: Transition.fadeIn,
                                    duration: const Duration(milliseconds: 700),
                                  );
                                },
                                child: Container(
                                  width: 70.w,
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                    color: Tcolor.BACKGROUND_Dark_Opacity,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: Tcolor.Text,
                                    size: 45.sp,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15.w),
                              // Share Icon
                              GestureDetector(
                                onTap: () {
                                  // Implement your share functionality here
                                },
                                child: Container(
                                  width: 70.w,
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                    color: Tcolor.BACKGROUND_Dark_Opacity,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.share,
                                    color: Tcolor.Text,
                                    size: 45.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Overlapping Container with Logo inside
                  Positioned(
                    top: 300.h, // Adjust to overlap properly with the image
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60.r),
                          topRight: Radius.circular(60.r),
                        ),
                        color: Tcolor.White,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Logo Image
                          Positioned(
                            top: -40
                                .h, // Adjust to position the logo at the edge
                            left: 20.w,
                            child: Container(
                              width: 120.w, // Adjust size of the logo
                              height: 120.h, // Adjust size of the logo
                              padding: EdgeInsets.all(5.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Tcolor.White,
                                border: Border.all(
                                  color: Tcolor.White, // Border color
                                  width: 5.w, // Border thickness
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Tcolor.White,
                                    blurRadius: 8.r,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: widget.restaurant!.logoUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(40.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 370.w,
                          child: ReuseableText(
                            title: widget.restaurant!.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 40.sp,
                                color: Tcolor.Text,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => RestaurantInfo(
                                  restaurant: widget.restaurant,
                                ));
                          },
                          child: Row(
                            children: [
                              CustomButton(
                                title: "Store info",
                                showArrow: false,
                                textColor: Tcolor.PRIMARY_S4,
                                btnWidth: ScreenUtil().screenWidth / 5,
                                btnColor: Tcolor.White,
                                fontSize: 30.sp,
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: 28.sp,
                                color: Tcolor.PRIMARY_S4,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 5.h),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.start,
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return Tcolor.Primary_button.createShader(bounds);
                          },
                          child: Icon(
                            Icons.star_rounded,
                            size: 40.sp,
                            color: Colors
                                .white, // This color is irrelevant because the gradient shader will replace it
                          ),
                        ),
                        SizedBox(width: 5.w),
                        ReuseableText(
                          title: widget.restaurant!.rating.toString(),
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                            color: Tcolor.Text,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        ReuseableText(
                          title: "(${widget.restaurant!.ratingCount})",
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w400,
                            color: Tcolor.TEXT_Label,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 50.h,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              AntDesign.clockcircleo,
                              size: 28.sp,
                              color: Tcolor.TEXT_Label,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: ReuseableText(
                                title: widget.restaurant!.time[0].close,
                                style: TextStyle(
                                    fontSize: 28.sp, color: Tcolor.TEXT_Label),
                              ),
                            ),
                          ],
                        ),
                        const Separator(),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 28.sp,
                              color: Tcolor.TEXT_Label,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: ReuseableText(
                                title: "2Km",
                                style: TextStyle(
                                    fontSize: 28.sp, color: Tcolor.TEXT_Label),
                              ),
                            ),
                          ],
                        ),
                        const Separator(),
                        Row(
                          children: [
                            Icon(
                              Icons.delivery_dining_outlined,
                              size: 28.sp,
                              color: Tcolor.TEXT_Label,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: ReuseableText(
                                title: "15 min",
                                style: TextStyle(
                                    fontSize: 28.sp, color: Tcolor.TEXT_Label),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Add more content here
                  ],
                ),
              ),
              SizedBox(
                height: 72.h,
                width: width,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: TabBar(
                    dividerColor: Tcolor.White,
                    controller: _tabController,
                    indicator: ShapeDecoration(
                      color: Tcolor.SECONDARY_T2, // Color for the selected tab
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.r), // Rounded corners for the selected tab
                      ),
                    ),
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding:
                        EdgeInsets.zero, // Adjust padding for each tab
                    labelColor: Tcolor.SECONDARY_S3, // Text color when selected
                    unselectedLabelColor:
                        Tcolor.TEXT_Label, // Text color when not selected
                    tabs: List.generate(
                      widget.restaurant!.restaurantCategories.length,
                      (index) {
                        final restaurantCategory =
                            widget.restaurant!.restaurantCategories[index];
                        return Tab(
                          child: SizedBox(
                            height: 50.h,
                            width: width /
                                widget.restaurant!.restaurantCategories.length,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: ReuseableText(
                                  title: restaurantCategory.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 30.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                thickness: 2.w,
                color: Tcolor.BORDER_Light,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w, right: 20.w),
                child: SizedBox(
                  height: 600.h, // Adjust this height as needed
                  child: TabBarView(
                    controller: _tabController,
                    children: List.generate(
                      widget.restaurant!.restaurantCategories.length,
                      (index) {
                        final restaurantCategory =
                            widget.restaurant!.restaurantCategories[index];
                        return RestaurantMenuWidget(
                          restaurantCategory: restaurantCategory.name,
                          emptyMessage:
                              'No food for this restaurant in this category',
                          restaurantId: widget.restaurant!.id,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
