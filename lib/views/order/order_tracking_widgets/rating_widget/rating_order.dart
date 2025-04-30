import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/notes.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/rating_controller.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:chopnow/models/rating_request_model.dart';
import 'package:chopnow/models/single_restaurant_model.dart';
import 'package:chopnow/views/order/order_tracking_widgets/rating_widget/restauranr_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class RatingOrder extends StatefulHookWidget {
  const RatingOrder({super.key, required this.order});

  final OrderModel order;

  @override
  State<RatingOrder> createState() => _RatingOrderState();
}

class _RatingOrderState extends State<RatingOrder> {
  // Declare the TextEditingController here
  late TextEditingController _ratingController;

  @override
  void initState() {
    super.initState();
    // Initialize the controller in initState
    _ratingController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose of the controller in dispose
    _ratingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = useState<SingleRestaurantModel?>(null);
    final rating = useState<double>(0);
    final box = GetStorage();
    final controller = Get.put(RatingController());

    return Container(
      height: 1200.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
        color: Tcolor.White,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 120.h), // Space for the button
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReuseableText(
                          title: "Rate order",
                          style: TextStyle(
                            fontSize: 32.sp,
                            color: Tcolor.Text,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: Tcolor.BACKGROUND_Dark,
                            ),
                            child: Icon(
                              HeroiconsOutline.xMark,
                              size: 28.sp,
                              color: Tcolor.Text,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    RestaurantLogo(
                      order: widget.order,
                      onRestaurantFetched: (fetchedRestaurant) {
                        WidgetsBinding.instance.addPostFrameCallback((__) {
                          restaurant.value = fetchedRestaurant;
                        });
                      },
                    ),
                    SizedBox(height: 30.h),
                    RatingBar(
                      initialRating: 0,
                      minRating: 1,
                      glow: true,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      unratedColor: Tcolor.BACKGROUND_Dark,
                      itemSize: 80.sp,
                      ratingWidget: RatingWidget(
                        full: Icon(HeroiconsSolid.star,
                            size: 24.sp, color: Tcolor.Primary_New),
                        half: Icon(HeroiconsSolid.star,
                            size: 24.sp, color: Tcolor.Primary_New),
                        empty: Icon(
                          HeroiconsSolid.star,
                          size: 24.sp,
                          color: Tcolor.BACKGROUND_Dark,
                        ),
                      ),
                      onRatingUpdate: (value) {
                        rating.value = value;
                      },
                    ),
                    SizedBox(height: 50.h),
                    SizedBox(
                      height: 240.h,
                      child: NoteToVendors(
                        controller: _ratingController,
                        hintText: "Enter your review",
                      ),
                    ),
                    SizedBox(height: 50.h), // Additional space for separation
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 30.w,
            right: 30.w,
            child: CustomButton(
              title: "Save",
              showArrow: false,
              btnWidth: width,
              btnHeight: 85.sp,
              raduis: 100.r,
              fontSize: 28.sp,
              btnColor: _ratingController.text.isEmpty &&
                      rating.value.isLowerThan(0.1)
                  ? Tcolor.PRIMARY_T4
                  : Tcolor.Primary_New,
              textColor: Tcolor.Text,
              onTap: _ratingController.text.isEmpty &&
                      rating.value.isLowerThan(0.1)
                  ? null
                  : () {
                      if (_ratingController.text.isNotEmpty &&
                          rating.value.isGreaterThan(0)) {
                        var model = RatingRequestModel(
                          restaurantId: widget.order.restaurantId,
                          userId: box.read("userId"),
                          rating: rating.value,
                          comment: _ratingController.text,
                          name: box.read("first_name"),
                          orderId: widget.order.id,
                        );
                        String data = ratingRequestModelToJson(model);
                        controller.addRating(data, context);
                        // Get.to(() => ProcessingOrder(order: widget.order,));
                      } else {
                        Get.snackbar("Please choose Star and add a comment", "",
                            colorText: Tcolor.Text,
                            duration: const Duration(seconds: 2),
                            backgroundColor: Tcolor.Primary_New,
                            icon: const Icon(Ionicons.fast_food_outline));
                      }
                    },
            ),
          ),
        ],
      ),
    );
  }
}
