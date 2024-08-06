import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/resources/drawables.dart';
import 'package:riverpod_clean_arch/common/widgets/custom_text.dart';
import 'package:riverpod_clean_arch/data/models/teacher_model.dart';
import 'package:riverpod_clean_arch/presentation/providers/teacher_provider.dart';
import 'package:riverpod_clean_arch/presentation/screens/teacher_module/componenets/edit_teacher_dialog.dart';
import 'package:riverpod_clean_arch/presentation/screens/teacher_module/componenets/view_teacher_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class TeacherListCard extends StatelessWidget {
  final TeacherModel teacherModel;

  const TeacherListCard({
    Key? key,
    required this.teacherModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = teacherModel;
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      // final getTeacherByIdData = ref.watch(singleTeacherDataProvider);
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
                text: data.name ?? '',
                weight: FontWeight.w400,
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
            Expanded(
              child: CommonText(
                text: data.phoneNumber ?? '',
                weight: FontWeight.w400,
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
            Expanded(
              child: CommonText(
                text: data.designation ?? '',
                weight: FontWeight.w400,
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
            Expanded(
                child: InkWell(
                    onTap: () async {
                      await ref
                          .read(teacherNotifierProvider.notifier)
                          .getTeacherById(teacherId: teacherModel.id ?? '');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ViewTeacherDialogBox(
                            model: ref.read(singleTeacherDataProvider),
                          );
                        },
                      );
                    },
                    child: SvgPicture.asset(Drawables.viewIcon))),
            Expanded(
                child: InkWell(
                    onTap: () async {
                      await ref
                          .read(teacherNotifierProvider.notifier)
                          .getTeacherById(teacherId: data.id!);

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return EditTeacherDialogBox(
                            model: ref.read(singleTeacherDataProvider),
                          );
                        },
                      );
                    },
                    child: SvgPicture.asset(Drawables.editIcon))),
          ],
        ),
      );
    });
  }
}
