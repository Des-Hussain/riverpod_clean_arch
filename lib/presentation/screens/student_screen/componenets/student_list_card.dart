import 'package:riverpod_clean_arch/app/utils/ui_snackbars.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/resources/drawables.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:riverpod_clean_arch/data/models/student_model.dart';
import 'package:riverpod_clean_arch/presentation/providers/student_provider.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/generate_challan_dialog_box.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/view_student_dialog_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'edit_student_dialog_box_body.dart';

class StudentListCard extends StatelessWidget {
  final StudentModel studentModel;

  StudentListCard({
    Key? key,
    required this.studentModel,
  }) : super(key: key);

  bool isFreezed = false;

  @override
  Widget build(BuildContext context) {
    final data = studentModel;
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CommonText(
                  alignment: Alignment.center,
                  text: data.grNum ?? '',
                  weight: FontWeight.w400,
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ),
              Expanded(
                child: CommonText(
                  alignment: Alignment.center,
                  text: data.firstName ?? '',
                  weight: FontWeight.w400,
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ),
              Expanded(
                child: CommonText(
                  alignment: Alignment.center,
                  text: data.fatherName ?? '',
                  weight: FontWeight.w400,
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ),
              Expanded(
                child: CupertinoSwitch(
                  activeColor: AppColors.secondary,
                  value: studentModel.isActive == 0 ? true : false,
                  onChanged: (value) async {
                    isFreezed = value;
                    // final isFreezed = ref.watch(isFreezedProvider);
                    final response = await UIFeedback.showAlertDialog(context,
                        title: isFreezed ? 'Freeze Student' : 'Unfreez Student',
                        message: isFreezed
                            ? 'Are you certain you want to freeze this student?'
                            : 'This student is Freezed, do you want to unfreeze this student?',
                        icon: Icons.error_outline_outlined,
                        okBtnText: 'Yes');
                    if (response ?? false) {
                      ref
                          .read(studentNotifierProvider.notifier)
                          .toggleFreezeStatus(id: studentModel.id!);
                    }
                  },
                ),
              ),
              Expanded(
                child: CommonText(
                  alignment: Alignment.center,
                  text: data.feesModel?.isNotEmpty ?? false
                      ? data.feesModel?.first.totalFees.toString() ?? ''
                      : ' - ',
                  weight: FontWeight.w400,
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ),
              Expanded(
                child: CommonText(
                  alignment: Alignment.center,
                  text: data.feesModel?.isNotEmpty ?? false
                      ? data.feesModel?.first.balanceFees.toString() ?? ''
                      : ' - ',
                  weight: FontWeight.w400,
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ),
              Expanded(
                  child: InkWell(
                      onTap: () async {
                        await ref
                            .read(studentNotifierProvider.notifier)
                            .getStudentById(studentId: studentModel.id ?? '');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ViewStudentDialogBox(
                              model: ref.watch(singlestudentProvider),
                            );
                          },
                        );
                      },
                      child: SvgPicture.asset(Drawables.viewIcon))),
              Expanded(
                  child: InkWell(
                      onTap: () async {
                        if (studentModel.isActive == 1) {
                          await ref
                              .read(studentNotifierProvider.notifier)
                              .getStudentById(studentId: data.id ?? '');
                          await ref
                              .read(studentNotifierProvider.notifier)
                              .getClassList();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return EditStudentDialogBox(
                                classList: ref
                                    .read(classListProvider)
                                    .map((e) => e.title ?? '')
                                    .toList(),
                                model: ref.watch(singlestudentProvider),
                              );
                            },
                          );
                        }
                      },
                      child: SvgPicture.asset(Drawables.editIcon))),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    await ref
                        .read(studentNotifierProvider.notifier)
                        .getFeeDeatilsById(id: data.id ?? '');

                    await showDialog(
                      context: context,
                      builder: (context) {
                        return GenerateChallanDialogWidget(
                          stdentModel: data,
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    Drawables.chevronRightIcon,
                    scale: 2,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
