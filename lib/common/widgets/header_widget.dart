import 'package:riverpod_clean_arch/app/utils/common_spacing.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/custom_text_field.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:riverpod_clean_arch/presentation/providers/student_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';

class Header extends StatelessWidget {
  final List<Widget> children;
  final Widget suffix;
  final String title;
  final String? subTitle;
  final Widget searchWidget;
  final String pageLabel;

  const Header({
    Key? key,
    required this.suffix,
    required this.children,
    required this.title,
    this.subTitle,
    required this.pageLabel,
    required this.searchWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: Constants.defaultBorderRadius,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(Constants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CommonText(
                  text: pageLabel,
                  fontSize: 30,
                  weight: FontWeight.w700,
                ),
                searchWidget,
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (subTitle != null)
                      const SizedBox(
                        height: 15,
                        child: VerticalDivider(
                          thickness: 1.5,
                          color: AppColors.grey,
                        ),
                      ),
                    if (subTitle != null)
                      Text(
                        subTitle ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    const Spacer(),
                    suffix
                  ],
                ),
              ],
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
