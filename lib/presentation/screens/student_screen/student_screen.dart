import 'package:riverpod_clean_arch/app/utils/ui_snackbars.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/loader.dart';
import 'package:riverpod_clean_arch/presentation/providers/student_provider.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/class_configuration_card.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/student_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'componenets/students_list.dart';

class StudentScreen extends ConsumerStatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StudentScreen> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<StudentScreen> {
  int activeTab = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(studentNotifierProvider.notifier).getAllStudentsData();
      await ref.read(studentNotifierProvider.notifier).getFreezeCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<StudentStates>(studentNotifierProvider,
        (previous, screenState) async {
      if (screenState is StudentErrorState) {
        ShowLoader.hideLoading(context);
        UIFeedback.message(
          message: screenState.error,
          type: SnackBarType.error,
        );
      } else if (screenState is StudentLoadingState) {
        debugPrint('Loading');
        await ShowLoader.showLoading(context);
      } else if (screenState is StudentSuccessState) {
        ShowLoader.hideLoading(context);
        if (screenState.message != null) {
          UIFeedback.message(
            message: screenState.message ?? '',
            type: SnackBarType.success,
          );
        }
      }
    });
    return Row(
      children: [
        // Main Panel
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const Expanded(
              //   flex: 2,
              //   child: ExpenseIncomeCharts(),
              // ),
              const SizedBox(height: 100, child: ClassConfigurationCard()),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: StudentsList()),
              // SizedBox(
              //   height: 40,
              // ),
              // SizedBox(height: 350, child: StudentsList()),
            ],
          ),
          // flex: 5,
        ),
        // Right Panel
        // Visibility(
        //   visible: Responsive.isDesktop(context),
        //   child: Expanded(
        //     child: Padding(
        //       padding: EdgeInsets.only(left: Constants.defaultPadding),
        //       child: Column(
        //         children: [
        //           CardsSection(
        //             cardDetails: [
        //               CardDetails("431421432", CardType.mastercard),
        //               CardDetails("423142231", CardType.mastercard),
        //             ],
        //           ),
        //           const Expanded(
        //             child: StaticsByCategory(),
        //           ),
        //         ],
        //       ),
        //     ),
        //     flex: 2,
        //   ),
        // )
      ],
    );
  }
}
