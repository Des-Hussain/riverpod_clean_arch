// import 'package:riverpod_clean_arch/common/resources/colors.dart';
// import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
// import 'package:flutter/material.dart';
//
// class StudentListHeader extends StatelessWidget {
//   StudentListHeader({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           color: AppColors.primaryColor.withOpacity(0.4),
//           borderRadius: BorderRadius.circular(12)
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(
//             headerList.length,
//             (index) => Expanded(
//               child: CommonText(
//                 alignment: Alignment.center,
//                 text: headerList[index],
//                 weight: FontWeight.w600,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
