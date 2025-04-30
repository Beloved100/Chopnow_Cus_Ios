import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_circular_checkbox.dart';
import 'package:chopnow/common/format_price.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/common/row_icon.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/cart_controller.dart';
import 'package:chopnow/controllers/food_controller.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/single_food_additive_model.dart';
import 'package:chopnow/models/single_food_pack_model.dart';
import 'package:chopnow/views/order/widget/checkout_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:chopnow/models/cart_request.dart' as cart;

class FoodPage extends StatefulHookWidget {
  const FoodPage({super.key, this.food});

  final FoodModel? food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // get food => null;

  // @override
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final userId = box.read("userId");
    final controller =
        Get.put(FoodController(widget.food!), tag: widget.food!.id);

    final cartController = Get.put(CartController());

    final foodAdditives = useState<List<SingleFoodAdditives>>([]);
    final foodPacks = useState<List<SingleFoodPack>>([]);

    useEffect(() {
      Future.microtask(() async {
        final additives = await controller.fetchAdditives(widget.food!.id);
        foodAdditives.value =
            additives; // Update the state with fetched additives
      });
      return null; // No cleanup needed
    }, [widget.food!.id]);

    useEffect(() {
      Future.microtask(() async {
        final packs = await controller.fetchPacks(widget.food!.id);
        foodPacks.value = packs; // Update the state with fetched additives
      });
      return null; // No cleanup needed
    }, [widget.food!.id]);

    @override
    void dispose() {
      Get.delete<FoodController>();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 246, 243, 243),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.r),
            topRight: Radius.circular(60.r),
          ),
          color: Tcolor.White,
        ),
        child: Column(
          children: [
            // Image section
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60.r),
                topRight: Radius.circular(60.r),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    height: 400.h,
                    width: double.infinity,
                    child: PageView.builder(
                      itemCount: widget.food!.imageUrl.length,
                      itemBuilder: (context, i) {
                        return Container(
                          color: Tcolor.White,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.food!.imageUrl[i],
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.h, right: 30.w),
                      child: GestureDetector(
                        onTap: () {
                          controller.clearSelections();
                          controller.resetTotalPrice();
                          controller.resetSelectionsForNewFood();

                          Get.back();
                        },
                        child: Container(
                            height: 70.h,
                            width: 70.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                color: Tcolor.BACKGROUND_Dark),
                            child: Icon(HeroiconsOutline.xMark,
                                color: Tcolor.Text, size: 24.sp)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            // Scrollable section
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(30.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReuseableText(
                        title: widget.food!.title,
                        style: TextStyle(
                          color: Tcolor.Text,
                          fontWeight: FontWeight.w500,
                          fontSize: 36.sp,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "₦",
                            style:
                                TextStyle(fontSize: 25.sp, color: Tcolor.Text),
                          ),
                          ReuseableText(
                            title: "${widget.food!.price.toString()}",
                            style: TextStyle(
                              color: Tcolor.Text,
                              fontWeight: FontWeight.w400,
                              fontSize: 28.sp,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      ReuseableText(
                        title: widget.food!.description,
                        style: TextStyle(
                          color: Tcolor.TEXT_Label,
                          fontWeight: FontWeight.w400,
                          fontSize: 28.sp,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Divider(
                        thickness: 2.w,
                        color: Tcolor.BORDER_Light,
                      ),
                      SizedBox(height: 10.h),
                      ReuseableText(
                        title: "MAIN",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                          color: Tcolor.TEXT_Label,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReuseableText(
                            title: "Required",
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w500,
                              color: Tcolor.ERROR_Reg,
                            ),
                          ),
                          ReuseableText(
                            title: "Add up to 5",
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w500,
                              color: Tcolor.TEXT_Label,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RowIcon(
                            title: widget.food!.title,
                            style: TextStyle(
                              fontSize: 34.sp,
                              fontWeight: FontWeight.w400,
                              color: Tcolor.Text,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 300.w, // Adjust to fit all controls
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.decrement();
                                  },
                                  child: Icon(
                                    AntDesign.minuscircleo,
                                    size: 36.sp,
                                    color: Tcolor.TEXT_Body,
                                  ),
                                ),
                                SizedBox(
                                  width: 60
                                      .w, // Fixed width for the count display area
                                  child: Center(
                                    child: Obx(
                                      () => ReuseableText(
                                        title: "${controller.count.value}",
                                        style: TextStyle(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Tcolor.TEXT_Body,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.increment();
                                  },
                                  child: Icon(
                                    AntDesign.pluscircleo,
                                    size: 36.sp,
                                    color: Tcolor.TEXT_Body,
                                  ),
                                ),
                                Spacer(), // This keeps the price aligned to the right

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "₦",
                                      style: TextStyle(
                                        fontSize: 25.sp,
                                        color: Tcolor.TEXT_Label,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    ReuseableText(
                                      title: "${widget.food!.price}",
                                      style: TextStyle(
                                        color: Tcolor.TEXT_Label,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 28.sp,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 25.h),
                      Divider(
                        thickness: 2.w,
                        color: Tcolor.BORDER_Light,
                      ),
                      // SizedBox(height: 10.h),
                      Column(
                        children: List.generate(
                          foodPacks.value.length,
                          (index) {
                            final packs = foodPacks.value[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(height: 25.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReuseableText(
                                      title: "Package",
                                      style: TextStyle(
                                        color: Tcolor.TEXT_Label,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 28.sp,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        if (index == 0)
                                          ReuseableText(
                                            title: "Required",
                                            style: TextStyle(
                                              color: Tcolor.ERROR_Reg,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24.sp,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        if (index != 0)
                                          ReuseableText(
                                            title: "Optional",
                                            style: TextStyle(
                                              color: Tcolor.TEXT_Label,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24.sp,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        if (index == 0)
                                          ReuseableText(
                                            title: "choose a package",
                                            style: TextStyle(
                                              color: Tcolor.TEXT_Label,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 28.sp,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        if (index != 0)
                                          ReuseableText(
                                            title:
                                                "Choose at least 1 and add up to 5",
                                            style: TextStyle(
                                              color: Tcolor.TEXT_Label,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 28.sp,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: Row(
                                    children: [
                                      Obx(() {
                                        return CustomCircularCheckbox(
                                          value: controller
                                                  .isChecked[packs.id] ??
                                              false, // Default to false if key doesn't exist
                                          onChanged: (value) {
                                            controller.handleCheckboxChange(
                                                value,
                                                packs); // Update the map on change
                                          },
                                        );
                                      }),
                                      SizedBox(width: 10.w),
                                      SizedBox(
                                        width: 200.w,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.w, right: 10.w),
                                          child: ReuseableText(
                                            title: packs.packName,
                                            style: TextStyle(
                                              color: Tcolor.Text,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 28.sp,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, right: 10.w),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "₦",
                                              style: TextStyle(
                                                color: Tcolor.TEXT_Label,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 25.sp,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                            ReuseableText(
                                              title: packs.price.toString(),
                                              style: TextStyle(
                                                color: Tcolor.TEXT_Label,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 28.sp,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10.h),
                                Divider(
                                  thickness: 2.w,
                                  color: Tcolor.BORDER_Light,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 25.h),

                      Column(
                          children: List.generate(foodAdditives.value.length,
                              (index) {
                        final additives = foodAdditives.value[index];
                        return Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReuseableText(
                                  title: additives.additiveTitle,
                                  style: TextStyle(
                                    color: Tcolor.TEXT_Label,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 28.sp,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ReuseableText(
                                      title: "Optional",
                                      style: TextStyle(
                                        color: Tcolor.TEXT_Label,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24.sp,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    ReuseableText(
                                      title:
                                          "Choose at least ${additives.min} and add up to ${additives.max}",
                                      style: TextStyle(
                                        color: Tcolor.TEXT_Label,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 28.sp,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Column(
                                  children: List.generate(
                                      additives.options.length, (index) {
                                    final additiveOption =
                                        additives.options[index];
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          right: 10.w, bottom: 10.h),
                                      child: Obx(() {
                                        final isChecked = controller
                                                .isChecked[additiveOption.id] ??
                                            false;
                                        final count = controller.additiveCounts[
                                                additiveOption.id] ??
                                            0;

                                        return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomCircularCheckbox(
                                                    value: controller.isChecked[
                                                            additiveOption
                                                                .id] ??
                                                        false, // Default to false if key doesn't exist
                                                    onChanged: (value) {
                                                      controller
                                                          .handleCheckboxChange2(
                                                              value,
                                                              additiveOption); // Update the map on change
                                                    },
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.w,
                                                        right: 10.w),
                                                    child: ReuseableText(
                                                      title: additiveOption
                                                          .additiveName,
                                                      style: TextStyle(
                                                        color: Tcolor.Text,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 28.sp,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 30.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 300
                                                        .w, // Adjust to fit all controls
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        if (isChecked)
                                                          Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  controller.decrementAdditiveCount(
                                                                      additiveOption
                                                                          .id,
                                                                      additiveOption
                                                                          .price);
                                                                },
                                                                child: Icon(
                                                                  AntDesign
                                                                      .minuscircleo,
                                                                  size: 36.sp,
                                                                  color: Tcolor
                                                                      .TEXT_Body,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 60
                                                                    .w, // Fixed width for the count display area
                                                                child: Center(
                                                                  child:
                                                                      ReuseableText(
                                                                    title: count
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          30.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Tcolor
                                                                          .TEXT_Body,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  controller.incrementAdditiveCount(
                                                                      additiveOption
                                                                          .id,
                                                                      additiveOption
                                                                          .price,
                                                                      additives
                                                                          .max);
                                                                },
                                                                child: Icon(
                                                                  AntDesign
                                                                      .pluscircleo,
                                                                  size: 36.sp,
                                                                  color: Tcolor
                                                                      .TEXT_Body,
                                                                ),
                                                              ),
                                                            ],
                                                          ),

                                                        Spacer(), // This keeps the price aligned to the right

                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              "₦",
                                                              style: TextStyle(
                                                                fontSize: 25.sp,
                                                                color: Tcolor
                                                                    .TEXT_Label,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                            ReuseableText(
                                                              title:
                                                                  "${additiveOption.price}",
                                                              style: TextStyle(
                                                                color: Tcolor
                                                                    .TEXT_Label,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 28.sp,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ]);
                                      }),
                                    );
                                  }),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Divider(
                              thickness: 2.w,
                              color: Tcolor.BORDER_Light,
                            ),
                          ],
                        );
                      }))
                    ],
                  ),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
                decoration: BoxDecoration(
                  color: Tcolor.White,
                ),
                child: Obx(() {
                  return GestureDetector(
                    onTap: () {
                      var cartRequest = cart.CartRequest(
                        productId: widget.food!.id,
                        totalPrice: controller.totalPrice.toInt(),
                        userId: userId,
                        additives: controller.selectedItems
                            .map(
                              (item) => cart.Additive(
                                  foodTitle:
                                      controller.selectedItems[0].foodTitle,
                                  foodPrice:
                                      controller.selectedItems[0].foodPrice,
                                  foodCount:
                                      controller.selectedItems[0].foodCount,
                                  name: item.name,
                                  price: item.price,
                                  quantity: item.quantity,
                                  packCount: item.packCount),
                            )
                            .toList(),
                      );
                      // Print for debugging
                      print(
                          "cart tp:${cartRequest.totalPrice}, ${controller.totalPrice}");

                      String cartRequest1 = cart.cartRequestToJson(cartRequest);

                      print(
                          "cart request sent to the backend: ${cartRequest1}");

                      cartController.addToCart(cartRequest1);
                      print(SelectedItem);
                      Get.to(
                        () => CheckoutPage(
                          food: controller.food,
                          selectedItems: controller.selectedItems,
                        ),
                        transition: Transition.leftToRightWithFade,
                        duration: const Duration(milliseconds: 500),
                        arguments: controller.selectedItems,
                      );
                    },
                    child: Container(
                      height: 90.h,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: Tcolor.Primary_New),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            
                            Text(
                              "₦",
                              style: TextStyle(
                                color: Tcolor.Text,
                                fontWeight: FontWeight.w400,
                                fontSize: 25.sp,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            ReuseableText(
                              title: "${formatPrice(controller.totalPrice)} | Add to cart ",
                              style: TextStyle(
                                color: Tcolor.Text,
                                fontWeight: FontWeight.w500,
                                fontSize: 28.sp,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
