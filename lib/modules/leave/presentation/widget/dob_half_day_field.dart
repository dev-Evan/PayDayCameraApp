import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/dob_single_day_field.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/pop_up_dialog.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/custom_text_field_dob.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../controller/leave_controller.dart';
import 'apply_lev_popup_calendar.dart';

class ApplyLeaveDobHalfDay extends StatefulWidget {
  const ApplyLeaveDobHalfDay({Key? key}) : super(key: key);

  @override
  State<ApplyLeaveDobHalfDay> createState() => _ApplyLeaveDobHalfDayState();
}

class _ApplyLeaveDobHalfDayState extends State<ApplyLeaveDobHalfDay> {
  bool selectedFirst = false;
  bool selectedLast = false;

  int? _selectedValueIndex;
  List<String> buttonText = [
    AppString.text_first_half,
    AppString.text_last_half
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFieldTitleText(
                titleText: AppString.text_date,
              ),
              customSpacerHeight(height: 4),
              SizedBox(
                width: AppLayout.getSize(context).width * .45,
                child: const ApplyLeaveDobSingleDay(),
              )
            ],
          ),
        ),
        customSpacerWidth(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFieldTitleText(
                titleText: AppString.text_interval,
              ),
              customSpacerHeight(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    buttonText.length,
                    (index) => intervalButton(
                      index: index,
                      text: buttonText[index],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget intervalButton({required String text, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedValueIndex = index;
        });
        switch (_selectedValueIndex) {
          case 0:
            {
              Get.find<LeaveController>()
                  .requestLeaveQueries["leave_duration"] = "first_half";
            }
            break;
          case 1:
            {
              Get.find<LeaveController>()
                  .requestLeaveQueries["leave_duration"] = "last_half";
            }
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppLayout.getHeight(14),
            horizontal: AppLayout.getWidth(12)),
        decoration: BoxDecoration(
            color: index == _selectedValueIndex
                ? AppColor.primary_blue
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: index == _selectedValueIndex
                ? Border.all(width: 1, color: Colors.transparent)
                : Border.all(width: 1, color: Colors.grey)),
        child: Text(text,
            style: AppStyle.small_text_black.copyWith(
                color: index == _selectedValueIndex
                    ? Colors.white
                    : Colors.black)),
      ),
    );
  }
}
