import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controllers/cart_controller.dart';
import 'package:chopnow/controllers/food_controller.dart';
import 'package:chopnow/models/cart_response.dart';
import 'package:chopnow/models/food_model.dart' hide Additive;
import 'package:chopnow/models/single_restaurant_model.dart' hide Additive;
import 'package:chopnow/views/cart/widget/widget/cart_restaurant_namenlogo.dart';
import 'package:chopnow/views/food/food_page.dart';
import 'package:chopnow/views/order/widget/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class CartTile extends HookWidget {
  const CartTile({
    super.key,
    required this.cart,
    this.refetch,
  });
  final CartResponse cart;
  final Function()? refetch;

  @override
  Widget build(BuildContext context) {
    SelectedItem convertAdditiveToSelectedItem(Additive additive) {
      return SelectedItem(
        foodTitle: additive.foodTitle,
        foodPrice: additive.foodPrice,
        foodCount: additive.foodCount,
        name: additive.name,
        price: additive.price,
        quantity: additive.quantity,
        packCount: additive.packCount,
      );
    }

    final restaurant = useState<SingleRestaurantModel?>(null);
    final cartController = Get.put(CartController());

    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 30.h, bottom: 5.h),
      child: Container(
        height: 250.h,
        width: width,
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
        decoration: BoxDecoration(
            color: Tcolor.White, borderRadius: BorderRadius.circular(20.r)),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: CartRestaurantLogoName(
                      cart: cart,
                      onRestaurantFetched: (fetchedRestaurant) {
                        WidgetsBinding.instance.addPostFrameCallback((__) {
                          restaurant.value = fetchedRestaurant;
                        });
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      cartController.removeFromCart(cart.id, refetch!);
                    },
                    child: Container(
                      height: 56.sp,
                      width: 56.sp,
                      decoration: BoxDecoration(
                          color: Tcolor.ERROR_Light_1,
                          borderRadius: BorderRadius.circular(100.r)),
                      child: Icon(
                        HeroiconsOutline.trash,
                        size: 32.sp,
                        color: Tcolor.ERROR_Reg,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    title: "Add to Order",
                    showArrow: false,
                    btnColor: Tcolor.BACKGROUND_Regaular,
                    btnWidth: 280.w,
                    btnHeight: 70.h,
                    textColor: Tcolor.Text,
                    fontSize: 28.sp,
                    raduis: 100.r,
                    onTap: () async {
                      final food =
                          await cartController.fetchFood(cart.productId.id);
                      if (food != null) {
                        // ignore: use_build_context_synchronously
                        showModalBottomSheet(
                            isDismissible: false,
                            enableDrag: false,
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors
                                .transparent, // Make the background transparent
                            builder: (context) => FoodPage(
                                  food: food,
                                ));
                      } else {
                        // Handle the case where food data couldn't be fetched
                      }
                    },
                  ),
                  CustomButton(
                    title: "Check Out",
                    showArrow: false,
                    btnWidth: 280.w,
                    btnHeight: 70.h,
                    btnColor: Tcolor.Primary_New,
                    textColor: Tcolor.Text,
                    fontSize: 28.sp,
                    raduis: 100.r,
                    onTap: () async {
                      // Fetch food data inside onTap
                      final food =
                          await cartController.fetchFood(cart.productId.id);

                      if (food != null) {
                        final selectedItems = cart.additives
                            .map((additive) =>
                                convertAdditiveToSelectedItem(additive))
                            .toList();
                        Get.to(
                          () => CheckoutPage(
                            food: food,
                            selectedItems: selectedItems,
                          ),
                        );
                      } else {
                        // Handle the case where food data couldn't be fetched
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
