import 'package:riverpod_clean_arch/app/extension/build_context_ext.dart';
import 'package:riverpod_clean_arch/app/utils/common_drop_down_widget.dart';
import 'package:riverpod_clean_arch/app/utils/common_spacing.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/custom_button.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:riverpod_clean_arch/data/models/student_model.dart';
import 'package:riverpod_clean_arch/presentation/providers/student_provider.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class EditStudentDialogBox extends StatelessWidget {
  final StudentModel? model;
  final List<String>? classList;

  EditStudentDialogBox({
    super.key,
    this.model,
    this.classList,
  });

  final List<String> labelTextList = [
    'GR-Number',
    'First Name',
    'Last Name',
    'Father Name',
    'Phone Number',
    'School',
    'Class',
    'Address',
    'Father CNIC',
    'Date of Birth',
    'Date of Registration',
  ];

  @override
  Widget build(BuildContext context) {
    final grNumberController = TextEditingController(text: model?.grNum);
    final firstNameController = TextEditingController(text: model?.firstName);
    final lastNameController = TextEditingController(text: model?.lastName);
    final fatherNameController = TextEditingController(text: model?.fatherName);
    final phoneNumberController = TextEditingController(text: model?.phoneNum);
    final schoolController = TextEditingController(text: model?.schoolName);
    final classController = TextEditingController(text: model?.classTitle);
    final addressController = TextEditingController(text: model?.address);
    final fatherCNICController = TextEditingController(text: model?.fatherCnic);
    final dobController = TextEditingController(text: model?.dateOfBirth);
    final dojController = TextEditingController(text: model?.dateOfJoining);

    clearController() {
      grNumberController.clear();
      firstNameController.clear();
      lastNameController.clear();
      fatherNameController.clear();
      phoneNumberController.clear();
      schoolController.clear();
      grNumberController.clear();
      addressController.clear();
      fatherCNICController.clear();
      dobController.clear();
      dojController.clear();
    }

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
              text: 'Edit Student Details',
              fontSize: 30,
              weight: FontWeight.w700,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CommonTextField(
                      isReadOnly: true,
                      controller: grNumberController,
                      label: labelTextList[0],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                      controller: firstNameController,
                      label: labelTextList[1],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                      controller: lastNameController,
                      label: labelTextList[2],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                      controller: fatherNameController,
                      label: labelTextList[3],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                      controller: phoneNumberController,
                      label: labelTextList[4],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                      controller: schoolController,
                      label: labelTextList[5],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    DropDownWidget(
                      selectedItem: classController.text,
                      label: labelTextList[6],
                      onChanged: (p0) {
                        classController.text = p0;
                      },
                      arryList: classList ?? [],
                      hintText: 'Select class',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                      controller: addressController,
                      label: labelTextList[7],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                      controller: fatherCNICController,
                      label: labelTextList[8],
                      hintText: 'Write here',
                    ),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                        isReadOnly: true,
                        controller: dobController,
                        label: labelTextList[9],
                        hintText: 'Write here',
                        suffixIcon: Icons.calendar_month,
                        suffixOnTap: () async {
                          final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1990),
                              lastDate: DateTime.now());
                          dobController.text = DateFormat('MMM dd, yyyy')
                              .format(date ?? DateTime.now());
                        }),
                    VerticalSpacing(context.height * 0.005),
                    CommonTextField(
                      isReadOnly: true,
                      controller: dojController,
                      label: labelTextList[10],
                      hintText: 'Write here',
                      suffixIcon: Icons.calendar_month,
                      suffixOnTap: () async {
                        final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1990),
                            lastDate: DateTime(2040));
                        dojController.text = DateFormat('MMM dd, yyyy')
                            .format(date ?? DateTime.now());
                      },
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
                            print('THIS is ${classController.text}');
                            await ref
                                .read(studentNotifierProvider.notifier)
                                .updateStudent(
                                    studentModel: StudentModel(
                                  id: model?.id,
                                  grNum: grNumberController.text,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  fatherName: fatherNameController.text,
                                  phoneNum: phoneNumberController.text,
                                  schoolName: schoolController.text,
                                  classId: ref
                                      .read(classListProvider)
                                      .firstWhere((element) =>
                                          element.title == classController.text)
                                      .id,
                                  address: addressController.text,
                                  fatherCnic: fatherCNICController.text,
                                  dateOfBirth: dobController.text,
                                  dateOfJoining: dojController.text,
                                ));
                            clearController();
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
