import 'dart:async';

import 'package:riverpod_clean_arch/data/repositories/auth_repository.dart';
import 'package:riverpod_clean_arch/data/services/local_storage_service.dart';
import 'package:riverpod_clean_arch/presentation/providers/screen_states.dart';
import 'package:riverpod_clean_arch/presentation/screens/auth_module/auth_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final authProviderNotifier = StateNotifierProvider<LoginController, AuthStates>(
  (ref) => LoginController(ref: ref, authRepository: GetIt.I<AuthRepository>()),
);

class LoginController extends StateNotifier<AuthStates> {
  LoginController({required this.ref, required this.authRepository})
      : super(AuthInitialState());

  final AuthRepository authRepository;
  final Ref ref;

  Future login({required String email, required String password}) async {
    try {
      state = AuthLoadingState();
      final response = await authRepository.loginUser(email, password);
      print('this ${response.role}');
      ref
          .read(userRoleProvider.notifier)
          .update((state) => response.role ?? '');
      LocalStorageService.instance.user = response;
      print(LocalStorageService.instance.user?.toJson());
      state = AuthSuccessState();
    } catch (e) {
      state = AuthErrorState(error: e.toString(), errorType: ErrorType.other);
    }
    return 0;
  }
}

final isLoggedIn = StateProvider<bool>((ref) => false);
final userRoleProvider = StateProvider<String>((ref) => '');
