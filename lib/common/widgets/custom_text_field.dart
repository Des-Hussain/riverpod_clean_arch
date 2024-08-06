import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/strings.dart';
import '../resources/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color hintextColor;
  final Color? textColor;
  String? labelText;
  final bool? obscure;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final double? m;
  final String? Function(String?)? validator;
  final VoidCallback? suffixIconLogic;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final VoidCallback? onTap;
  final bool? isReadONly;
  ValueChanged<String>? onChanged;
  TextInputAction? textInputAction;
  bool isFieldValid;
  String? errorText;
  FocusNode? focusNode;
  VoidCallback? onSubmit;
  List<TextInputFormatter>? textInputFormatterList;
  Color bgColor;
  Color outlineBorderColor;
  bool isOutlineBorder;
  double fieldHeight;
  double fieldWidth;
  Widget? prefixIcon;
  Widget? prefix;
  int? maxLines;
  int? maxLength;
  bool focusedOutineBorder;
  bool isInputBorderNone;
  double circularRadius;

  CustomTextField({
    super.key,
    required this.hintText,
    this.hintextColor = AppColors.grey,
    this.textColor = AppColors.black,
    this.labelText,
    this.obscure = false,
    this.controller,
    this.m = 40,
    this.textInputType,
    this.validator,
    this.suffixIconLogic,
    this.suffixIcon,
    this.suffixIconColor,
    this.onChanged,
    this.isFieldValid = true,
    this.errorText,
    this.onTap,
    this.isReadONly = false,
    this.focusNode,
    this.onSubmit,
    this.textInputAction,
    this.textInputFormatterList,
    this.bgColor = AppColors.fourthColor,
    this.isOutlineBorder = false,
    this.outlineBorderColor = AppColors.primaryColor,
    this.fieldHeight = 10,
    this.fieldWidth = 10,
    this.prefixIcon,
    this.prefix,
    this.maxLines = 1,
    this.maxLength,
    this.focusedOutineBorder = false,
    this.isInputBorderNone = false,
    this.circularRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      maxLines: maxLines,
      inputFormatters: textInputFormatterList,
      textInputAction: textInputAction,
      onEditingComplete: onSubmit,
      focusNode: focusNode,
      readOnly: isReadONly ?? false,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscure!,
      keyboardType: textInputType,
      validator: validator ?? _defaultValidator,
      onTap: onTap,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 2,
          color: textColor),
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: fieldHeight, vertical: fieldWidth),
        filled: true,
        fillColor: bgColor,
        errorText: isFieldValid ? null : errorText ?? '',
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: hintextColor,
        ),
        errorStyle: const TextStyle(
          fontSize: 10.5,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
        border: isInputBorderNone
            ? InputBorder.none
            : isOutlineBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: outlineBorderColor),
                  )
                : null,
        prefix: prefix,
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          icon: Icon(
            suffixIcon,
            color: suffixIconColor,
            // widget.obscure! == true ? Icons.visibility : Icons.visibility_off
          ),
          onPressed: suffixIconLogic,
        ),
        suffixIconColor: AppColors.primaryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(circularRadius),
          borderSide: BorderSide(
            color: focusedOutineBorder
                ? AppColors.primaryColor
                : AppColors.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
        enabledBorder: isOutlineBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: outlineBorderColor),
              )
            : null,
      ),
    );
  }

  String? _defaultValidator(String? value) {
    if (value?.trim() == null || value!.trim().isEmpty) {
      return 'Field is required';
    }
    // else if (!_isValidEmail(value.trim())) {
    //   return 'Please enter a valid email';
    // }
    return null;
  }

  bool _isValidEmail(String email) {
    String newEmail = email.trim();
    return Strings.emailRegex.hasMatch(newEmail);
  }
}
