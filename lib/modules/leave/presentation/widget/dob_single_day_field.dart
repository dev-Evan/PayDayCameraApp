import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/pop_up_dialog.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/custom_text_field_dob.dart';

import 'apply_lev_popup_calendar.dart';

class ApplyLeaveDobSingleDay extends StatelessWidget {
  const ApplyLeaveDobSingleDay({Key? key}) : super(key: key);

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
      ],
    );
  }
}
