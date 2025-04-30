import 'dart:convert';

import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/address_controller.dart';
import 'package:chopnow/hooks/fetch_address.dart';
import 'package:chopnow/models/address_model.dart';
import 'package:chopnow/models/address_response_model.dart';
import 'package:chopnow/views/auth/create_account/widget/coming_soon.dart';
import 'package:chopnow/views/auth/widget/field_widget.dart';
import 'package:chopnow/views/profile/widget/addresslist_widget.dart';
import 'package:chopnow/views/shimmer/address_shimer.dart';
import 'package:chopnow/views/shimmer/food_tile_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Addresses extends StatefulHookWidget {
  const Addresses({
    super.key,
    this.refetch,
  });

  @override
  State<Addresses> createState() => _AddressesState();

  final Function()? refetch;
}

class _AddressesState extends State<Addresses> {
  final box = GetStorage();
  var minLat_1, maxLat_1, minLng_1, maxLng_1;
  void initState() {
    super.initState();

    // Initialize storage values inside initState
    minLat_1 = box.read("minLat") ?? minLat;
    maxLat_1 = box.read("maxLat") ?? maxLat;
    minLng_1 = box.read("minLng") ?? minLng;
    maxLng_1 = box.read("maxLng") ?? maxLat;

    print(minLat_1);
    print(maxLat_1);
    print(minLng_1);
    print(maxLng_1);


  }
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _placeList = [];

  var address = "";
  var postalCode = "";
  var latitude = 0.0;
  var longitude = 0.0;

  bool isLoadingResults = false; // New loading state for shimmer

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
          isLoadingResults = false; // Stop shimmer even on error
        });
      }
    } else {
      setState(() {
        _placeList = [];
        isLoadingResults = false; // Stop shimmer when search is empty
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
      if (lat < minLat_1 || lat > maxLat_1 || lng < minLng_1 || lng > maxLng_1) {
        // Redirect to the "Coming Soon" page
        Get.to(() => ComingSoonPage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final addressController = Get.put(AddressController());

    final hookResult = useFetchAllAddress();

    final List<AddressResponseModel> addresses = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;
    final refetch = hookResult.refetch;
    bool isSearching = _searchController.text.isNotEmpty;

    return PopScope(
      child: Stack(
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(250.h),
              child: Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReuseableText(
                          title: "Delivery address",
                          style: TextStyle(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w700,
                              color: Tcolor.Text),
                        ),
                        Container(
                          height: 70.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: Tcolor.BACKGROUND_Dark,
                            borderRadius: BorderRadius.circular(60.r),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                HeroiconsOutline.xMark,
                                color: Tcolor.Text,
                                size: 32.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
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
                  ],
                ),
              ),
            ),
            body: Container(
              color: Tcolor.White,
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
              child: isLoadingResults
                  ? const AddressShimmer() // Show shimmer when loading
                  : isSearching
                      ? (_placeList.isEmpty
                          ? const AddressShimmer()
                          : ListView.builder(
                              itemCount: _placeList.length,
                              itemBuilder: (context, index) {
                                String cleanDescription = _placeList[index]
                                        ['description']
                                    .replaceAll(
                                        RegExp(r'(\b[a-zA-Z0-9]{3,6}\b)$',
                                            caseSensitive: false),
                                        '') // Removes random 3-6 character codes at the end
                                    .replaceAll(RegExp(r'\b\d{4,}\b'),
                                        '') // Remove long numeric codes (if needed)
                                    .replaceAll(RegExp(r'\s{2,}'),
                                        ' ') // Remove extra spaces
                                    .trim();
                                    print(cleanDescription);
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
                                        SizedBox(width: 20.w),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width /
                                              1.5,
                                          child: ReuseableText(
                                            title: cleanDescription.isNotEmpty
                                                ? cleanDescription
                                                : _placeList[index]['description'],
                                            style: TextStyle(
                                              fontSize: 28.sp,
                                              color: Tcolor.Text,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () async {
                                       await _getPlaceDetails(
                                          _placeList[index]["place_id"]);
                                          if(latitude > minLat_1 &&
                                      latitude < maxLat_1 &&
                                      longitude > minLng_1 &&
                                      longitude < maxLng_1) {
                                        var model = AddressModel(
                                        addressLine1: cleanDescription,
                                        postalCode: postalCode.isNotEmpty
                                            ? postalCode
                                            : 'N/A',
                                        addressModelDefault: true,
                                        deliveryInstructions: "",
                                        latitude: latitude,
                                        longitude: longitude,
                                      );
          
                                      box.write("latitude", latitude);
                                      box.write("longitude", longitude);
          
                                      String data = addressModelToJson(model);
                                      addressController.updateSelectedAddress(address);
                                      addressController.addAddressProfile(
                                          data, refetch!, context);
                                      } else {
                                        Get.to(() => ComingSoonPage());
                                      }
          
                                      
                                    },
                                  ),
                                );
                              },
                            ))
                      : isLoading
                          ? const AddressShimmer()
                          : AddressListWidget(
                              addresses: addresses, refetch: refetch),
            ),
          ),
          Obx(() {
                if (addressController.isLoading) {
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
    );
  }
}
