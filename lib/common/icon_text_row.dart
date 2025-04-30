// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';

// class IconTextRow extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final double iconSize;
//   final Color? iconColor;
//   final TextStyle? textStyle;
//   final double space;
//   final VoidCallback? onTap;

//   const IconTextRow({
//     Key? key,
//     required this.icon,
//     required this.title,
//     this.iconSize,
//     this.iconColor,
//     this.textStyle,
//     required this.space,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             size: iconSize,
//             color: iconColor,
//           ),
//           SizedBox(width: space),
//           ReuseableText(
//             title: title,
//             style: TextStyle,
//           ),
//         ],
//       ),
//     );
//   }
// }
