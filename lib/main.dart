import 'dart:io';

import 'package:riverpod_clean_arch/app/app.dart';
import 'package:riverpod_clean_arch/data/services/local_storage_service.dart';
import 'package:riverpod_clean_arch/di/injector.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  LocalStorageService.instance.init();

  Injector.setup();
  runApp(const ProviderScope(child: RiverpodCleanArch()));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
