import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_lev_popup_calendar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/pop_up_dialog.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/custom_text_field_dob.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class ApplyLeaveDobMultiDay extends GetView<LeaveController> {
  const ApplyLeaveDobMultiDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Flexible(
              child: _dobField(
                  isStartDate: true,
                  hintText: controller.startDate.value,
                  context: context,
                  fieldTitleText: AppString.text_start_day),
            ),
            customSpacerWidth(width: 12),
            Flexible(
              child: _dobField(
                  isStartDate: false,
                  hintText: controller.endDate.value,
                  context: context,
                  fieldTitleText: AppString.text_end_day),
            ),
          ],
        ));
  }
}

Widget _dobField(
    {context, fieldTitleText, hintText, required bool isStartDate}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textFieldTitleText(titleText: fieldTitleText),
      CustomTextFieldDob(
          hintText: hintText,
          dobIcon: Icons.calendar_month,
          dobIconAction: () => popUpDialog(
              context: context,
              child: ApplyLevPopUpCalendar(
                isStartDay: isStartDate,
              ))),
    ],
  );
}
