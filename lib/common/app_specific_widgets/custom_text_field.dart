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
  final bool? isReadOnly;
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
    this.isReadOnly,
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
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      maxLength: maxLength,
      maxLines: maxLines,
      inputFormatters: textInputFormatterList,
      textInputAction: textInputAction,
      onEditingComplete: onSubmit,
      focusNode: focusNode,
      readOnly: isReadOnly ?? false,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscure!,
      keyboardType: textInputType,
      validator: validator ?? _defaultValidator,
      onTap: onTap,
      style: manropeSubTitleTextStyle.copyWith(color: textColor),
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: fieldHeight, vertical: fieldWidth),
        filled: true,
        fillColor: bgColor,
        errorText: isFieldValid ? null : errorText ?? '',
        hintText: hintText,
        hintStyle: manropeSubTitleTextStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: hintextColor,
        ),
        errorStyle: const TextStyle(
          fontSize: 10.5,
        ),
        labelText: labelText,
        labelStyle: manropeSubTitleTextStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.lightBlack,
        ),
        border: isOutlineBorder
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
          borderRadius: BorderRadius.circular(8),
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
