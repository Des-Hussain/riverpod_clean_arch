import 'package:riverpod_clean_arch/app/extension/build_context_ext.dart';
import 'package:riverpod_clean_arch/common/resources/drawables.dart';
import 'package:riverpod_clean_arch/common/widgets/header_widget.dart';
import 'package:riverpod_clean_arch/data/models/teacher_model.dart';
import 'package:riverpod_clean_arch/presentation/providers/teacher_provider.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/common_text_field.dart';
import 'package:riverpod_clean_arch/presentation/screens/teacher_module/componenets/teacher_dialog_Box_Body.dart';
import 'package:riverpod_clean_arch/presentation/screens/teacher_module/componenets/teacher_list_card.dart';
import 'package:riverpod_clean_arch/presentation/screens/teacher_module/componenets/list_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class TeachersList extends StatelessWidget {
  TeachersList({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final teacherName = TextEditingController();
  final firstNameController = TextEditingController();
  final teacherDesignationController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final emergencyContactController = TextEditingController();
  final salaryController = TextEditingController();
  final nameSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return Header(
        pageLabel: 'Teacher',
        title:
            "Current Enrolled Teachers (${ref.watch(teacherListProvider).length})",
        suffix: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                  onTap: () async {
                    await ref
                        .read(teacherNotifierProvider.notifier)
                        .getAllTeachersData();
                  },
                  child: const Icon(Icons.refresh_outlined)),
            ),
            InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return TeacherDialogBoxBody(
                        formKey:
                            ref.read(teacherNotifierProvider.notifier).formKey,
                        firstNameController: teacherName,
                        phoneNumberController: phoneNumberController,
                        addressController: addressController,
                        teacherDesignationController:
                            teacherDesignationController,
                        emergencyContactController: emergencyContactController,
                        salaryController: salaryController,
                        onTap: () async {
                          final model = TeacherModel(
                            name: teacherName.text,
                            phoneNumber: phoneNumberController.text,
                            address: addressController.text,
                            emergencyNumber: emergencyContactController.text,
                            designation: teacherDesignationController.text,
                            salary: double.tryParse(salaryController.text),
                            isActive: true,
                          );
                          await ref
                              .read(teacherNotifierProvider.notifier)
                              .addTeacher(teacherModel: model);
                          context.pop();
                        },
                      );
                    },
                  );
                },
                child: SvgPicture.asset(Drawables.addIcon)),
          ],
        ),
        searchWidget: SizedBox(
          width: context.width / 4,
          child: CommonTextField(
            controller: nameSearchController,
            hintText: 'Search name',
            suffixIcon: Icons.search,
            onChanged: (p0) async {
              if (p0.isNotEmpty) {
                await ref
                    .read(teacherNotifierProvider.notifier)
                    .searchTeacher(teacherName: p0);
              } else {
                await ref
                    .read(teacherNotifierProvider.notifier)
                    .getAllTeachersData();
              }
            },
            suffixOnTap: () async {
              if (nameSearchController.text.isNotEmpty) {
                await ref
                    .read(teacherNotifierProvider.notifier)
                    .searchTeacher(teacherName: nameSearchController.text);
              }
            },
          ),
        ),
        children: [
          const ListHeader(
            headerList: [
              'Name',
              'Phone Number',
              'Designation',
              'View',
              'Edit',
            ],
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: ref.watch(teacherListProvider).length,
              itemBuilder: (context, index) {
                return TeacherListCard(
                  teacherModel: ref.watch(teacherListProvider)[index],
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
