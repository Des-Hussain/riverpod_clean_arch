import 'package:riverpod_clean_arch/app/utils/common_spacing.dart';
import 'package:riverpod_clean_arch/common/constants.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/resources/drawables.dart';
import 'package:riverpod_clean_arch/data/models/class_model.dart';
import 'package:riverpod_clean_arch/presentation/providers/student_provider.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/add_class_dialog_box.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/componenets/delete_class_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClassConfigurationCard extends StatelessWidget {
  const ClassConfigurationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: Constants.defaultBorderRadius,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Row(
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: "Class ",
                        ),
                        TextSpan(
                          text: "Configuration",
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(Drawables.astronautImage),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await ref
                        .read(studentNotifierProvider.notifier)
                        .getClassList();
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteClassDialogBox(
                            classModel: ref.read(classListProvider));
                      },
                    );
                  },
                ),
              ),
              const HorizontalSpacing(10),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AddClassDialogBox(
                            formKey: ref
                                .read(studentNotifierProvider.notifier)
                                .classFormKey);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
