import 'package:riverpod_clean_arch/app/extension/build_context_ext.dart';
import 'package:riverpod_clean_arch/app/utils/common_spacing.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/custom_button.dart';
import 'package:riverpod_clean_arch/common/mixins/validation.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:riverpod_clean_arch/data/models/class_model.dart';
import 'package:riverpod_clean_arch/presentation/providers/student_provider.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddClassDialogBox extends StatelessWidget with FieldsValidation {
  final GlobalKey<FormState> formKey;

  AddClassDialogBox({
    super.key,
    required this.formKey,
  });

  final List<String> hintTextList = [
    'Title',
    'Code',
  ];

  final titleController = TextEditingController();
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllersList = [
      titleController,
      codeController,
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
                text: 'Add Class Details',
                fontSize: 30,
                weight: FontWeight.w700,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemCount: controllersList.length,
                  itemBuilder: (context, index) => CommonTextField(
                        controller: controllersList[index],
                        validation: emptyFieldValidation,
                        label: hintTextList[index],
                        hintText: 'Write here',
                      ),
                  separatorBuilder: (context, index) =>
                      VerticalSpacing(context.height * 0.005)),
              const VerticalSpacing(20),
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
                                  .read(studentNotifierProvider.notifier)
                                  .addClass(ClassModel(
                                      title: titleController.text,
                                      code: codeController.text));
                              context.pop();
                            },
                            m: 0,
                            text: 'Add',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
