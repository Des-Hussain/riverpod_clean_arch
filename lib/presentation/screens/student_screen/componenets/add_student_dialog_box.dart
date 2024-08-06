import 'package:riverpod_clean_arch/app/extension/build_context_ext.dart';
import 'package:riverpod_clean_arch/app/utils/common_drop_down_widget.dart';
import 'package:riverpod_clean_arch/app/utils/common_spacing.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/custom_button.dart';
import 'package:riverpod_clean_arch/common/mixins/validation.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:riverpod_clean_arch/data/models/class_model.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddStudentDialogBox extends StatelessWidget with FieldsValidation {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController fatherNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController schoolController;
  final TextEditingController classController;
  final TextEditingController addressController;
  final TextEditingController fatherCNICController;
  final TextEditingController dateOfBirthController;
  final TextEditingController dateOfJoiningController;
  final VoidCallback onTap;
  final GlobalKey<FormState> formKey;
  final List<String> classList;

  AddStudentDialogBox({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.fatherNameController,
    required this.phoneNumberController,
    required this.schoolController,
    required this.classController,
    required this.addressController,
    required this.fatherCNICController,
    required this.dateOfBirthController,
    required this.dateOfJoiningController,
    required this.onTap,
    required this.formKey,
    required this.classList,
  });

  final List<String> hintTextList = [
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
    List<TextEditingController> controllersList = [
      firstNameController,
      lastNameController,
      fatherNameController,
      phoneNumberController,
      schoolController,
      classController,
      addressController,
      fatherCNICController,
      dateOfBirthController,
      dateOfJoiningController,
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
                text: 'Add Student Details',
                fontSize: 30,
                weight: FontWeight.w700,
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: controllersList.length,
                    itemBuilder: (context, index) {
                      if (index == 5) {
                        return DropDownWidget(
                          label: hintTextList[5],
                          hintText: 'Select class',
                          fillColor: AppColors.fourthColor,
                          onChanged: (p0) {
                            classController.text = p0 ?? '';
                          },
                          arryList: classList,
                        );
                      } else {
                        return CommonTextField(
                          isReadOnly: index == 8 || index == 9,
                          controller: controllersList[index],
                          validation: emptyFieldValidation,
                          label: hintTextList[index],
                          hintText: 'Write here',
                          suffixIcon: index == 8 || index == 9
                              ? Icons.calendar_month
                              : null,
                          suffixOnTap: index == 8 || index == 9
                              ? () async {
                                  final date = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1990),
                                      lastDate: index == 8
                                          ? DateTime.now()
                                          : DateTime(2040));
                                  index == 8
                                      ? dateOfBirthController.text =
                                          DateFormat('MMM dd, yyyy')
                                              .format(date ?? DateTime.now())
                                      : dateOfJoiningController.text =
                                          DateFormat('MMM dd, yyyy')
                                              .format(date ?? DateTime.now());
                                }
                              : null,
                        );
                      }
                    },
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
