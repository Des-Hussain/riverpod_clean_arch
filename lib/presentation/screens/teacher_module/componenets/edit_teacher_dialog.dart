import 'package:riverpod_clean_arch/app/extension/build_context_ext.dart';
import 'package:riverpod_clean_arch/app/utils/common_spacing.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/custom_button.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:riverpod_clean_arch/data/models/teacher_model.dart';
import 'package:riverpod_clean_arch/presentation/providers/teacher_provider.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditTeacherDialogBox extends StatelessWidget {
  final TeacherModel? model;

  EditTeacherDialogBox({
    super.key,
    this.model,
  });

  final List<String> labelTextList = [
    'Name',
    'Phone Number',
    'Address',
    'Emergency Number',
    'Designation',
    'Salary',
  ];

  @override
  Widget build(BuildContext context) {
    List<String> controllersList = [
      model?.name ?? '',
      model?.phoneNumber ?? '',
      model?.address ?? '',
      model?.emergencyNumber ?? '',
      model?.designation ?? '',
      model?.salary.toString() ?? '',
    ];

    final nameController = TextEditingController(text: model?.name);
    final phoneController = TextEditingController(text: model?.phoneNumber);
    final addressController = TextEditingController(text: model?.address);
    final emergencyNumControoler =
        TextEditingController(text: model?.emergencyNumber);
    final designationController =
        TextEditingController(text: model?.designation);
    final salaryController =
        TextEditingController(text: model?.salary.toString());
    return Dialog(
      child: Container(
        height: 800,
        width: context.width * 0.35,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const CommonText(
              text: 'Edit Teacher Details',
              fontSize: 30,
              weight: FontWeight.w700,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CommonTextField(
                      controller: nameController,
                      label: labelTextList[0],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                      controller: phoneController,
                      label: labelTextList[1],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                      controller: addressController,
                      label: labelTextList[2],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                      controller: emergencyNumControoler,
                      label: labelTextList[3],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                      controller: designationController,
                      label: labelTextList[4],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                      controller: salaryController,
                      label: labelTextList[5],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        context.pop();
                      },
                      text: 'Cancel',
                      textColor: AppColors.black,
                      border: Border.all(color: AppColors.grey),
                      btnColor: AppColors.transparent,
                      m: 0,
                    ),
                  ),
                  HorizontalSpacing(context.width * 0.003),
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      return Expanded(
                        child: CustomButton(
                          onTap: () async {
                            await ref
                                .read(teacherNotifierProvider.notifier)
                                .updateTeacherBy(
                                  teacherModel: TeacherModel(
                                    id: model?.id,
                                    name: nameController.text,
                                    phoneNumber: phoneController.text,
                                    address: addressController.text,
                                    emergencyNumber:
                                        emergencyNumControoler.text,
                                    designation: designationController.text,
                                    salary:
                                        double.tryParse(salaryController.text),
                                    isActive: true,
                                  ),
                                );
                            context.pop();
                          },
                          m: 0,
                          text: 'Update',
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
