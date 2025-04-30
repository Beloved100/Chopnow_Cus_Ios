import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, this.fontSize1, this.fontWeight1, this.color1, this.fontSize2, this.fontWeight2, this.color2, required this.title});
  final double? fontSize1;
  final FontWeight? fontWeight1;
  final Color? color1;
  final double? fontSize2;
  final FontWeight? fontWeight2;
  final Color? color2;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
           "₦",
          style: TextStyle(
            fontSize: fontSize1,
            fontWeight: fontWeight1,
            color: color1,
          ),
        ),
        ReuseableText(
          title: title,
          style: TextStyle(
            fontSize: fontSize2,
            fontWeight: fontWeight2,
            color: color2,
          ),
        ),
      ],
    );
  }
}
