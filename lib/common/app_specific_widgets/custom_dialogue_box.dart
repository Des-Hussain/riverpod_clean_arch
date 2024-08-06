import 'package:riverpod_clean_arch/common/app_specific_widgets/dialog_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../resources/colors.dart';
import '../resources/drawables.dart';

class CustomDialogBox extends StatelessWidget {
  final Widget body;
  final double width;
  final double titleWidth;
  final double height;
  final String title;
  final void Function() onTap;
  final String buttonText;

  const CustomDialogBox({
    Key? key,
    required this.body,
    this.width = 600,
    this.height = 600,
    required this.title,
    this.titleWidth = 468,
    required this.onTap,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.lerp(
                    BorderRadius.circular(16), BorderRadius.circular(0), 0.7),
              ),
              height: 64,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset(Drawables.cancelIcon),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: body),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DialogBottomButton(
                    function: onTap,
                    title: buttonText,
                    isGrey: true,
                    width: 170,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DialogBottomButton(
                    function: () {
                      context.pop();
                    },
                    title: 'Cancel',
                    isGrey: false,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
