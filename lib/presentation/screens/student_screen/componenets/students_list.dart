import 'package:riverpod_clean_arch/app/extension/build_context_ext.dart';
import 'package:riverpod_clean_arch/app/utils/common_drop_down_widget.dart';
import 'package:riverpod_clean_arch/app/utils/common_spacing.dart';
import 'package:riverpod_clean_arch/common/resources/drawables.dart';
import 'package:riverpod_clean_arch/common/widgets/header_widget.dart';
import 'package:riverpod_clean_arch/data/models/student_model.dart';
import 'package:riverpod_clean_arch/presentation/providers/student_provider.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/add_student_dialog_box.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/common_text_field.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/student_list_card.dart';
import 'package:riverpod_clean_arch/presentation/screens/teacher_module/componenets/list_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class StudentsList extends StatelessWidget {
  StudentsList({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  final grNumberController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final schoolController = TextEditingController();
  final classController = TextEditingController();
  final addressController = TextEditingController();
  final fatherCNICController = TextEditingController();
  final dobController = TextEditingController();
  final dojController = TextEditingController();
  final emergencyContactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final formKey = ref.read(studentNotifierProvider.notifier).formKey;
      return Header(
        pageLabel: 'Student',
        title:
            "Current Enrolled Students (${ref.watch(studentListProvider).length})",
        subTitle: 'Freeze Count (${ref.watch(freezeCountProvider).toString()})',
        suffix: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                  onTap: () async {
                    await ref
                        .read(studentNotifierProvider.notifier)
                        .getAllStudentsData();
                    // ref.read(recieptNotifierProvider.notifier).printReciept();
                  },
                  child: const Icon(Icons.refresh_outlined)),
            ),
            InkWell(
                onTap: () async {
                  await ref
                      .read(studentNotifierProvider.notifier)
                      .getClassList();
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddStudentDialogBox(
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                        fatherNameController: fatherNameController,
                        phoneNumberController: phoneNumberController,
                        schoolController: schoolController,
                        classController: classController,
                        addressController: addressController,
                        fatherCNICController: fatherCNICController,
                        dateOfBirthController: dobController,
                        dateOfJoiningController: dojController,
                        classList: ref
                            .read(classListProvider)
                            .map((e) => e.title ?? '')
                            .toList(),
                        formKey: formKey,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            await ref
                                .read(studentNotifierProvider.notifier)
                                .addStudent(
                                    studentModel: StudentModel(
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        fatherName: fatherNameController.text,
                                        phoneNum: phoneNumberController.text,
                                        schoolName: schoolController.text,
                                        classId: ref
                                            .read(classListProvider)
                                            .firstWhere((element) =>
                                                element.title ==
                                                classController.text)
                                            .id,
                                        address: addressController.text,
                                        fatherCnic: fatherCNICController.text,
                                        dateOfBirth: dobController.text,
                                        dateOfJoining: dojController.text));
                            context.pop();
                          }
                        },
                      );
                    },
                  );
                },
                child: SvgPicture.asset(Drawables.addIcon)),
          ],
        ),
        searchWidget: SizedBox(
          width: context.width / 2,
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final searchController =
                  ref.read(studentNotifierProvider.notifier).searchController;
              final String _selectedItem =
                  ref.read(studentNotifierProvider.notifier).selectedSearchItem;
              int selectedOption =
                  ref.read(studentNotifierProvider.notifier).selectedOption;
              return Row(
                children: [
                  Expanded(
                    child: CommonTextField(
                      controller: searchController,
                      hintText: 'Search',
                      suffixIcon: Icons.search,
                      suffixOnTap: () {
                        if (searchController.text.isNotEmpty) {
                          switch (selectedOption) {
                            case 0:
                              ref
                                  .read(studentNotifierProvider.notifier)
                                  .searchByName(name: searchController.text);
                              break;
                            case 1:
                              ref
                                  .read(studentNotifierProvider.notifier)
                                  .searchByFatherName(
                                      fatherName: searchController.text);

                              break;
                            case 2:
                              ref
                                  .read(studentNotifierProvider.notifier)
                                  .searchByGrNum(number: searchController.text);
                              break;
                          }
                        }
                      },
                    ),
                  ),
                  const HorizontalSpacing(20),
                  Expanded(
                      child: DropDownWidget(
                    selectedItem: _selectedItem,
                    onChanged: (value) {
                      switch (value) {
                        case 'Search By Name':
                          selectedOption = 0;
                          ref
                              .read(studentNotifierProvider.notifier)
                              .selectedOption = 0;
                          break;
                        case 'Search By Father Name':
                          selectedOption = 1;
                          ref
                              .read(studentNotifierProvider.notifier)
                              .selectedOption = 1;
                          break;
                        case 'Search By Gr Number':
                          selectedOption = 2;
                          ref
                              .read(studentNotifierProvider.notifier)
                              .selectedOption = 2;
                          break;
                      }
                    },
                    arryList: const [
                      'Search By Name',
                      'Search By Father Name',
                      'Search By Gr Number',
                    ],
                  )),
                ],
              );
            },
          ),
        ),
        children: [
          const ListHeader(headerList: [
            'Gr No.',
            'First Name',
            'father Name',
            'Freeze Status',
            'Amount Paid',
            'Amount Due',
            'View',
            'Edit',
            'Challan'
          ]),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: ref.watch(studentListProvider).length,
              itemBuilder: (context, index) {
                return StudentListCard(
                  studentModel: ref.watch(studentListProvider)[index],
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
