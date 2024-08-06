// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../resources/colors.dart';
//
// class SocialLogin extends StatelessWidget {
//   const SocialLogin({
//     super.key, required this.icon, required this.onTap,
//   });
//   final String icon;
//   final VoidCallback onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap:onTap,
//       child: Container(
//         height: 53.h,
//         width: 87.w,
//         decoration: BoxDecoration(
//           color: AppColors.tertiary,
//           borderRadius: BorderRadius.circular(8),
//           // border: Border.all(color: AppColors.primaryColor,),
//
//         ),
//         child: Center(
//           child: SvgPicture.asset(icon),
//         ),
//       ),
//     );
//   }
// }