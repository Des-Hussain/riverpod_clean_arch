import 'dart:async';
import 'dart:ui';

import 'package:riverpod_clean_arch/app/app_router.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:riverpod_clean_arch/presentation/providers/app_router_provider.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../common/resources/colors.dart';

enum SnackBarType { warn, error, info, success }

class UIFeedback {
  UIFeedback._();

  static Future<bool?> showAlertDialog(
    BuildContext context, {
    bool isMessageWidget = false,
    Widget? messageWidget,
    bool isTap = false,
    VoidCallback? tapOk,
    required String title,
    required String message,
    required IconData icon,
    String cancelBtnText = 'Cancel',
    String okBtnText = 'Ok',
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Stack(
          children: [
            // Blurred background
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.transparent.withOpacity(0.2),
                ),
              ),
            ),
            // AlertDialog
            AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              title: Column(
                children: [
                  Icon(
                    icon,
                    size: 80,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isMessageWidget
                      ? messageWidget!
                      : Text(
                          message,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                          ),
                          onPressed: isTap
                              ? tapOk
                              : () => Navigator.pop(context, true),
                          child: Text(
                            okBtnText,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: AppColors.blackish, fontSize: 15),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(
                            cancelBtnText,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: AppColors.blackish, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static message(
      {required String message,
      SnackBarType type = SnackBarType.error,
      bool? showConfirmBtn}) async {
    toastification.dismissAll();
    toastification.show(
      context: globalContext,
      // optional if you use ToastificationWrapper
      type: ToastificationType.success,
      style: ToastificationStyle.minimal,
      autoCloseDuration: const Duration(seconds: 5),
      // you can also use RichText widget for title and description parameters
      description: CommonText(
        text: message,
        fontSize: 18,
      ),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      icon: type == SnackBarType.error
          ? const Icon(Icons.cancel)
          : type == SnackBarType.warn
              ? const Icon(Icons.warning_amber_rounded)
              : type == SnackBarType.success
                  ? const Icon(Icons.check_circle_outline)
                  : const Icon(Icons.info_outline),
      primaryColor: type == SnackBarType.error
          ? AppColors.redColor
          : type == SnackBarType.warn
              ? AppColors.orange
              : type == SnackBarType.success
                  ? AppColors.green
                  : AppColors.blue,
      backgroundColor: AppColors.white,
      // foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) =>
            toastification.dismissById(toastItem.id),
        onAutoCompleteCompleted: (toastItem) =>
            print('Toast ${toastItem.id} auto complete completed'),
        onDismissed: (toastItem) => false,
      ),
    );
  }
}
