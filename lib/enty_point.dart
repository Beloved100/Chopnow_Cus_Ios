// ignore_for_file: library_private_types_in_public_api

import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_bottom_bar.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/controllers/cart_controller.dart';
import 'package:chopnow/views/cart/cart.dart';
import 'package:chopnow/views/home/home.dart';
import 'package:chopnow/views/profile/profile.dart';
import 'package:chopnow/views/profile/widget/profile_details.dart';
import 'package:chopnow/views/search/search.dart';
import 'package:chopnow/views/support/support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;

//    @override
//   void initState() {
//     super.initState();
//     // Check if there is an argument passed for the selected index
//     final args = Get.arguments;
//     if (args != null && args is int) {
//       _selectedIndex = args;
//     }
//   }

//   final List<Widget> pageList = const [
//     Hompage(),
//     SearchPage(),
//     CartPage(),
//     SupportPage(),
//     ProfilePage(),
//     ProfileDetails(),
//   ];

//   void _onNavItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(CartController());
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: pageList[_selectedIndex],
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: CustomBottomNav(
//               selectedIndex: _selectedIndex,
//               onItemTapped: _onNavItemTapped,
//             ),
//           ),
//           Positioned(
//             bottom: 20.sp, // Adjust the bottom margin to align with your bottom nav
//             left: 0,
//             right: 0,
//             child: Center(
//               child: SizedBox(
//                 height: 80.h,
//                 width: 80.h,
//                 child: Stack(
//                   children: [
//                     FloatingActionButton(
//                       onPressed: () {
//                         setState(() {
//                           _selectedIndex = 2; // Set index to CartPage
//                         });
//                       },
//                       backgroundColor: Color.fromRGBO(255, 184, 0, 1),
//                       shape: const CircleBorder(),
//                       child: Icon(
//                         HeroiconsMini.shoppingBag,
//                         color: Tcolor.Text,
//                         size: 50.sp,
//                       ),
//                     ),
//                     if(_selectedIndex == 2)
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Tcolor.Text
//                         ),
//                         height: 30.h,
//                         width: 30.h,
//                         child: Center(
//                           child: Obx(() => ReuseableText(
//                             title: controller.totalCartItem.value.toString(),
//                             style: TextStyle(
//                               fontSize: 22.sp,
//                               color: Tcolor.Primary_New,
//                               fontWeight: FontWeight.w500

//                             )
//                           ),)

//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Check if there is an argument passed for the selected index
    final args = Get.arguments;
    if (args != null && args is int) {
      _selectedIndex = args;
    }
  }

  final List<Widget> pageList = const [
    Hompage(),
    SearchPage(),
    CartPage(),
    SupportPage(),
    ProfilePage(),
    ProfileDetails(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Scaffold(
      body: pageList[_selectedIndex],

      // Assigning the CustomBottomNav to bottomNavigationBar
      bottomNavigationBar: Stack(
        children: [
          CustomBottomNav(
            selectedIndex: _selectedIndex,
            onItemTapped: _onNavItemTapped,
          ),
          Positioned(
              bottom: 10
                  .sp, // Adjust the bottom margin to align with your bottom nav
              left: 0,
              right: 0,
              child: Center(
                  child: SizedBox(
                      height: 80.h,
                      width: 80.h,
                      child: Stack(children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 2; // Set index to CartPage
                            });
                          },
                          backgroundColor: Color.fromRGBO(255, 184, 0, 1),
                          shape: const CircleBorder(),
                          child: Icon(
                            HeroiconsMini.shoppingBag,
                            color: Tcolor.Text,
                            size: 50.sp,
                          ),
                        ),
                        if (_selectedIndex == 2)
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Tcolor.Text),
                              height: 30.h,
                              width: 30.h,
                              child: Center(
                                  child: Obx(
                                () => ReuseableText(
                                    title: controller.totalCartItem.value
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 22.sp,
                                        color: Tcolor.Primary_New,
                                        fontWeight: FontWeight.w500)),
                              )),
                            ),
                          )
                      ]))))
        ],
      ),
    );
  }
}
