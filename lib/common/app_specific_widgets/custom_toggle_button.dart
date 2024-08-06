import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

import '../resources/colors.dart';

final toggleButtonSelectedIndexProvider =
    StateNotifierProvider<ToggleButtonSelectedIndexNotifier, int>(
        (ref) => ToggleButtonSelectedIndexNotifier());

class ToggleButtonSelectedIndexNotifier extends StateNotifier<int> {
  ToggleButtonSelectedIndexNotifier() : super(0);

  void addIndex(int value) {
    state = value;
  }
}

class CustomToggleButton extends ConsumerStatefulWidget {
  CustomToggleButton(
      {Key? key,
      required this.label,
      required this.width,
      required this.borderRadius})
      : super(key: key);

  final List<String> label;
  final double width;
  final double borderRadius;

  @override
  ConsumerState<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends ConsumerState<CustomToggleButton> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(toggleButtonSelectedIndexProvider);
    return FlutterToggleTab(
      width: widget.width,
      borderRadius: widget.borderRadius,
      selectedIndex: selectedIndex,
      // selectedIndex: widget.index,
      begin: Alignment.centerLeft,
      unSelectedBackgroundColors: const [Color.fromRGBO(41, 41, 41, 1)],
      selectedBackgroundColors: const [Color(0xff786cff), Color(0xff4c90b0)],
      selectedTextStyle: const TextStyle(
        color: AppColors.fourthColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unSelectedTextStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labels: widget.label,
      selectedLabelIndex: (index) {
        setState(() {
          ref.watch(toggleButtonSelectedIndexProvider.notifier).addIndex(index);
        });
      },
    );
  }
}
