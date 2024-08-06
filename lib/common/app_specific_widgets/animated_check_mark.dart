// import 'package:flutter/material.dart';
//
// class AnimatedCheck extends StatefulWidget {
//   @override
//   _AnimatedCheckState createState() => _AnimatedCheckState();
// }
//
// class _AnimatedCheckState extends State<AnimatedCheck>
//     with TickerProviderStateMixin {
//   late AnimationController scaleController = AnimationController(
//       duration: const Duration(milliseconds: 800), vsync: this);
//   late Animation<double> scaleAnimation =
//       CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
//   late AnimationController checkController = AnimationController(
//       duration: const Duration(milliseconds: 400), vsync: this);
//   late Animation<double> checkAnimation =
//       CurvedAnimation(parent: checkController, curve: Curves.linear);
//
//   @override
//   void initState() {
//     super.initState();
//     scaleController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         checkController.forward();
//       }
//     });
//     scaleController.forward();
//   }
//
//   @override
//   void dispose() {
//     scaleController.dispose();
//     checkController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double circleSize = 140;
//     double iconSize = 108;
//
//     return Stack(
//       children: [
//         Center(
//           child: ScaleTransition(
//             scale: scaleAnimation,
//             child: Container(
//               width: 315.w,
//               height: 301.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: AppColors.black,
//                 image: const DecorationImage(
//                   image: AssetImage(Drawables.checkMarkBg),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizeTransition(
//           sizeFactor: checkAnimation,
//           axis: Axis.horizontal,
//           axisAlignment: -1,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.check, color: Colors.white, size: iconSize),
//               SizedBox(
//                 height: 10.h,
//               ),
//               CustomText(
//                 text: 'Exercise added',
//                 fontWeight: FontWeight.w400,
//                 fontSize: 26,
//                 alignment: Alignment.center,
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
