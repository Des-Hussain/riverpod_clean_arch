import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../widgets/custom_text.dart';

class DialogBottomButton extends StatelessWidget {
  final String title;
  final VoidCallback function;
  final bool isGrey;
  final double width;
  final double height;
  final double fontSize;

  DialogBottomButton(
      {super.key,
        required this.function,
        required this.title,
        required this.isGrey,
        this.fontSize = 20,
        this.height = 48,
        this.width = 144});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: TextButton(
        onPressed: function,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isGrey ? AppColors.primaryColor : AppColors.transparent,
          ),
          side: MaterialStateProperty.all(
            const BorderSide(color: AppColors.primaryColor, width: 1),
          ),
        ),
        child: CommonText(
          alignment: Alignment.center,
          text: title,
          color: isGrey ? AppColors.white : AppColors.black.withOpacity(0.8),
          weight: FontWeight.w500,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
