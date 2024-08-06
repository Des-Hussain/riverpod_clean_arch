import 'package:riverpod_clean_arch/app/utils/common_spacing.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/custom_text_field.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isReadOnly,
    this.validation,
    this.label,
    this.suffixOnTap,
    this.suffixIcon,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final bool? isReadOnly;
  final String? Function(String?)? validation;
  final String? label;
  final VoidCallback? suffixOnTap;
  final IconData? suffixIcon;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          CommonText(
            text: label!,
            fontSize: 12,
            weight: FontWeight.w600,
          ),
        if (label != null) const VerticalSpacing(10),
        CustomTextField(
          isReadOnly: isReadOnly,
          controller: controller,
          textColor: AppColors.black,
          hintText: hintText,
          bgColor: AppColors.bgTextField,
          suffixIconColor: AppColors.grey,
          validator: validation,
          isOutlineBorder: true,
          outlineBorderColor: AppColors.transparent,
          focusedOutineBorder: false,
          suffixIcon: suffixIcon,
          suffixIconLogic: suffixOnTap,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
