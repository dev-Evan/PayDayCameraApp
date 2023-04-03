import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/timer_picker.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_lev_popup_calendar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/pop_up_dialog.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/custom_text_field_dob.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class ApplyLeaveDobHours extends StatelessWidget {
  const ApplyLeaveDobHours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldDob(
            hintText: '01-Jan-1996',
            dobIcon: Icons.calendar_month,
            dobIconAction: () => popUpDialog(
                context: context,
                Child: const ApplyLevPopUpCalendar(),
                DobSaveAction: () {})),
        customSpacerH(height: 12),
        Row(
          children: [
            Flexible(
              child: _timePicKarF(
                context: context,
                fieldTitleText: AppString.text_start_day,
              ),
            ),
            customSpacerW(width: 12),
            Flexible(
              child: _timePicKarF(
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

Widget _timePicKarF({context, fieldTitleText,}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textFieldTitleText(titleText: fieldTitleText),
      CustomTextFieldDob(
          hintText: AppString.text_select_time,

          dobIcon: Icons.access_time_outlined,
          dobIconAction: () => timePicker(
                context,
              )),
    ],
  );
}
