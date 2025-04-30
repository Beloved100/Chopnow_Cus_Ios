import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/notes.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/rating_controller.dart';
import 'package:chopnow/models/order_new_model.dart';
import 'package:chopnow/models/payout_model.dart';
import 'package:chopnow/models/payout_response_model.dart';
import 'package:chopnow/models/rider_model.dart';
import 'package:chopnow/models/rider_rating_payload_model.dart';
import 'package:chopnow/models/rider_user_model.dart';
import 'package:chopnow/models/single_restaurant_model.dart';
import 'package:chopnow/views/order/order_tracking_widgets/rating_widget/rider_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:lottie/lottie.dart';

class RateRider extends StatefulHookWidget {
  const RateRider({
    super.key,
    required this.order,
    this.riderUser,
  });

  final OrderModel order;
  final RiderUserModel? riderUser;

  @override
  State<RateRider> createState() => _RateRiderState();
}

class _RateRiderState extends State<RateRider> {
  // Declare the TextEditingController here
  late TextEditingController _rateRider;

  @override
  void initState() {
    super.initState();
    // Initialize the controller in initState
    _rateRider = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose of the controller in dispose
    _rateRider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rider = useState<RiderModel?>(null);
    final orderRestaurant = useState<SingleRestaurantModel?>(null);
    final rating = useState<double>(0);
    final box = GetStorage();
    final controller = Get.put(RatingController());

    useEffect(() {
      Future.microtask(() async {
        final restaurant =
            await controller.fetchResturant(widget.order.restaurantId);
        print("Trip Restaurant title: ${restaurant.title}");
        orderRestaurant.value = restaurant;

        print("Fetched Restaurant: ${restaurant}");
      });
      return null; // No cleanup needed
    }, [widget.order]);

    return Stack(
      children: [
        Container(
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
                              title: "Rate rider",
                              style: TextStyle(
                                fontSize: 32.sp,
                                color: Tcolor.Text,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _rateRider.clear();
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
                        RiderImage(
                          order: widget.order,
                          riderUser: widget.riderUser,
                          rider_details: (fetchedRider) {
                            WidgetsBinding.instance.addPostFrameCallback((__) {
                              rider.value = fetchedRider;
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
                            full: Icon(
                              HeroiconsSolid.star,
                              size: 24.sp,
                              color: Tcolor.Primary_New
                            ),
                            half: Icon(
                              HeroiconsSolid.star,
                              size: 24.sp,
                              color: Tcolor.Primary_New
                            ),
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
                            controller: _rateRider,
                            hintText: "Enter your review",
                          ),
                        ),
                        SizedBox(
                            height: 50.h), // Additional space for separation
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
                  title: "Rate",
                  showArrow: false,
                  btnWidth: width,
                  btnHeight: 85.sp,
                  raduis: 100.r,
                  fontSize: 28.sp,
                  btnColor: _rateRider.text.isEmpty &&
                          rating.value.isLowerThan(0.1) ||
                          orderRestaurant.value == null
                      ? Tcolor.PRIMARY_T4
                      : Tcolor.Primary_New,
                  textColor: Tcolor.Text,
                  onTap: _rateRider.text.isEmpty &&
                          rating.value.isLowerThan(0.1) ||
                          orderRestaurant.value == null? null : () async {
                    PayoutModel model = PayoutModel(
                        amount: widget.order.deliveryFee,
                        accountBank: orderRestaurant.value!.bank,
                        accountNumber: orderRestaurant.value!.accountNumber,
                        full_name: orderRestaurant.value!.accountName,
                        narration:
                            "payment for delivering ${widget.order.orderItems[0].additives[0].foodTitle}");
                    final data = payoutModelToJson(model);
                    PayoutResponseModel response =
                        await controller.riderPayout(data);
                    if (response.response.status == "success") {
                      if (_rateRider.text.isNotEmpty &&
                          rating.value.isGreaterThan(0)) {
                        var model = RiderRatingPayLoadModel(
                          riderId: widget.order.driverId,
                          orderId: widget.order.id,
                          userId: box.read("userId"),
                          rating: rating.value,
                          comment: _rateRider.text,
                          name: box.read("first_name"),
                        );
                        String data = riderRatingPayLoadModelToJson(model);
                        controller.addRiderRating(data, context);
                        // Get.to(() => ProcessingOrder(order: widget.order,));
                      } else {
                        Get.snackbar("Please choose Star and add a comment", "",
                            colorText: Tcolor.Text,
                            duration: const Duration(seconds: 2),
                            backgroundColor: Tcolor.Primary_New,
                            icon: const Icon(Ionicons.fast_food_outline));
                      }
                    }
                  },
                ),
              ),
              Obx(() {
                if (controller.isLoading) {
                  return Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.5), // Dim background
                      child: Center(
                        child: LottieBuilder.asset(
                          'assets/animation/loading_state.json', // Replace with your Lottie file path
                          width: 200.w,
                          height: 200.h,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
            ],
          ),
        ),
      ],
    );
  }
}
