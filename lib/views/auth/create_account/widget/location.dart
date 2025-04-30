// ignore_for_file: non_constant_identifier_names, prefer_final_fields, annotate_overrides

import 'dart:convert';

import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/address_controller.dart';
import 'package:chopnow/controllers/user_location_controller.dart';
import 'package:chopnow/models/address_model.dart';
import 'package:chopnow/views/auth/create_account/widget/coming_soon.dart';
import 'package:chopnow/views/auth/widget/field_widget.dart';
import 'package:chopnow/views/shimmer/address_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:http/http.dart' as http;

class Location extends StatefulWidget {
  const Location({super.key, this.refetch});

  @override
  State<Location> createState() => _LocationState();

  final Function()? refetch;
}

class _LocationState extends State<Location> {
  final box = GetStorage();

  var minLat_1, maxLat_1, minLng_1, maxLng_1;

  void initState() {
    super.initState();
    _determinePosition();

    // Initialize storage values inside initState
    minLat_1 = box.read("minLat") ?? minLat;
    maxLat_1 = box.read("maxLat") ?? maxLat;
    minLng_1 = box.read("minLng") ?? minLng;
    maxLng_1 = box.read("maxLng") ?? maxLat;
  }

  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _placeList = [];
  List<dynamic> _selectedPlace = [];

  var address = "";
  var postalCode = "";
  var latitude = 0.0;
  var longitude = 0.0;

  bool isLoadingResults = false;

  _onSeachedChanged(String searchQuery) async {
    if (searchQuery.isNotEmpty) {
      setState(() {
        isLoadingResults = true; // Show shimmer when typing starts
      });
      final url = Uri.parse(
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchQuery&key=$googleApiKey");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          _placeList = json.decode(response.body)['predictions'];
          isLoadingResults = false; // Stop shimmer when results arrive
        });
      } else {
        setState(() {
          _placeList = [];
          isLoadingResults = false; // Stop shimmer when search is empty
        });
      }
    } else {
      setState(() {
        _placeList = [];
        isLoadingResults = false; // Stop shimmer even on error
      });
    }
  }

  Future _getPlaceDetails(String placeId) async {
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$googleApiKey");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final location = json.decode(response.body);
      final lat = location['result']['geometry']['location']['lat'] as double;
      final lng = location['result']['geometry']['location']['lng'] as double;
      final addressLine = location['result']['formatted_address'];

      String postal_code = '';
      final addressComponents = location['result']['address_components'];
      for (var component in addressComponents) {
        if (component['types'].contains('postal_code')) {
          postal_code = component['long_name'];
          break;
        }
      }

      if (mounted) {
        setState(() {
          address = addressLine;
          postalCode = postal_code.isNotEmpty ? postal_code : 'N/A';
          latitude = lat;
          longitude = lng;
        });
      }

      print(address);
      print("postal code: $postalCode");
      print("lat: $lat");
      print("lng: $lng");
      if (lat < minLat_1 ||
          lat > maxLat_1 ||
          lng < minLng_1 ||
          lng > maxLng_1) {
        // Redirect to the "Coming Soon" page
        Get.to(() => ComingSoonPage());
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserLocationController());
    final addressController = Get.put(AddressController());

    bool isSearching = _searchController.text.isNotEmpty;

    // var minLat_1 = print(box.read("minLat"));
    // var maxLat_1 = print(box.read("maxLat"));

    // var minLng_1 = print(box.read("minLng"));
    // var maxLng_1 = print(box.read("maxLng"));

    return Scaffold(
      backgroundColor: Tcolor.White,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 60.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReuseableText(
                    title: "Delivery address",
                    style: TextStyle(
                        color: Tcolor.Text,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w700,
                        wordSpacing: 2.sp),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.offAll(() => const MainScreen(),
                  //         transition: Transition.fadeIn,
                  //         duration: const Duration(milliseconds: 700));
                  //   },
                  //   child: IconButton(
                  //     onPressed: null,
                  //     icon: SvgPicture.asset(
                  //       "assets/img/cancle.svg",
                  //     ),
                  //   ),
                  // )
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              FieldWidget(
                prefixIcon: const Icon(Icons.search),
                hintText: "Enter your address",
                hintColor: Tcolor.TEXT_Placeholder,
                hintFontSize: 30.sp,
                hintFontWeight: FontWeight.w600,
                cursorHeight: 30.sp,
                cursorColor: Tcolor.Primary,
                controller: _searchController,
                onChanged: _onSeachedChanged,
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () async {
                  var lat = box.read("pLatt");
                  var lng = box.read("pLong");

                  controller.address;
                  if (controller.address.isEmpty) {
                    Get.defaultDialog(
                      title: "Wait While we fetch your Location",
                      titleStyle: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      middleText: "",
                      middleTextStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textConfirm: "Go Back",
                      confirmTextColor: Colors.white,
                      buttonColor: Tcolor.Primary,
                      onConfirm: () {
                        Get.back(); // Close the dialog
                      },
                    );
                  } else if (controller.address.isNotEmpty ||
                      lat < minLat_1 ||
                      lat > maxLat_1 ||
                      lng < minLng_1 ||
                      lng > maxLng_1) {
                    print(controller.address);
                    print(box.read("pLatt"));
                    print(box.read("pLong"));
                    print(controller.postalCode);

                    print(latitude);
                    Get.to(ComingSoonPage());
                  } else if (controller.address.isNotEmpty &&
                      lat > minLat_1 &&
                      lat < maxLat_1 &&
                      lng > minLng_1 &&
                      lng < maxLng_1) {
                    print(controller.address);
                    print(box.read("pLatt"));
                    print(box.read("pLong"));
                    print(controller.postalCode);

                    print(latitude);
                    var lat = box.read("pLatt");
                    var lng = box.read("pLong");
                    var model = AddressModel(
                        addressLine1: controller.address,
                        postalCode: controller.postalCode,
                        addressModelDefault: true,
                        deliveryInstructions: "",
                        latitude: lat,
                        longitude: lng);
                    String data = addressModelToJson(model);
                    addressController.addAddress(data);
                    print("address added: ${controller.address}");
                  } else {
                    Get.defaultDialog(
                      title: "Something went wrong",
                      titleStyle: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      middleText: "",
                      middleTextStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textConfirm: "Go Back",
                      confirmTextColor: Colors.white,
                      buttonColor: Tcolor.Primary,
                      onConfirm: () {
                        Get.back(); // Close the dialog
                      },
                    );
                  }
                },
                child: FieldWidget(
                  prefixIcon: IconButton(
                    onPressed: () {
                      print("addressLine1: ${controller.address}");
                      print("longitude: ${controller.position}");
                    },
                    icon: SvgPicture.asset(
                      "assets/img/paper_airplane_up.svg",
                      height: 40.h,
                      width: 40.w,
                    ),
                  ),
                  hintText: "Use my current location",
                  hintColor: Tcolor.Text,
                  hintFontSize: 30.sp,
                  hintFontWeight: FontWeight.w400,
                  cursorHeight: 30.sp,
                  cursorColor: Tcolor.Primary,
                  fillColor: Tcolor.PRIMARY_T5,
                  enabled: false,
                ),
              ),
              // SizedBox(
              //   height: 20.h,
              // ),
              isLoadingResults
                  ? const AddressShimmer()
                  : isSearching
                      ? (_placeList.isEmpty
                          ? const AddressShimmer()
                          : Expanded(
                              child: ListView(
                              children:
                                  List.generate(_placeList.length, (index) {
                                return Container(
                                  color: Tcolor.White,
                                  child: ListTile(
                                    visualDensity: VisualDensity.compact,
                                    title: Row(
                                      children: [
                                        Icon(
                                          HeroiconsOutline.mapPin,
                                          size: 40.sp,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        SizedBox(
                                          width: width / 1.5,
                                          child: ReuseableText(
                                            title: _placeList[index]
                                                ['description'],
                                            style: TextStyle(
                                                fontSize: 28.sp,
                                                color: Tcolor.Text,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () async {
                                      await _getPlaceDetails(
                                          _placeList[index]["place_id"]);
                                      _selectedPlace.add(_placeList[index]);
                                      print(latitude);

                                      var model = AddressModel(
                                          addressLine1: address,
                                          postalCode: postalCode,
                                          addressModelDefault: true,
                                          deliveryInstructions: "",
                                          latitude: latitude,
                                          longitude: longitude);

                                      print(
                                          "your posta_code: ${model.postalCode}");

                                      String data = addressModelToJson(model);
                                      addressController.addAddress(data);
                                    },
                                  ),
                                );
                              }),
                            )))
                      : SizedBox.shrink()
            ]),
      ),
    );
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final controller = Get.put(UserLocationController());
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    LatLng currentLocation = LatLng(position.latitude, position.longitude);
    box.write("pLatt", position.latitude);
    box.write("pLong", position.longitude);

    if (position.latitude < minLat_1 ||
        position.latitude > maxLat_1 ||
        position.longitude < minLng_1 ||
        position.longitude > maxLng_1 ||
        position.latitude != 0.0 ||
        position.longitude != 0.0) {
      Get.to(() => ComingSoonPage());
    } else {
      controller.setPosition(currentLocation);
      controller.getUserAddress(currentLocation);
    }

    controller.setPosition(currentLocation);
    controller.getUserAddress(currentLocation);
  }
}
