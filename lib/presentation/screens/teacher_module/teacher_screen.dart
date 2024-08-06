import 'package:riverpod_clean_arch/app/utils/ui_snackbars.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/loader.dart';
import 'package:riverpod_clean_arch/presentation/providers/teacher_provider.dart';
import 'package:riverpod_clean_arch/presentation/screens/teacher_module/teacher_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'componenets/teachersList.dart';

class TeacherScreen extends ConsumerStatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends ConsumerState<TeacherScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(teacherNotifierProvider.notifier).getAllTeachersData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<TeacherStates>(teacherNotifierProvider,
        (previous, screenState) async {
      if (screenState is TeacherErrorState) {
        ShowLoader.hideLoading(context);
        UIFeedback.message(
          message: screenState.error,
          type: SnackBarType.error,
        );
      } else if (screenState is TeacherLoadingState) {
        await ShowLoader.showLoading(context);
      } else if (screenState is TeacherSuccessState) {
        ShowLoader.hideLoading(context);
        if (screenState.message != null) {
          UIFeedback.message(
            message: screenState.message ?? '',
            type: SnackBarType.success,
          );
        }
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // Main Panel
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Expanded(
                  //   flex: 1,
                  //   child: ExpenseIncomeCharts(),
                  // ),
                  // const SizedBox(height: 100, child: GenerateSalaray()),

                  Expanded(child: TeachersList()),
                ],
              ),
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
