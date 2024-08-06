import 'package:flutter/cupertino.dart';

import '../resources/colors.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    super.key,
    required this.text,
    this.leftMargin = 0,
    this.topMargin = 0,
    this.rightMargin = 0,
    this.bottomMargin = 0,
    this.alignment = Alignment.centerLeft,
    this.textAlign,
    this.color = AppColors.black,
    this.weight,
    this.fontFamily = 'Poppins',
    this.fontSize,
    this.letterSpacing,
    this.textHeight,
  });

  final String text;
  final double? leftMargin;
  final double topMargin;
  final double rightMargin;
  final double bottomMargin;
  final Alignment? alignment;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? weight;
  final double? fontSize;
  final String? fontFamily ;
  final double? letterSpacing;
  final double? textHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      margin: EdgeInsets.only(
          left: leftMargin!,
          top: topMargin,
          right: rightMargin,
          bottom: bottomMargin),
      child: Align(
        alignment: alignment!,
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontWeight: weight,
            fontSize: fontSize,
            color: color,
            letterSpacing: letterSpacing,
            fontFamily: fontFamily,
            height: textHeight,
          ),
        ),
      ),
    );
  }
}
