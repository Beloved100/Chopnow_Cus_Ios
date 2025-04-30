import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  int currentPage = 0;
  void nextPage() {
    if (currentPage < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // If on the last page, you might want to navigate to another screen or handle it differently.
      // For example:
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  
    }
  }


  Color? getButtonColor(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return Tcolor.Primary_New;
      case 1:
        return Tcolor.SECONDARY_Button_Color;
      case 2:
      default:
        return Tcolor.Primary_New;
    }
  }

  dynamic getBoxShadow(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return [
                BoxShadow(
                  color: Tcolor.PRIMARY_Button_Inner_Shadow, // Default shadow color
              offset: const Offset(0, -1), // Default shadow position
              blurRadius: 1, // Default shadow blur radius
              spreadRadius: 0, // Default shadow spread radius
                )
              ];
      case 1:
        return [
                BoxShadow(
                  color: Tcolor.Secondary_Inner_Button, // Default shadow color
              offset: const Offset(0, -1), // Default shadow position
              blurRadius: 1, // Default shadow blur radius
              spreadRadius: 0, // Default shadow spread radius
                )
              ];
      case 2:
      default:
        return [BoxShadow(
                  color: Tcolor.PRIMARY_Button_Inner_Shadow, // Default shadow color
              offset: const Offset(0, -1), // Default shadow position
              blurRadius: 1, // Default shadow blur radius
              spreadRadius: 0, // Default shadow spread radius
                )
              ];
    }
  }

  Color getButtonTextColor(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return Tcolor.Text;
      case 1:
        return Tcolor.TEXT_White;
      case 2:
      default:
        return Tcolor.Text;
    }
  }
  Color getArrowColor(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return Tcolor.Text;
      case 1:
        return Tcolor.TEXT_White;
      case 2:
      default:
        return Tcolor.Text;
    }
  }
}