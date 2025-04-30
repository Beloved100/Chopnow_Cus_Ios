
// // // import 'package:flutter/material.dart';

// // // class EditPinPageView extends StatefulWidget {
// // //   const EditPinPageView({super.key});

// // //   @override
// // //   State<EditPinPageView> createState() => _EditPinPageViewState();
// // // }

// // // class _EditPinPageViewState extends State<EditPinPageView> {
// // //   final PageController _pageController = PageController();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       child: ListView(
// // //         children: [
// // //           SizedBox(
// // //             height: height / 1.25,
// // //             width: width,
// // //             child: PageView(
// // //               controller: _pageController,
// // //               physics: const NeverScrollableScrollPhysics(),
// // //               pageSnapping: false,
// // //               children: [
// // //                 LoginPage(next: () {
// // //                      _pageController.nextPage(
// // //                       duration: const Duration(milliseconds: 300),  // Reduced duration
// // //                       curve: Curves.easeIn,
// // //                     );
                  
// // //                 }),
// // //                 const LoginPinPage()
// // //               ],
// // //             ),
// // //           )
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }










// // this is my controller: import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
// // import 'package:chopnow_new_customer_app/views/profile/widget/confim_profile_pin.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:get/get.dart';
// // import 'package:get_storage/get_storage.dart';

// // class ChangeProfilePin extends GetxController {
// //   final box = GetStorage();
// //   RxBool _isLoading = false.obs;
// //   bool get isLoading => _isLoading.value;

// //   set setLoading(bool newState) {
// //     _isLoading.value = newState;
// //   }

// //   var pin1 = ''.obs;
// //   var pin2 = ''.obs;

// //   void handleKeyPress1(String value) {
// //     if (pin1.value.length < 4) {
// //       pin1.value += value;
// //       if (pin1.value.length == 4) {
// //         submitPin1(); // Automatically submit when 4 digits are entered
// //       }
// //     }
// //   }

// //   void handleKeyPress2(String value) {
// //     if (pin2.value.length < 4) {
// //       pin2.value += value;
// //       if (pin1.value.length == 4) {
// //         submitPin2(); // Automatically submit when 4 digits are entered
// //       }
// //     }
// //   }

// //   void clearPin1() {
// //     pin1.value = '';
// //   }

// //   void clearPin2() {
// //     pin2.value = '';
// //   }

// //   void submitPin1() async {
// //     if (pin1.value.length == 4) {
// //       showModalBottomSheet(
// //         backgroundColor: Tcolor.White,
// //         context: context,
// //         isScrollControlled: true,
// //         shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
// //         ), builder: (BuildContext context) => const ConfirmProfilePage(),
        
// //       );
// //     }
// //   }

// //   void submitPin2() async {
// //     // if (pin.value.length == 4) {
// //     //   // PIN is complete, handle the submission

// //     //   // print("Submitted PIN: ${pin.value}/ phoneNumber: $phone");
// //     //   // Get.offAll(() => NextScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 700));
// //     // }
// //   }
// // }
// // and this is my profile_pin: import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
// // import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
// // import 'package:chopnow_new_customer_app/views/common/size.dart';
// // import 'package:chopnow_new_customer_app/views/controllers/change_profile_pin.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:get/get.dart';
// // import 'package:heroicons_flutter/heroicons_flutter.dart';

// // class EditProfilePin extends StatelessWidget {
// //   const EditProfilePin({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final controller = Get.put(ChangeProfilePin());
// //     return Container(
// //       width: width,
// //       height: 1200.h,
// //       child: SingleChildScrollView(
// //         child: Padding(
// //           padding: EdgeInsets.only(left: 20.w, right: 20.w),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   ReuseableText(
// //                     title: "Update phone number",
// //                     style: TextStyle(
// //                         fontWeight: FontWeight.w500,
// //                         fontSize: 32.sp,
// //                         color: Tcolor.Text),
// //                   ),
// //                   Container(
// //                     height: 70.h,
// //                     width: 70.w,
// //                     decoration: BoxDecoration(
// //                       color: Tcolor.BACKGROUND_Dark,
// //                       borderRadius: BorderRadius.circular(60.r),
// //                     ),
// //                     child: Center(
// //                       child: IconButton(
// //                         onPressed: () {
// //                           Get.back();
// //                         },
// //                         icon: Icon(
// //                           HeroiconsOutline.xMark,
// //                           color: Tcolor.Text,
// //                           size: 32.sp,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               SizedBox(
// //                 height: 60.h,
// //               ),
// //               ReuseableText(
// //                 title: "Enter new PIN",
// //                 style: TextStyle(
// //                     fontWeight: FontWeight.w700,
// //                     fontSize: 40.sp,
// //                     color: Tcolor.Text),
// //               ),
        
// //               SizedBox(height: 120.h),
        
// //               Center(
// //                 child: SvgPicture.asset(
// //                   "assets/img/lock_icon.svg", // Replace with your lock icon asset
// //                   height: 75.h,
// //                   width: 75.h,
// //                 ),
// //               ),
// //               SizedBox(height: 50.h), // Space between icon and PIN input
// //               Center(
// //                 child: Obx(() => PinDots(pinLength: controller.pin1.value.length)),
// //               ),
// //               SizedBox(height: 80.h),
// //               Center(
// //                 child: PinPad(
// //                   onKeyPress: controller.handleKeyPress1,
// //                   onClear: controller.clearPin1,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }


// // class PinDots extends StatelessWidget {
// //   final int pinLength;

// //   const PinDots({super.key, required this.pinLength});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 60.h,
// //       width: 200.w,
// //       decoration: BoxDecoration(
// //         border: Border.all(color: Tcolor.BORDER_Light),
// //         borderRadius: BorderRadius.circular(20.r),
// //         color: Tcolor.BACKGROUND_Regaular,
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: List.generate(4, (index) {
// //           return Container(
// //             margin: EdgeInsets.symmetric(horizontal: 10.w),
// //             width: 20.w,
// //             height: 20.w,
// //             decoration: BoxDecoration(
// //               color: index < pinLength ? Tcolor.Primary : Colors.transparent,
// //               shape: BoxShape.circle,
// //               border: Border.all(color: Tcolor.BORDER_Regular, width: 1.5.w),
// //             ),
// //           );
// //         }),
// //       ),
// //     );
// //   }
// // }

// // class PinPad extends StatelessWidget {
// //   final void Function(String) onKeyPress;
// //   final void Function() onClear;

// //   const PinPad({
// //     super.key,
// //     required this.onKeyPress,
// //     required this.onClear,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       mainAxisSize: MainAxisSize.min,
// //       children: [
// //         _buildRow(['1', '2', '3']),
// //         SizedBox(height: 40.h), // Space between rows
// //         _buildRow(['4', '5', '6']),
// //         SizedBox(height: 40.h), // Space between rows
// //         _buildRow(['7', '8', '9']),
// //         SizedBox(height: 40.h), // Space between rows
// //         _buildRow([null, '0', HeroiconsSolid.backspace]),
// //       ],
// //     );
// //   }

// //   Widget _buildRow(List<dynamic> buttons) {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //       children: buttons.map((button) {
// //         if (button == null) {
// //           return SizedBox(width: 118.w); // Spacer for layout
// //         }
// //         return _PinButton(
// //           label: button is String ? button : null,
// //           icon: button is IconData ? button : null,
// //           onPress: () {
// //             if (button is String) {
// //               onKeyPress(button);
// //             } else if (button == HeroiconsSolid.backspace) {
// //               onClear();
// //             }
// //           },
// //         );
// //       }).toList(),
// //     );
// //   }
// // }

// // class _PinButton extends StatefulWidget {
// //   final String? label;
// //   final IconData? icon;
// //   final void Function()? onPress;

// //   const _PinButton({this.label, this.icon, this.onPress});

// //   @override
// //   __PinButtonState createState() => __PinButtonState();
// // }

// // class __PinButtonState extends State<_PinButton> {
// //   bool _isPressed = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTapDown: (_) => _updatePressed(true),
// //       onTapUp: (_) => _updatePressed(false),
// //       onTapCancel: () => _updatePressed(false),
// //       onTap: widget.onPress,
// //       child: AnimatedContainer(
// //         duration: const Duration(milliseconds: 100),
// //         height: 100.h,
// //         width: 100.h,
// //         alignment: Alignment.center,
// //         decoration: BoxDecoration(
// //           shape: widget.icon == HeroiconsSolid.backspace ? BoxShape.rectangle : BoxShape.circle,
// //           borderRadius: widget.icon == HeroiconsSolid.backspace ? BorderRadius.circular(8.r) : null,
// //           color: _isPressed ? Tcolor.White.withOpacity(0.9) : Tcolor.White,
// //           boxShadow: _isPressed
// //               ? [
// //                   BoxShadow(
// //                     color: Colors.grey.withOpacity(0.5),
// //                     spreadRadius: 2,
// //                     blurRadius: 10,
// //                     offset: const Offset(0, 4),
// //                   ),
// //                 ]
// //               : [],
// //           border: widget.icon == HeroiconsSolid.backspace
// //               ? Border.all(color: Colors.transparent, width: 0)
// //               : Border.all(color: Tcolor.BORDER_Light, width: 1.5),
// //         ),
// //         margin: EdgeInsets.symmetric(horizontal: 8.w),
// //         padding: EdgeInsets.all(4.w),
// //         child: widget.label != null
// //             ? ReuseableText(
// //                 title: widget.label!,
// //                 style: TextStyle(
// //                   fontSize: 32.sp,
// //                   fontWeight: FontWeight.w700,
// //                   color: Tcolor.Text,
// //                 ),
// //               )
// //             : Icon(
// //                 widget.icon,
// //                 size: 28.sp,
// //                 color: Tcolor.TEXT_Placeholder,
// //               ),
// //       ),
// //     );
// //   }

// //   void _updatePressed(bool pressed) {
// //     setState(() {
// //       _isPressed = pressed;
// //     });
// //   }
// // }
// // I want to display a bottom sheet when the  pin1.value.length == 4 but I ran into issues


















































// this is my foodPage import 'package:cached_network_image/cached_network_image.dart';
// import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
// import 'package:chopnow_new_customer_app/views/common/custom_button.dart';
// import 'package:chopnow_new_customer_app/views/common/custom_circular_checkbox.dart';
// import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
// import 'package:chopnow_new_customer_app/views/common/row_icon.dart';
// import 'package:chopnow_new_customer_app/views/common/size.dart';
// import 'package:chopnow_new_customer_app/views/controllers/food_controller.dart';
// import 'package:chopnow_new_customer_app/views/models/food_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// import 'package:get/get.dart';

// class FoodPage extends StatefulWidget {
//   const FoodPage({super.key, this.food});

//   final FoodModel? food;

//   @override
//   State<FoodPage> createState() => _FoodPageState();
// }

// class _FoodPageState extends State<FoodPage> {
//   // Track the checked state for each additive
//   final Map<String, bool> _isChecked = {};

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the checked state map with default values
//     widget.food?.additive.forEach((additive) {
//       _isChecked[additive.title] = false; // Default to false
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(FoodController());
//     return Scaffold(
//       backgroundColor: Color.fromARGB(31, 246, 243, 243),
//       body: Container(
//         height: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(60.r),
//             topRight: Radius.circular(60.r),
//           ),
//           color: Tcolor.White,
//         ),
//         child: Column(
//           children: [
//             // Image section
//             ClipRRect(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(60.r),
//                 topRight: Radius.circular(60.r),
//               ),
//               child: Stack(
//                 children: [
//                   SizedBox(
//                     height: 400.h,
//                     width: double.infinity,
//                     child: PageView.builder(
//                       itemCount: widget.food!.imageUrl.length,
//                       itemBuilder: (context, i) {
//                         return Container(
//                           color: Tcolor.White,
//                           child: CachedNetworkImage(
//                             fit: BoxFit.cover,
//                             imageUrl: widget.food!.imageUrl[i],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: IconButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       icon: SvgPicture.asset(
//                         "assets/img/cancle.svg",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10.h),
//             // Scrollable section
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.all(30.sp),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ReuseableText(
//                         title: widget.food!.title,
//                         style: TextStyle(
//                           color: Tcolor.Text,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 36.sp,
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                       SizedBox(height: 15.h),
//                       ReuseableText(
//                         title: "\u20A6 ${widget.food!.price.toString()}",
//                         style: TextStyle(
//                           color: Tcolor.Text,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 28.sp,
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                       SizedBox(height: 15.h),
//                       ReuseableText(
//                         title: widget.food!.description,
//                         style: TextStyle(
//                           color: Tcolor.TEXT_Label,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 28.sp,
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                       SizedBox(height: 10.h),
//                       Divider(
//                         thickness: 2.w,
//                         color: Tcolor.BORDER_Light,
//                       ),
//                       SizedBox(height: 10.h),
//                       ReuseableText(
//                         title: "MAIN",
//                         style: TextStyle(
//                           fontSize: 28.sp,
//                           fontWeight: FontWeight.w500,
//                           color: Tcolor.TEXT_Label,
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ReuseableText(
//                             title: "Required",
//                             style: TextStyle(
//                               fontSize: 28.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Tcolor.ERROR_Reg,
//                             ),
//                           ),
//                           ReuseableText(
//                             title: "Add up to 5",
//                             style: TextStyle(
//                               fontSize: 28.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Tcolor.TEXT_Label,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 30.h),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           RowIcon(
//                             title: widget.food!.title,
//                             style: TextStyle(
//                               fontSize: 34.sp,
//                               fontWeight: FontWeight.w400,
//                               color: Tcolor.Text,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   controller.decrement();
//                                 },
//                                 child: Icon(
//                                   AntDesign.minuscircleo,
//                                   size: 36.sp,
//                                   color: Tcolor.TEXT_Placeholder,
//                                 ),
//                               ),
//                               Padding(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 25.w),
//                                   child: Obx(
//                                     () => ReuseableText(
//                                       title: "${controller.count.value}",
//                                       style: TextStyle(
//                                         fontSize: 30.sp,
//                                         fontWeight: FontWeight.w400,
//                                         color: Tcolor.TEXT_Body,
//                                       ),
//                                     ),
//                                   )),
//                               GestureDetector(
//                                 onTap: () {
//                                   controller.increment();
//                                 },
//                                 child: Icon(
//                                   AntDesign.pluscircleo,
//                                   size: 36.sp,
//                                   color: Tcolor.TEXT_Body,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 80.w),
//                                 child: ReuseableText(
//                                   title:
//                                       "\u20A6 ${widget.food!.price.toString()}",
//                                   style: TextStyle(
//                                     color: Tcolor.TEXT_Label,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 28.sp,
//                                     decoration: TextDecoration.none,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 25.h),
//                       Divider(
//                         thickness: 2.w,
//                         color: Tcolor.BORDER_Light,
//                       ),
//                       SizedBox(height: 10.h),
//                       SizedBox(height: 10.h),
//                       Column(
//                         children: List.generate(
//                           widget.food!.additive.length,
//                           (index) {
//                             final additive = widget.food!.additive[index];
//                             return Padding(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 4.h), // Adjust vertical spacing
//                               child: ListTile(
//                                 minTileHeight: 10.h, // Minimal vertical padding
//                                 dense: true, // Reduce vertical size
//                                 contentPadding:
//                                     EdgeInsets.zero, // No internal padding
//                                 visualDensity:
//                                     VisualDensity.compact, // Compact density
//                                 leading: CustomCircularCheckbox(
//                                   value: _isChecked[additive.title] ?? false,
//                                   onChanged: (bool? value) {
//                                     setState(() {
//                                       _isChecked[additive.title] =
//                                           value ?? false;
//                                     });
//                                   },
//                                 ),
//                                 title: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     ReuseableText(
//                                       title: additive.title,
//                                       style: TextStyle(
//                                         color: Tcolor.TEXT_Label,
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 32.sp,
//                                         decoration: TextDecoration.none,
//                                       ),
//                                     ),
//                                     Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: List.generate(additive.options.length, (index) {
//                                         final options = additive.options[index];
//                                       return  ReuseableText(
//                                       title: options.name,
//                                       style: TextStyle(
//                                         color: Tcolor.TEXT_Label,
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 32.sp,
//                                         decoration: TextDecoration.none,
//                                       ),
//                                     );
//                                       })
                                        
                                        
                                      
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       SizedBox(height: 25.h),
//                       Divider(
//                         thickness: 2.w,
//                         color: Tcolor.BORDER_Light,
//                       ),
//                       SizedBox(height: 10.h),
//                       ReuseableText(
//                         title: "Additives And Toppings",
//                         style: TextStyle(
//                           color: Tcolor.TEXT_Label,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 32.sp,
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                       SizedBox(height: 10.h),
//                       Column(
//                         children: List.generate(
//                           widget.food!.additive.length,
//                           (index) {
//                             final additive = widget.food!.additive[index];
//                             return Padding(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 4.h), // Adjust vertical spacing
//                               child: ListTile(
//                                 minTileHeight: 10.h, // Minimal vertical padding
//                                 dense: true, // Reduce vertical size
//                                 contentPadding:
//                                     EdgeInsets.zero, // No internal padding
//                                 visualDensity:
//                                     VisualDensity.compact, // Compact density
//                                 leading: CustomCircularCheckbox(
//                                   value: _isChecked[additive.title] ?? false,
//                                   onChanged: (bool? value) {
//                                     setState(() {
//                                       _isChecked[additive.title] =
//                                           value ?? false;
//                                     });
//                                   },
//                                 ),
//                                 title: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     ReuseableText(
//                                       title: additive.title,
//                                       style: TextStyle(
//                                         fontSize: 28.sp,
//                                         fontWeight: FontWeight.w400,
//                                         color: Tcolor.Text,
//                                       ),
//                                     ),
//                                     ReuseableText(
//                                       title:
//                                           "\u20A6 12000", //${additive.price.toString()}
//                                       style: TextStyle(
//                                         color: Tcolor.TEXT_Label,
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 28.sp,
//                                         decoration: TextDecoration.none,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Divider(
//                         thickness: 2.w,
//                         color: Tcolor.BORDER_Light,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             height: 80.h,
//                             width: 180.w,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100.r),
//                               border: Border.all(color: Tcolor.BORDER_Light),
//                               color: Tcolor.White,
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.all(20.sp),
//                               child: Center(
//                                 child: Row(
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () {
//                                         print(" -1");
//                                       },
//                                       child: Icon(
//                                         AntDesign.minuscircleo,
//                                         size: 36.sp,
//                                         color: Tcolor.TEXT_Placeholder,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 25.w),
//                                       child: ReuseableText(
//                                         title: "1",
//                                         style: TextStyle(
//                                           fontSize: 30.sp,
//                                           fontWeight: FontWeight.w400,
//                                           color: Tcolor.TEXT_Body,
//                                         ),
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         print(" +1");
//                                       },
//                                       child: Icon(
//                                         AntDesign.pluscircleo,
//                                         size: 36.sp,
//                                         color: Tcolor.TEXT_Body,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           CustomButton(
//                             title: "₦10,000 | Add to cart",
//                             showArrow: false,
//                             btnHeight: 80.h,
//                             btnWidth: width / 1.8,
//                             raduis: 100.r,
//                             fontSize: 30.sp,
//                             textColor: Tcolor.Text,
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// this is my controller: import 'package:get/get.dart';

// class FoodController extends GetxController {
//   RxInt count = 1.obs;

//   void increment() {
//     count.value++;
//   }
//   void decrement() {
//     if (count.value > 1) {
//       count.value--;
//     }
//   }
// } and this is the kind ofdata I'm feeding into it: {
//     "_id": "6685fe4f8b813878ed92df29",
//     "title": "Okra",
//     "time": "10min",
//     "foodTags": [
//         "soup"
//     ],
//     "category": "667d10ff3493fe064acb0ba1",
//     "foodType": [
//         "Pasta"
//     ],
//     "code": "0987654321",
//     "isAvailable": false,
//     "restaurant": "668552324409ef9c2bb165eb",
//     "rating": 4.4,
//     "ratingCount": "270",
//     "description": "Traditional Soup",
//     "price": 1500,
//     "additive": [
//         {
//             "id": 1,
//             "title": "package",
//             "options": [
//                 {
//                     "name": "Big Plastic",
//                     "price": 150
//                 },
//                 {
//                     "name": "meduim Plastic",
//                     "price": 150
//                 },
//                 {
//                     "name": "small Plastic",
//                     "price": 150
//                 }
//             ]
//         },
//         {
//             "id": 2,
//             "title": "Swallow",
//             "options": [
//                 {
//                     "name": "Pounded Yam",
//                     "price": 1500
//                 },
//                 {
//                     "name": "FuFu",
//                     "price": 600
//                 },
//                 {
//                     "name": "Eba",
//                     "price": 700
//                 }
//             ]
//         },
//         {
//             "id": 2,
//             "title": "Protein",
//             "options": [
//                 {
//                     "name": "Meat",
//                     "price": 150
//                 },
//                 {
//                     "name": "Fish",
//                     "price": 150
//                 },
//                 {
//                     "name": "Ponmo",
//                     "price": 150
//                 }
//             ]
//         }
//     ],
//     "imageUrl": [
//         "https://firebasestorage.googleapis.com/v0/b/chop-now-71981.appspot.com/o/food_soup_1.png?alt=media&token=f6b7d27c-e1e4-48a7-bea0-171dad8a8b65",
//         "https://firebasestorage.googleapis.com/v0/b/chop-now-71981.appspot.com/o/food_soup_1.png?alt=media&token=f6b7d27c-e1e4-48a7-bea0-171dad8a8b65"
//     ],
//     "restaurant_category": "Soup",
//     "createdAt": "2024-07-04T01:43:43.703Z",
//     "updatedAt": "2024-07-04T01:43:43.703Z"
// }, after displaying the the food price and then into displaying the additives, I want to display title first as an header then under the title display the name and price. so this should be done in a way that the name and price are in a row. so in a row we have the checkbox the the name  the here there is the plus and minus icon for incrementing and decrementing and after this as be done, there is a divder and we move to the next content in the additve. this should be done for each member of the additives. also remove  the text "Additives And Toppings", secondly when selecting a checkbox, all the checkbox for that additive is selected, what I want be able to select the check box individually without having to select all the options. thirdly, whenever I tap on the incremental and incremental components everything  for both the additives and the one at the food title also, what I want  is ti increase or decrease them individually. also as each of the component is increased or decreased, ensure that the corresponding original price is also multiplied by the value of the increment or decrement, this should be handled at the getx controller. fourthly, the divider should be after each option as been displayed and also remove the add to cart from the bottomnavigationbar and let it be at the bottom of the screen