// ignore_for_file: unused_local_variable


import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/views/home/widgets/sub_widgets/new_taste_widget.dart';
import 'package:chopnow/views/shimmer/restaurant_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../hooks/fetch_all_food.dart';

class NewVenture extends HookWidget {
  const NewVenture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllFoods("241105");
    final List<FoodModel> foodList = hookResult.data ?? [] ;
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReuseableText(
          title: "Venture into New Tastes",
          style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
              color: Tcolor.Text),
        ),
        SizedBox(height: 20.h,),
        isLoading ? const NearbyRestaurantShimmerWidget() : 
        
        Column(
          children: List.generate(foodList.length, (i) {
            FoodModel food = foodList[i];
            return NewTasteWidget(
              food: food, 
            );
            

            // return FoodTile(food: food,);
          }),
        ),
      ],
    );
  }
}
