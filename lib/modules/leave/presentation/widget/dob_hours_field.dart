import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/controller/date_time_helper_controller.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_lev_popup_calendar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/dob_single_day_field.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/pop_up_dialog.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/custom_text_field_dob.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../../common/widget/timer_picker.dart';

class ApplyLeaveDobHours extends StatelessWidget {
  const ApplyLeaveDobHours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<DateTimeController>()) {
      Get.delete<DateTimeController>();
    }
    Get.put(DateTimeController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textFieldTitleText(titleText: AppString.text_date),
        customSpacerHeight(height: 8),
        const ApplyLeaveDobSingleDay(),
        customSpacerHeight(height: 12),
        Row(
          children: [
            Flexible(
              child: _applyLeaveStartTime(
                context: context,
                fieldTitleText: AppString.text_start_day,
              ),
            ),
            customSpacerWidth(width: 12),
            Flexible(
              child: _applyLeaveEndTime(
                context: context,
                fieldTitleText: AppString.text_end_day,
              ),
            ),
          ],
        )
      ],
    );
  }
}

Widget _applyLeaveEndTime({
  context,
  fieldTitleText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textFieldTitleText(titleText: fieldTitleText),
      Obx(() => CustomTextFieldDob(
            hintText: Get.find<DateTimeController>().pickedOutTime.isEmpty
                ? AppString.text_select_time
                : Get.find<DateTimeController>().pickedOutTime.value,
            dobIcon: Icons.access_time_outlined,
            dobIconAction: () {
              timePicker(context);
            },
          )),
    ],
  );
}

Widget _applyLeaveStartTime({
  context,
  fieldTitleText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textFieldTitleText(titleText: fieldTitleText),
      Obx(() => CustomTextFieldDob(
            hintText: Get.find<DateTimeController>().pickedInTime.isEmpty
                ? AppString.text_select_time
                : Get.find<DateTimeController>().pickedInTime.value,
            dobIcon: Icons.access_time_outlined,
            dobIconAction: () {
              Get.find<DateTimeController>().isInTimeClicked.value = true;
              timePicker(context);
            },
          )),
    ],
  );
}
