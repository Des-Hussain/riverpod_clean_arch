import 'package:riverpod_clean_arch/app/extension/build_context_ext.dart';
import 'package:riverpod_clean_arch/app/utils/common_spacing.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/custom_button.dart';
import 'package:riverpod_clean_arch/common/mixins/validation.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../student_screen/componenets/common_text_field.dart';

class TeacherDialogBoxBody extends StatelessWidget with FieldsValidation {
  final TextEditingController firstNameController;
  final TextEditingController teacherDesignationController;
  final TextEditingController phoneNumberController;
  final TextEditingController addressController;
  final TextEditingController emergencyContactController;
  final TextEditingController salaryController;
  final VoidCallback onTap;
  final GlobalKey<FormState> formKey;

  TeacherDialogBoxBody({
    super.key,
    required this.firstNameController,
    required this.phoneNumberController,
    required this.addressController,
    required this.teacherDesignationController,
    required this.emergencyContactController,
    required this.salaryController,
    required this.onTap,
    required this.formKey,
  });

  final List<String> hintTextList = [
    "Name",
    "PhoneNumber",
    "Address",
    "EmergencyNumber",
    "Designation",
    "Salary",
  ];

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllersList = [
      firstNameController,
      phoneNumberController,
      addressController,
      emergencyContactController,
      teacherDesignationController,
      salaryController
    ];
    return Dialog(
      child: Form(
        key: formKey,
        child: Container(
          // height: 800,
          width: context.width * 0.35,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CommonText(
                text: 'Add Teacher Details',
                fontSize: 30,
                weight: FontWeight.w700,
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: controllersList.length,
                    itemBuilder: (context, index) => CommonTextField(
                          controller: controllersList[index],
                          validation: emptyFieldValidation,
                          label: hintTextList[index],
                          hintText: 'Write here',
                        ),
                    separatorBuilder: (context, index) =>
                        VerticalSpacing(context.height * 0.005)),
              ),
              // const Spacer(),
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
                    Expanded(
                      child: CustomButton(
                        onTap: onTap,
                        m: 0,
                        text: 'Add',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
