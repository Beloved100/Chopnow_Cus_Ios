
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_appbar.dart';
import 'package:chopnow/views/home/widgets/category_list.dart';
import 'package:chopnow/views/home/widgets/nearby_restaurant.dart';
import 'package:chopnow/views/home/widgets/popular_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/new_venture.dart';

class Hompage extends StatelessWidget {
  const Hompage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.h), child: const CustomAppBar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: const CategoryList(),
            ),
            Divider(
              color: Tcolor.SECONDARY_T2,
              thickness: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: const PopularRestaurant(),
            ),
            Divider(
              color: Tcolor.SECONDARY_T2,
              thickness: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: const NearbyRestaurant(),
            ),
            Divider(
              color: Tcolor.SECONDARY_T2,
              thickness: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: const NewVenture(),
            ),
            
            
            SizedBox(
              height: 200.h,
            )
          ],
        ),
      ),
    );
  }
}
