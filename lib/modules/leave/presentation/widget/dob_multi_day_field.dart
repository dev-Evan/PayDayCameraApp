import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_lev_popup_calendar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/pop_up_dialog.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/custom_text_field_dob.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.text_start_day,
                style: AppStyle.small_text.copyWith(
                    color: AppColor.hintColor,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.fontSizeDefault + 1),
              ),
              CustomTextFieldDob(
                  hintText: '01-Jan-1996',
                  dobIcon: Icons.calendar_month,
                  dobIconAction: ()=>popUpDialog(context: context,Child: const ApplyLevPopUpCalendar(),DobSaveAction: (){})),

            ],
          ),
        ),
        SizedBox(
          width: AppLayout.getWidth(12),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.text_end_day,
                style: AppStyle.small_text.copyWith(
                    color: AppColor.hintColor,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.fontSizeDefault + 1),
              ),
              CustomTextFieldDob(
                hintText: '01-Jan-1996',
                dobIcon: Icons.calendar_month,
                  dobIconAction: ()=>popUpDialog(context: context,Child: const ApplyLevPopUpCalendar(),DobSaveAction: (){})),


            ],
          ),
        ),
      ],
    );
  }
}
