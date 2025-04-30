import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/separator.dart';
import 'package:chopnow/enty_point.dart';
import 'package:chopnow/models/distance_time.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:chopnow/services/distance.dart';
import 'package:chopnow/views/restaurant/restaurant_info.dart';
import 'package:chopnow/views/restaurant/restaurant_search.dart';
import 'package:chopnow/views/restaurant/widget/restaurant_menu_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class RestaurantPageTest extends StatefulWidget {
  const RestaurantPageTest({super.key, this.restaurant});

  @override
  State<RestaurantPageTest> createState() => _RestaurantPageTestState();
  final RestaurantModel? restaurant;
}

class _RestaurantPageTestState extends State<RestaurantPageTest>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _imagesAvailable = true; // Add a boolean flag
  bool _isAppBarExpanded = true;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.restaurant!.restaurantCategories.length,
      vsync: this,
    );
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarExpanded = _scrollController.hasClients &&
            _scrollController.offset < (300.h - kToolbarHeight);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final longitude = box.read("longitude");
    final latitude = box.read("latitude");

    print("lattitude: ${latitude}");
    print("longitude: ${longitude}");

    final distanceCalculator = Distance();

    // Dummy values for speed and price per km
    double speedKmPerHr = 40.0;
    double pricePerKm = 300.0;
    String paymentMethod = "Card";
    // final controller = Get.put(OrderController());

    DistanceTime? distanceTime;

    distanceTime = distanceCalculator.calculateDistanceTimePrice(
        widget.restaurant!.coords.latitude,
        widget.restaurant!.coords.longitude,
        latitude ?? 8.455,
        longitude ?? 4.55,
        speedKmPerHr,
        pricePerKm);

    return DefaultTabController(
      length: widget.restaurant!.restaurantCategories.length,
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: Tcolor.BACKGROUND_Dark,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            HeroiconsOutline.arrowLeft,
                            color: Tcolor.Text,
                            size: 28.sp,
                          ),
                        ),
                        // Add some space between the icon and the text
                        if (!_isAppBarExpanded)
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: SizedBox(
                              width: 300.w,
                              child: ReuseableText(
                                title: widget
                                    .restaurant!.title, // Add the text label
                                style: TextStyle(
                                  fontSize: 33.sp,
                                  color: Tcolor.Text,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => RestaurantSearch(
                              restaurant: widget.restaurant,
                            ),
                            transition: Transition.fadeIn,
                            duration: const Duration(milliseconds: 700),
                          );
                        },
                        child: Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: Tcolor.BACKGROUND_Dark_Opacity,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            HeroiconsOutline.magnifyingGlass,
                            color: Tcolor.Text,
                            size: 28.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      GestureDetector(
                        onTap: () {
                          // Implement your share functionality here
                          Get.to(MainScreen(), arguments: 2);
                        },
                        child: Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: Tcolor.BACKGROUND_Dark_Opacity,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            HeroiconsOutline.shoppingBag,
                            color: Tcolor.Text,
                            size: 28.sp,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              pinned: true,
              automaticallyImplyLeading: false,
              // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              foregroundColor: Colors.white,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              expandedHeight: 600.h,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(20.r)),
                      child: CachedNetworkImage(
                        imageUrl: widget.restaurant!.imageUrl,
                        height: 400.h, // Adjust the height as needed
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (!widget.restaurant!.isAvailabe)
                      ClipRRect(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(20.r)),
                        child: Container(
                          height: 400.h,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                    Positioned(
                      top: 240.h, // Adjust to overlap properly with the image
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(70.r),
                            topRight: Radius.circular(70.r),
                          ),
                          color: Tcolor.White,
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -40
                                  .h, // Adjust to position the logo at the edge
                              left: 40.w,
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
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 280.h,
                      bottom: 0,
                      child: Padding(
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
                                      fontWeight: FontWeight.w700,
                                    ),
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
                                        fontSize: 30.sp,
                                        textColor: Tcolor.PRIMARY_S4,
                                        btnWidth: ScreenUtil().screenWidth / 5,
                                        btnColor: Tcolor.White,
                                        onTap: () {
                                          Get.to(() => RestaurantInfo(
                                                restaurant: widget.restaurant,
                                              ));
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Icon(
                                          HeroiconsOutline.chevronRight,
                                          size: 30.sp,
                                          color: Tcolor.PRIMARY_S4,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Tcolor.Primary,
                                  size: 32.sp,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: ReuseableText(
                                    title: widget.restaurant!.rating.toString(),
                                    style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Tcolor.Text,
                                    ),
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
                            SizedBox(height: 50.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      HeroiconsOutline.clock,
                                      size: 28.sp,
                                      color: Tcolor.TEXT_Label,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.w),
                                      child: Row(
                                        children: [
                                          ReuseableText(
                                            title:
                                                widget.restaurant!.time[0].open,
                                            style: TextStyle(
                                                fontSize: 28.sp,
                                                color: Tcolor.TEXT_Label),
                                          ),
                                          ReuseableText(
                                            title:
                                                " - ${widget.restaurant!.time[0].close}",
                                            style: TextStyle(
                                                fontSize: 28.sp,
                                                color: Tcolor.TEXT_Label),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Separator(),
                                Row(
                                  children: [
                                    Icon(
                                      HeroiconsOutline.mapPin,
                                      size: 28.sp,
                                      color: Tcolor.TEXT_Label,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.w),
                                      child: ReuseableText(
                                        title: "${distanceTime!.distance.round().toString()}km",
                                        style: TextStyle(
                                            fontSize: 28.sp,
                                            color: Tcolor.TEXT_Label),
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
                                        title: "${distanceTime.time.round().toString()}min",
                                        style: TextStyle(
                                            fontSize: 28.sp,
                                            color: Tcolor.TEXT_Label),
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
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("₦", style: TextStyle(
                                                fontSize: 26.sp,
                                                color: Tcolor.TEXT_Label),),
                                          ReuseableText(
                                            title: distanceTime.price.round().toString(),
                                            style: TextStyle(
                                                fontSize: 28.sp,
                                                color: Tcolor.TEXT_Label),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(90.h), // Height for the TabBar
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, right: 10.w, top: 40.h),
                      child: SizedBox(
                        height: 60.h,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.w, right: 30.w),
                          child: TabBar(
                            dividerColor: Colors.transparent,
                            controller: _tabController,
                            indicator: ShapeDecoration(
                              color: Tcolor.SECONDARY_T2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                            ),
                            physics: const AlwaysScrollableScrollPhysics(),
                            isScrollable: true,
                            tabAlignment: TabAlignment.start,
                            indicatorPadding: EdgeInsets.zero,
                            labelPadding: EdgeInsets.zero,
                            labelColor: Tcolor.SECONDARY_S3,
                            unselectedLabelColor: Tcolor.TEXT_Label,
                            tabs: List.generate(
                              widget.restaurant!.restaurantCategories.length,
                              (index) {
                                final restaurantCategory = widget
                                    .restaurant!.restaurantCategories[index];
                                return Tab(
                                  child: SizedBox(
                                    height: 50.h,
                                    width: MediaQuery.of(context).size.width /
                                        widget.restaurant!.restaurantCategories
                                            .length,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w),
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: const Divider(
                        thickness: 1,
                      ),
                    ),
                    SizedBox(height: 20.h,)
                  ],
                ),
              ),
            ),
          ],
          body: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}
