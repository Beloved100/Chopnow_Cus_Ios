
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/models/distance_time.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:chopnow/services/distance.dart';
import 'package:chopnow/views/restaurant/restaurant_page_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({
    super.key, required this.restaurant,
    
  });
  final RestaurantModel restaurant;

  

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final longitude = box.read("longitude");
    final latitude = box.read("latitude");

    print("lattitude: ${latitude}");
    print("longitude: ${longitude}");

    

    

    

    final distanceCalculator = Distance();

    // Dummy values for speed and price per km
    double speedKmPerHr = 20.0;
    double pricePerKm = 350.0;
    String paymentMethod = "Card";
    // final controller = Get.put(OrderController());
    // print("Current location latitude: ${currentLocation?.latitude}");


    DistanceTime? distanceTime;
    
      distanceTime = distanceCalculator.calculateDistanceTimePrice(
          restaurant.coords.latitude,
          restaurant.coords.longitude,
          latitude ?? 8.455,
           longitude ?? 4.55,
          speedKmPerHr,
          pricePerKm);






    return GestureDetector(
      onTap: () {
        Get.to(() =>  RestaurantPageTest(restaurant: restaurant,));
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 450.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Tcolor.White,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                height: 190.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.network(
                      restaurant.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      
                    ),
                    if (!restaurant.isAvailabe)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black54, // Semi-transparent overlay
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Container(
                            height: 40.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Tcolor.ERROR_Light_2,
                            ),
                            child: Center(
                              child: ReuseableText(
                                title: 'Closed',
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Tcolor.ERROR_Reg,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 210.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReuseableText(
                    title: restaurant.title,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Tcolor.Text,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 10.h),
                    child: Wrap(
                      spacing: 10.w,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 5.h,
                      children: [
                        ReuseableText(
                          title: restaurant.time[0].open,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: Tcolor.TEXT_Label,
                          ),
                        ),
                        ReuseableText(
                          title: "- ${restaurant.time[0].close}",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: Tcolor.TEXT_Label,
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color: Tcolor.BORDER_Light,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        ReuseableText(
                          title: "${distanceTime.distance.round().toString()} km",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: Tcolor.TEXT_Label,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 44.h,
                  width: 98.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Tcolor.PRIMARY_T5,
                  ),
                  child: Wrap(
                   crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 40.sp,
                        color: Tcolor.Primary_New
                      ),
                      ReuseableText(
                        title: restaurant.rating.toString(),
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Tcolor.Text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
