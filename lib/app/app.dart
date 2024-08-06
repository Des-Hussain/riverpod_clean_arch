import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/resources/strings.dart';
import 'package:riverpod_clean_arch/presentation/providers/app_router_provider.dart';
import 'package:toastification/toastification.dart';


class RiverpodCleanArch extends HookConsumerWidget {
  const RiverpodCleanArch({super.key});

  void setSystenPreferences() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setSystenPreferences();
    final router = ref.watch(routerProvider);
    return ToastificationWrapper(
      child: MaterialApp.router(
        // scrollBehavior: const MaterialScrollBehavior().copyWith(
        //     dragDevices: {
        //       PointerDeviceKind.touch,
        //       PointerDeviceKind.mouse,
        //       PointerDeviceKind.invertedStylus,
        //       PointerDeviceKind.trackpad
        //     },
        //     physics: ClampingScrollPhysics(
        //       parent: AlwaysScrollableScrollPhysics(),
        //     )),

        theme: ThemeData(
          fontFamily: 'Garamond',
        ),
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        // builder: DevicePreview.appBuilder,
        // routerDelegate: router.routerDelegate,
        // routeInformationProvider: router.routeInformationProvider,
        // routeInformationParser: router.routeInformationParser,
        routerConfig: router,
      ),
    );
  }
}
