
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/models/address_response_model.dart';
import 'package:chopnow/views/profile/widget/address_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressListWidget extends StatelessWidget {
  const AddressListWidget({super.key, required this.addresses, this.refetch});

  final List<AddressResponseModel> addresses;
  final Function()? refetch;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        final address = addresses[index];
        return Container(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          color: Tcolor.White,
          child: AddressTile(address: address, refetch: refetch,),
        );

      },
    );
  }
}