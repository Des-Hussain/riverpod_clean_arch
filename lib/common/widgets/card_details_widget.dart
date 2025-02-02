import 'package:riverpod_clean_arch/common/enums/card_type.dart';
import 'package:flutter/material.dart';

import '../../data/models/card_details.dart';
import '../constants.dart';
import '../resources/colors.dart';

extension StringExtensions on String {
  String get securedString {
    if (length > 4) {
      return "**** ${substring(length - 4)}";
    } else {
      return this;
    }
  }
}

class CardDetailsWidget extends StatelessWidget {
  final CardDetails cardDetails;

  const CardDetailsWidget({Key? key, required this.cardDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.defaultLightWhiteColor,
        borderRadius: Constants.defaultBorderRadius,
      ),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Image(
              image: cardDetails.cardType.image,
              height: 30,
            ),
          ),
          Expanded(
            child: Text(
              cardDetails.cardNumber.securedString,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
