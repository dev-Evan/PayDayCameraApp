import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_lev_popup_calendar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/pop_up_dialog.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/custom_text_field_dob.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class ApplyLeaveDobMultiDay extends StatelessWidget {
  const ApplyLeaveDobMultiDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: _dobField(
              hintText: '12-02-2012',
              context: context,
              onAction: () {},
              fieldTitleText: AppString.text_start_day),
        ),
        customSpacerWidth(width: 12),
        Flexible(
          child: _dobField(
              hintText: '12-02-2012',
              context: context,
              onAction: () {},
              fieldTitleText: AppString.text_end_day),
        ),
      ],
    );
  }
}

Widget _dobField({context, fieldTitleText, hintText, onAction}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textFieldTitleText(titleText: fieldTitleText),
      CustomTextFieldDob(
          hintText: hintText,
          dobIcon: Icons.calendar_month,
          dobIconAction: () => popUpDialog(
              context: context,
              child: const ApplyLevPopUpCalendar(),
              dobSaveAction: () => onAction())),
    ],
  );
}
