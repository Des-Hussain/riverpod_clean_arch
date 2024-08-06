import 'package:riverpod_clean_arch/common/utils/common_functions.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';

import '../widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? btnColor;
  final Color? textColor;
  final double? h;
  final double? w;
  final double? m;
  final Border? border;
  final double? circularBorderRadius;
  final bool? isIcon;
  final IconData? icon;
  final Color? iconColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.btnColor = AppColors.primaryColor,
    this.textColor = AppColors.fourthColor,
    this.border,
    this.h = 0.07,
    this.w = 0.8,
    this.m = 40,
    this.circularBorderRadius = 24,
    this.isIcon = false,
    this.icon,
    this.iconColor = AppColors.fourthColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: CommonFunctions.deviceHeight(context) * h!,
        width: CommonFunctions.deviceWidth(context) * w!,
        margin: EdgeInsets.symmetric(horizontal: m!),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circularBorderRadius!),
          color: btnColor,
          border: border,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: text,
              fontSize: 18,
              weight: FontWeight.w700,
              color: textColor,
            ),
            if (isIcon!)
              Icon(
                icon,
                color: iconColor,
              ),
          ],
        ),
      ),
    );
  }
}
