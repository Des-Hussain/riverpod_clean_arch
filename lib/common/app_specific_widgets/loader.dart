import 'package:riverpod_clean_arch/app/app_router.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/presentation/providers/app_router_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShowLoader {
  static bool isOpen = false;
  static showLoading(
    BuildContext context,
    // bool dismisss,
  ) {
    isOpen = true;
    return showDialog(
        context: globalContext!,
        barrierDismissible: false,
        builder: (context) {
          isOpen = true;
          return Container(
            width: 130,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            height: 130,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoActivityIndicator(
                  radius: 30,
                  color: AppColors.white,
                ),
              ],
            ),
          );
        }).then((value) {
      isOpen = false;
    });
  }

  static hideLoading(BuildContext context) {
    if (isOpen) {
      globalContext!.pop();
    }
  }
}
