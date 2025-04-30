// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/controllers/user_location_controller.dart';
import 'package:chopnow/hooks/fetch_default_address.dart';
import 'package:chopnow/models/address_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class CustomAppBar extends StatefulHookWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final firstName = box.read("first_name");

    // Fetch default address using the hook
    final fetchResult = useFetchDefaultAddress();
    final address = fetchResult.data?.addressLine1 ?? "No 10 Fed Sec, Fate, Ilorin Kw.St";

    final controller = Get.put(UserLocationController());

    return Container(
      width: double.infinity,
      height: 210.h,
      padding: EdgeInsets.fromLTRB(24.w, 70.h, 24.w, 0),
      color: Tcolor.White,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70.h,
                width: 70.w,
                child: CircleAvatar(
                  
                  radius: 50.r,
                  child: Image.asset(
                    "assets/img/bottombar_profile.png",
                    height: 70.h,
                    width: 70.w,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReuseableText(
                    title: firstName == null ? "${getTimeOfDay()}" : "${getTimeOfDay()} $firstName",
                    style: TextStyle(
                      color: Tcolor.Text,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        HeroiconsOutline.mapPin,
                        size: 30.sp,
                        color: Tcolor.Primary,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Obx(() => SizedBox(
                        width: 400.w,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 350.w,
                              child: ReuseableText(
                                title: controller.address.isEmpty ? address : controller.address,
                                style: TextStyle(
                                    color: Tcolor.TEXT_Label,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.normal,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 40.sp,
                              color: Tcolor.TEXT_Placeholder,
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getTimeOfDay() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 7 && hour < 12) {
      return 'Good morning';
    } else if (hour >= 12 && hour < 16) {
      return "Good afternoon";
    } else if (hour >= 16 && hour < 20) {
      return 'Good evening';
    } else if (hour >= 20 && hour < 5) {
      return "Enjoy your night";
    } else {
      return "Hello";
    }
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
