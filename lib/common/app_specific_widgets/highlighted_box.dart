import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Highlightedbox extends StatelessWidget {
  const Highlightedbox({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FittedBox(
        child: Container(
          height: 34.h,
          decoration: BoxDecoration(
            color: const Color(0x33828ef7),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 5.w,
              ),
              const CircleAvatar(
                radius: 5,
                backgroundColor: AppColors.primaryColor,
              ),
              CommonText(
                text: text,
                leftMargin: 10,
                rightMargin: 10,
                alignment: Alignment.center,
                fontSize: 14,
                weight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
