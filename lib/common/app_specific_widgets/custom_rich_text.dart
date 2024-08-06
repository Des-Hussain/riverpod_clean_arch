import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/text_styles.dart';

class CustomRichText extends StatelessWidget {
  final String text1;
  final String? text2;
  final VoidCallback? onTap;

  const CustomRichText({
    super.key,
    required this.text1,
    this.text2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: text1,
            style: manropeSubTitleTextStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
              color: AppColors.fourthColor,
            ),
          ),
          TextSpan(
            text: text2,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: manropeSubTitleTextStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.primaryColor,
                decoration: TextDecoration.underline),
          ),
        ]),
      ),
    );
  }
}
