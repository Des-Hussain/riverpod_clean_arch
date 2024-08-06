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

class DeleteClassDialogBox extends StatelessWidget with FieldsValidation {
  final List<ClassModel> classModel;

  DeleteClassDialogBox({
    super.key,
    required this.classModel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: context.width * 0.35,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CommonText(
              text: 'Delete Class',
              fontSize: 30,
              weight: FontWeight.w700,
            ),
            if (classModel.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: CommonText(
                  text: 'No class added yet!',
                  fontSize: 14,
                  weight: FontWeight.w600,
                ),
              )
            else
              ListView.separated(
                  shrinkWrap: true,
                  itemCount: classModel.length,
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.bgTextField,
                        ),
                        padding: const EdgeInsets.only(right: 10, left: 1),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            width: 2,
                            color: AppColors.primaryColor,
                          ),
                          title: CommonText(
                            text: classModel[index].title ?? '',
                            fontSize: 14,
                            weight: FontWeight.w600,
                          ),
                          subtitle: CommonText(
                            text: classModel[index].code ?? '',
                            fontSize: 10,
                            weight: FontWeight.w400,
                          ),
                          trailing: Consumer(
                            builder: (BuildContext context, WidgetRef ref,
                                Widget? child) {
                              return InkWell(
                                onTap: () async {
                                  await ref
                                      .read(studentNotifierProvider.notifier)
                                      .deleteClass(
                                          id: classModel[index].id ?? '');
                                },
                                child: const Icon(
                                  Icons.delete,
                                  size: 18,
                                  color: AppColors.redColor,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) =>
                      VerticalSpacing(context.height * 0.010)),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
