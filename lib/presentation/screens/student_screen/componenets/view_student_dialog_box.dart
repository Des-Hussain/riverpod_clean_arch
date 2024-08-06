import 'package:riverpod_clean_arch/app/extension/build_context_ext.dart';
import 'package:riverpod_clean_arch/app/utils/common_spacing.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/custom_button.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:riverpod_clean_arch/data/models/student_model.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/common_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewStudentDialogBox extends StatelessWidget {
  final StudentModel? model;

  ViewStudentDialogBox({
    super.key,
    this.model,
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
    List<String> controllersList = [
      model?.grNum ?? '',
      model?.firstName ?? '',
      model?.lastName ?? '',
      model?.fatherName ?? '',
      model?.phoneNum ?? '',
      model?.schoolName ?? '',
      model?.classTitle ?? '',
      model?.address ?? '',
      model?.fatherCnic ?? '',
      model?.dateOfBirth ?? '',
      model?.dateOfJoining ?? '',
    ];
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
              text: 'View Student Details',
              fontSize: 30,
              weight: FontWeight.w700,
            ),
            Expanded(
              child: ListView.separated(
                  itemCount: controllersList.length,
                  itemBuilder: (context, index) => CommonTextField(
                        controller: TextEditingController(),
                        label: labelTextList[index],
                        hintText: controllersList[index],
                        isReadOnly: true,
                      ),
                  separatorBuilder: (context, index) =>
                      VerticalSpacing(context.height * 0.005)),
            ),
            // const Spacer(),
            SizedBox(
              height: 60,
              child: Row(
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
            )
          ],
        ),
      ),
    );
  }
}
