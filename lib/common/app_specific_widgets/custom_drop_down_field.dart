import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomDropdownTextField extends StatelessWidget {
  final bool enabled;
  final int intValue;
  final String heading;

  final List<String> options;

  final String option2;
  final Object value;
  final double elevation;
  final Color? backgroundColor;
  final ValueChanged? onChanged;

  const CustomDropdownTextField(
      {Key? key,
      this.enabled = false,
      required this.intValue,
      required this.heading,
      required this.options,
      required this.option2,
      required this.value,
      required this.onChanged,
      this.elevation = 0,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          elevation: elevation,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primaryColor),
            child: DropdownButtonFormField(
              elevation: 1,
              value: value,
              items: List.generate(
                  options.length,
                  (index) => DropdownMenuItem(
                      value: index,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CommonText(
                          text: options[index],
                          fontSize: 18,
                          color: AppColors.black,
                        ),
                      ))),
              onChanged: onChanged,
              decoration: const InputDecoration(
                label: Text('Class'),
                filled: true,
                fillColor: AppColors.fourthColor,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              style: TextStyle(
                fontSize: 18,
                color:
                    enabled ? AppColors.primaryColor : AppColors.kGrayishColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
