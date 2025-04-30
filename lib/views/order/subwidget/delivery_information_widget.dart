import 'package:chopnow/common/capitalized_text.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/controllers/address_controller.dart';
import 'package:chopnow/controllers/checkout_controller.dart';
import 'package:chopnow/views/order/subwidget/contact_information.dart';
import 'package:chopnow/views/order/subwidget/delivery_address.dart';
import 'package:chopnow/views/order/subwidget/icon_name_icon.dart';
import 'package:chopnow/views/order/subwidget/icon_name_icon_address.dart';
import 'package:chopnow/views/order/subwidget/tezt_widget.dart';
import 'package:chopnow/views/profile/widget/addresses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

void showCustomBottomSheet(BuildContext context, Widget content, double height) {
  showModalBottomSheet(
     backgroundColor: Tcolor.White,
    context: context,
    enableDrag: false,
    isDismissible: false,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
    ),
    builder: (context) => Container(
      constraints: BoxConstraints(
        maxHeight: height,
      ),
      // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: content,
      ),
    ),
  );
}

String truncateWithEllipsis(String input, {int maxLength = 20}) {
  if (input.length <= maxLength) {
    return input;
  }
  return input.substring(0, maxLength) + '...';
}

class DeliveryInformationWidget extends StatelessWidget {
  const DeliveryInformationWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  final String firstName;
  final String lastName;
  final String phone;

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    var address = box.read('defaultAdd');
    final CheckoutController controller = Get.put(CheckoutController());
    final AddressController addressController = Get.put(AddressController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReuseableText(
            title: "Delivery information",
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              color: Tcolor.Text,
            ),
          ),
          SizedBox(height: 50.h),
          Obx(
            () => GestureDetector(
              onTap: () {
                showCustomBottomSheet(
                  context,
                  const ContactInformation(),
                  1200.h, // Set the height for this bottom sheet
                );
              },
              child: IconNameIcon(
                name: controller.fullnameNote.value.isNotEmpty
                    ? controller.fullnameNote.value
                    : "${capitalizeFirstLetter(firstName)} ${capitalizeFirstLetter(lastName)}",
                icon: HeroiconsOutline.userCircle,
                icon2: HeroiconsOutline.pencil,
              ),
            ),
          ),
          Obx(
            () => TeztWidget(
                text: controller.phoneNote.value.isNotEmpty
                    ? controller.phoneNote.value
                    : phone),
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () {
              Get.to(() => DeliverAddress());
            },
            child: Obx(() => IconNameIconAddress(
              name: truncateWithEllipsis(addressController.selectedAddress.value.isNotEmpty
                  ? addressController.selectedAddress.value
                  : address),
              icon: HeroiconsOutline.mapPin,
              icon2: HeroiconsOutline.pencil,
            ),)
          ),
          Obx(
            () => TeztWidget(
              text: addressController.selectedAddress.value.isNotEmpty
                  ? addressController.selectedAddress.value
                  : box.read('defaultAdd') ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
