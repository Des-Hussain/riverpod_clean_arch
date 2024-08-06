import 'dart:ui';

import 'package:riverpod_clean_arch/app/utils/ui_snackbars.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/custom_button.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/loader.dart';
import 'package:riverpod_clean_arch/common/mixins/validation.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/resources/drawables.dart';
import 'package:riverpod_clean_arch/common/resources/page_path.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text_field.dart';
import 'package:riverpod_clean_arch/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'auth_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with FieldsValidation {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController(text: 'admin');

  final _passwordController = TextEditingController(text: 'admin');

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Hero(
                  tag: Drawables.logo,
                  child: Image.asset(
                    Drawables.logo,
                  ),
                ),
              ),
              const VerticalDivider(
                indent: 170,
                endIndent: 170,
                color: AppColors.primaryColor,
              ),
              Center(
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      height: 400,
                      width: 400,
                      decoration: BoxDecoration(
                        color: const Color(0xfff4f4f4).withOpacity(0.92),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const CommonText(
                            alignment: Alignment.center,
                            text: 'Admin Login',
                            fontSize: 35,
                            weight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CommonText(
                            alignment: Alignment.center,
                            text:
                                'Enter your details to get sign in to your account',
                            fontSize: 15,
                            weight: FontWeight.w500,
                          ),
                          const Divider(
                            thickness: 2.5,
                            indent: 200,
                            endIndent: 200,
                            color: AppColors.lightBlack,
                          ),
                          SizedBox(
                            width: 300,
                            child: CustomTextField(
                              bgColor: AppColors.grey.withOpacity(0.07),
                              controller: _usernameController,
                              hintText: 'Enter your Username',
                              // validator: validateEmail,
                              focusedOutineBorder: true,
                              isInputBorderNone: true,
                              suffixIcon: Icons.person,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 300,
                            child: CustomTextField(
                              bgColor: AppColors.grey.withOpacity(0.07),
                              controller: _passwordController,
                              hintText: 'Enter your Password',
                              focusedOutineBorder: true,
                              outlineBorderColor: AppColors.primaryColor,
                              isInputBorderNone: true,
                              suffixIcon: isObscure
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              obscure: isObscure,
                              suffixIconColor: AppColors.greyTextColor,
                              suffixIconLogic: () {
                                isObscure = !isObscure;
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Consumer(
                            builder: (BuildContext context, WidgetRef ref,
                                Widget? child) {
                              ref.listen<AuthStates>(authProviderNotifier,
                                  (previous, screenState) async {
                                if (screenState is AuthErrorState) {
                                  ShowLoader.hideLoading(context);
                                  UIFeedback.message(
                                    message: screenState.error,
                                    type: SnackBarType.error,
                                  );
                                } else if (screenState is AuthLoadingState) {
                                  await ShowLoader.showLoading(context);
                                } else if (screenState is AuthSuccessState) {
                                  ShowLoader.hideLoading(context);
                                  context.go(PagePath.Home);
                                }
                              });

                              return Align(
                                alignment: Alignment.center,
                                child: CustomButton(
                                  text: 'Login',
                                  onTap: () async {
                                    final username = _usernameController.text;
                                    final pass = _passwordController.text;

                                    if (formKey.currentState!.validate()) {
                                      print('here in login');
                                      await ref
                                          .read(authProviderNotifier.notifier)
                                          .login(
                                              email: username, password: pass);
                                    }
                                  },
                                  w: 0.5,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
