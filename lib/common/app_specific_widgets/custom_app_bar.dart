// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../resources/colors.dart';
// import '../resources/drawables.dart';
// import 'custom_text.dart';
//
// AppBar customAppBar(
//     String screenNumber, BuildContext context, WidgetRef ref, bool isIcon) {
//   return AppBar(
//     automaticallyImplyLeading: false,
//     elevation: 0,
//     toolbarHeight: 80,
//     backgroundColor: AppColors.transparent,
//     title: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         GestureDetector(
//             onTap: () {
//               // ref.read(screenNumberIndexProvider.notifier).state--;
//               // context.pop();
//             },
//             child: isIcon
//                 ? Image.asset(Drawables.backButton)
//                 : CustomText(
//                     text: 'Cancel',
//                     fontSize: 18,
//                     fontWeight: FontWeight.w400,
//                   )),
//         if (screenNumber.isNotEmpty)
//           CustomText(
//             text: '$screenNumber of 6',
//             fontSize: 18.sp,
//             fontWeight: FontWeight.w400,
//           )
//       ],
//     ),
//   );
// }
