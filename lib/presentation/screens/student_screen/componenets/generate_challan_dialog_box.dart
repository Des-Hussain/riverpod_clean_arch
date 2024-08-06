import 'package:riverpod_clean_arch/app/extension/build_context_ext.dart';
import 'package:riverpod_clean_arch/app/utils/common_spacing.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/custom_button.dart';
import 'package:riverpod_clean_arch/common/mixins/validation.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:riverpod_clean_arch/data/models/student_model.dart';
import 'package:riverpod_clean_arch/presentation/providers/student_provider.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class GenerateChallanDialogWidget extends StatelessWidget
    with FieldsValidation {
  GenerateChallanDialogWidget({super.key, this.stdentModel});

  final StudentModel? stdentModel;
  final monthController = TextEditingController();
  final dueDateController = TextEditingController();
  final totalAmountController = TextEditingController();
  final amountDueController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    totalAmountController.text = stdentModel!.feesModel!.isEmpty
        ? ''
        : stdentModel?.feesModel?.last.totalFees.toString() ?? '';
    amountDueController.text = stdentModel!.feesModel!.isEmpty
        ? ''
        : stdentModel?.feesModel?.last.balanceFees.toString() ?? '';
    return Dialog(
      child: Form(
        key: formKey,
        child: Container(
          // height: 450,
          width: context.width * 0.35,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CommonText(
                text: 'Generate Challan',
                fontSize: 30,
                weight: FontWeight.w700,
              ),
              VerticalSpacing(context.height * 0.02),
              CommonTextField(
                controller: TextEditingController(text: stdentModel?.grNum),
                hintText: 'Write here',
                label: 'Student Id',
                isReadOnly: true,
              ),
              VerticalSpacing(context.height * 0.005),
              CommonTextField(
                isReadOnly: true,
                controller: monthController,
                suffixIcon: Icons.calendar_month,
                suffixOnTap: () async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2040));
                  monthController.text =
                      DateFormat('MMM').format(date ?? DateTime.now());
                },
                hintText: 'Select month',
                label: 'Month',
                validation: emptyFieldValidation,
              ),
              VerticalSpacing(context.height * 0.005),
              CommonTextField(
                controller: dueDateController,
                hintText: 'Select date',
                label: 'Due Date',
                suffixIcon: Icons.calendar_month,
                suffixOnTap: () async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2040));
                  dueDateController.text =
                      DateFormat('MMM dd, yyyy').format(date ?? DateTime.now());
                },
                validation: emptyFieldValidation,
              ),
              VerticalSpacing(context.height * 0.005),
              CommonTextField(
                controller: totalAmountController,
                hintText: 'Write here',
                label: 'Total Amount',
                validation: emptyFieldValidation,
              ),
              VerticalSpacing(context.height * 0.005),
              CommonTextField(
                controller: amountDueController,
                hintText: 'Write here',
                label: 'Amount Due',
                validation: emptyFieldValidation,
              ),
              VerticalSpacing(context.height * 0.005),
              const Spacer(),
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
                      builder: (BuildContext context, WidgetRef ref,
                              Widget? child) =>
                          Expanded(
                        child: CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              await ref
                                  .read(studentNotifierProvider.notifier)
                                  .createFeeChallan(
                                      model: FeesModel(
                                          studentId: stdentModel?.id,
                                          firstName: stdentModel?.firstName,
                                          lastName: stdentModel?.lastName,
                                          fatherName: stdentModel?.fatherName,
                                          classTitle: stdentModel?.classTitle,
                                          month: monthController.text,
                                          dueDate: dueDateController.text,
                                          totalFees: double.parse(
                                              totalAmountController.text),
                                          balanceFees: double.parse(
                                              amountDueController.text)));
                              context.pop();
                            }
                          },
                          m: 0,
                          text: 'Generate',
                        ),
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
