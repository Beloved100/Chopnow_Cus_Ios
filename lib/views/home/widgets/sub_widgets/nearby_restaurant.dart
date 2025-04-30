
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/controllers/user_location_controller.dart';
import 'package:chopnow/models/distance_time.dart';
import 'package:chopnow/models/restaurant_model.dart';
import 'package:chopnow/services/distance.dart';
import 'package:chopnow/views/restaurant/restaurant_page_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyRestaurantWidget extends StatefulWidget {
  const NearbyRestaurantWidget({
    super.key, required this.restaurant,
    
  });


  final RestaurantModel restaurant;

  @override
  State<NearbyRestaurantWidget> createState() => _NearbyRestaurantWidgetState();
}

class _NearbyRestaurantWidgetState extends State<NearbyRestaurantWidget> {
  LatLng? currentLocation; // Declare it here
   @override
  void initState() {
    super.initState();
    _determinePosition();
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
    double speedKmPerHr = 20.0;
    double pricePerKm = 350.0;
    // final controller = Get.put(OrderController());
    print("Current location latitude: ${currentLocation?.latitude}");


    DistanceTime? distanceTime;
    
      distanceTime = distanceCalculator.calculateDistanceTimePrice(
          widget.restaurant.coords.latitude,
          widget.restaurant.coords.longitude,
          latitude ?? 8.455,
           longitude ?? 4.55,
          speedKmPerHr,
          pricePerKm);
    
    return GestureDetector(
      onTap: () {
        // Get.to(() => RestaurantPage(restaurant: restaurant,), transition: Transition.fadeIn, duration: const Duration(milliseconds: 700));
        Get.to(() => RestaurantPageTest(restaurant: widget.restaurant,), transition: Transition.fadeIn, duration: const Duration(milliseconds: 700));
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
              child: SizedBox(
                height: 190.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.network(
                      widget.restaurant.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    if (!widget.restaurant.isAvailabe)
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
                    title: widget.restaurant.title,
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
                    padding: EdgeInsets.only(left: 0, right: 10.h,),
                    child: Wrap(
                      spacing: 10.w,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 5.h,
                      children: [
                        ReuseableText(
                          title: widget.restaurant.time[0].open,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: Tcolor.TEXT_Label,
                          ),
                        ),
                        ReuseableText(
                          title: "- ${widget.restaurant.time[0].close}",
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
                        title: widget.restaurant.rating.toString(),
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

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    _getCurrentLocation();
  }

  Future _getCurrentLocation() async {
    
    final controller = Get.put(UserLocationController());
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    LatLng currentLocation = LatLng(position.latitude, position.longitude);
    controller.setPosition(currentLocation);
    controller.getUserAddress(currentLocation);
    
    
    
  }
}


// To make `currentLocation` accessible everywhere in the file, you can declare it as a class variable. Here's how you can do it:

// 1. Declare `currentLocation` as a class variable:

// ```
// class _NearbyRestaurantWidgetState extends State<NearbyRestaurantWidget> {
//   LatLng? currentLocation; // Declare it here

//   @override
//   void initState() {
//     super.initState();
//     _determinePosition();
//   }

//   // ... rest of your code
// }
// ```

// 1. Assign the value to `currentLocation` in the `getCurrentLocation` method:

// ```
// Future getCurrentLocation() async {
//   Position position = await Geolocator.getCurrentPosition(
//     desiredAccuracy: LocationAccuracy.bestForNavigation);
//   currentLocation = LatLng(position.latitude, position.longitude); // Assign it here
// }
// ```

// Now, `currentLocation` is accessible everywhere in the `_NearbyRestaurantWidgetState` class. You can use it like this:

// ```
// ReuseableText(
//   title: "${currentLocation?.latitude ?? ''}",
//   style: TextStyle(
//     fontSize: 24.sp,
//     fontWeight: FontWeight.w400,
//     color: Tcolor.TEXT_Label,
//   ),
// ),
// ```

// Note: I used `?? ''` to provide a default value if `currentLocation` is null. This is to avoid null pointer exceptions.
