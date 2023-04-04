import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/text_field.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/pop_up_dialog.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/custom_text_field_dob.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import 'apply_lev_popup_calendar.dart';

class ApplyLeaveDobHalfDay extends StatefulWidget {
  const ApplyLeaveDobHalfDay({Key? key}) : super(key: key);

  @override
  State<ApplyLeaveDobHalfDay> createState() => _ApplyLeaveDobHalfDayState();
}

class _ApplyLeaveDobHalfDayState extends State<ApplyLeaveDobHalfDay> {
  bool selectedFirst = false;
  bool selectedLast = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFieldTitleText(
                titleText: AppString.text_start_day,
              ),
              CustomTextFieldDob(
                  hintText: '01-Jan-1996',
                  dobIcon: Icons.calendar_month,
                  dobIconAction: () => popUpDialog(
                      context: context,
                      child: const ApplyLevPopUpCalendar(),
                      dobSaveAction: () {})),
            ],
          ),
        ),
        customSpacerWidth(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFieldTitleText(
                titleText: AppString.text_end_day,
              ),
              Row(
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedFirst = !selectedFirst;
                        });
                      },
                      child: _endDayButton(
                          selectedValue: selectedFirst,
                          btnText: AppString.text_first),
                    ),
                  ),
                  customSpacerWidth(width: 6),
                  Flexible(
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedLast = !selectedLast;
                          });
                        },
                        child: _endDayButton(
                            selectedValue: selectedLast,
                            btnText: AppString.text_last)),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget _endDayButton({selectedValue, btnText}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        side: BorderSide(
            color: selectedValue
                ? AppColor.primaryColor
                : AppColor.disableColor.withOpacity(0.4))),
    color: selectedValue
        ? AppColor.primaryColor.withOpacity(0.2)
        : AppColor.disableColor.withOpacity(0.4),
    child: _endDayBtnText(btnTextS: btnText, value: selectedValue),
  );
}

Widget _endDayBtnText({btnTextS, value}) {
  return Padding(
    padding: EdgeInsets.only(
        left: AppLayout.getWidth(Dimensions.fontSizeLarge+2),
        right: AppLayout.getWidth(Dimensions.fontSizeLarge+2),
        top: AppLayout.getHeight(Dimensions.fontSizeExtraDefault),
        bottom: AppLayout.getHeight(Dimensions.fontSizeExtraDefault)),
    child: Text(
      btnTextS,
      style: AppStyle.small_text_black.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: Dimensions.fontSizeDefault,
          letterSpacing: 0.2,
          color: value ? AppColor.primaryColor : AppColor.normalTextColor),
    ),
  );
}
