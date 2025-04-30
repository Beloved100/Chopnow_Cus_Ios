import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const PageIndicator({
    required this.currentPage,
    required this.pageCount,
    super.key,
  });

  Widget _buildDot(int index) {
    // Determine the fill and border colors based on the currentPage and index
    Color fillColor;
    Color borderColor;

    if (currentPage == 0) {
      // Page 0: Last two dots should be Tcolor.Primary
      fillColor = index == currentPage ? Tcolor.White : (index >= pageCount - 2 ? Tcolor.Primary : Tcolor.SECONDARY_S4);
      borderColor = Tcolor.Primary;
    } else if (currentPage == 1) {
      // Page 1: First and last dots should be Tcolor.SECONDARY_S4
      fillColor = index == currentPage ? Tcolor.White : (index == 0 || index == pageCount - 1 ? Tcolor.SECONDARY_Button : Tcolor.Primary);
      borderColor = Tcolor.SECONDARY_Button;
    } else if (currentPage == 2) {
      // Page 2: First two dots should be Tcolor.Primary
      fillColor = index == currentPage ? Tcolor.White : (index < 2 ? Tcolor.Primary : Tcolor.SECONDARY_S4);
      borderColor = Tcolor.Primary;
    } else {
      // Default: Use SECONDARY_S4 for all dots
      fillColor = Tcolor.SECONDARY_S4;
      borderColor = Tcolor.SECONDARY_S4;
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: currentPage == index ? 20.w : 12.w,
      height: currentPage == index ? 20.h : 12.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fillColor,
        border: Border.all(
          color: index == currentPage ? borderColor : Colors.transparent,
          width: 2.w,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the dots
      children: List.generate(pageCount, _buildDot),
    );
  }
}
