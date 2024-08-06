import 'package:riverpod_clean_arch/app/utils/common_spacing.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/custom_dialogue_box.dart';
import 'package:riverpod_clean_arch/common/app_specific_widgets/custom_text_field.dart';
import 'package:riverpod_clean_arch/common/constants.dart';
import 'package:riverpod_clean_arch/common/resources/colors.dart';
import 'package:riverpod_clean_arch/common/resources/drawables.dart';
import 'package:flutter/material.dart';

class GenerateSalaray extends StatelessWidget {
  const GenerateSalaray({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: Constants.defaultBorderRadius,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: "Generate a ",
                        ),
                        TextSpan(
                          text: "Salary Slip",
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
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
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
                child: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialogBox(
                              body: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    const VerticalSpacing(20),
                                    CustomTextField(
                                      isOutlineBorder: true,
                                      labelText: 'Name',
                                      controller: TextEditingController(),
                                      isReadOnly: false,
                                      hintText: '',
                                    ),
                                    const VerticalSpacing(15),
                                    // CustomDropdownTextField(
                                    //   onChanged: (d) {},
                                    //   heading: 'Class',
                                    //   intValue: 1,
                                    //   enabled: true,
                                    //   options: const [
                                    //     'I',
                                    //     'II',
                                    //     'III',
                                    //     'IV',
                                    //     'V',
                                    //     'VI',
                                    //     'VII',
                                    //     'VIII',
                                    //     'IX',
                                    //     'X',
                                    //   ],
                                    //   option2: 'Class',
                                    //   value: 1,
                                    // ),
                                    const VerticalSpacing(15),
                                    CustomTextField(
                                      isOutlineBorder: true,
                                      labelText: 'Amount',
                                      controller: TextEditingController(),
                                      isReadOnly: false,
                                      hintText: '',
                                    ),
                                    const VerticalSpacing(15),
                                    CustomTextField(
                                      isOutlineBorder: true,
                                      labelText: 'Increament',
                                      controller: TextEditingController(),
                                      isReadOnly: false,
                                      hintText: '',
                                    ),
                                    const VerticalSpacing(15),
                                    CustomTextField(
                                      isOutlineBorder: true,
                                      labelText: 'Balance',
                                      controller: TextEditingController(),
                                      isReadOnly: false,
                                      hintText: '',
                                    ),
                                  ],
                                ),
                              ),
                              title: 'Generate Salary Slip',
                              onTap: () {},
                              buttonText: 'Print');
                        });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
