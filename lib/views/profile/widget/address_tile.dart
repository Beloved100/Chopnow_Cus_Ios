import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/controllers/address_controller.dart';
import 'package:chopnow/models/address_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key, required this.address, this.refetch});

  final AddressResponseModel address;
  final Function()? refetch;

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressController());
    return Container(
      color: Tcolor.White,
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 450.h,
              child: GestureDetector(
                onTap: () {
                  addressController.setDefaultAddress(address.id, refetch!);
                },
                child: ReuseableText(
                  title: address.addressLine1,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 28.sp,
                      color: Tcolor.Text),
                ),
              ),
            ),
            Row(
              children: [
                if (address.addressResponseModelDefault == true)
                  Icon(
                    HeroiconsSolid.check,
                    size: 32.sp,
                    color: Tcolor.SUCCESS_Reg,
                  ),
    
                  SizedBox(width: 20.w,),
                Container(
                  height: 56.sp,
                  width: 56.sp,
                  decoration: BoxDecoration(
                    color: Tcolor.ERROR_Light_1,
                    borderRadius: BorderRadius.circular(100.r)
                  ),
                  child: GestureDetector(
                    onTap: () {
                      addressController.deleeAddress(address.id, refetch!);
                    },
                    child: Icon(
                                      HeroiconsOutline.trash,
                                      size: 32.sp,
                                      color: Tcolor.ERROR_Reg,
                                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
