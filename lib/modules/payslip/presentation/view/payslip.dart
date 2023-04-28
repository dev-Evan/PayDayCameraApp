import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/custom_divider.dart';
import 'package:pay_day_mobile/common/widget/custom_navigator.dart';
import 'package:pay_day_mobile/common/widget/custom_status_button.dart';
import 'package:pay_day_mobile/enum/range_calendar_method_imp.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_log_text.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/selected_range_calender.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/arrow_style.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/view/payrun_badge.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_view.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../../../common/custom_spacer.dart';
import '../widget/payslip_overview_layout.dart';

class PaySlip extends StatelessWidget {
  const PaySlip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: AppLayout.getHeight(194),
              child: Container(
                height: AppLayout.getHeight(222),
                decoration: AppStyle.ContainerStyle.copyWith(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(Dimensions.radiusMid),
                        bottomRight: Radius.circular(Dimensions.radiusMid))),
                child: Column(
                  children: [
                    customSpacerHeight(height: 20),
                    paySlipOverviewLayout(context: context),
                    attendanceLogText(
                        context: context,
                        text: AppString.text_payrun_badge,
                        onAction: () =>
                            CustomNavigator(
                                context: context,
                                pageName: const PayRunBadge())),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () =>
                            customButtomSheet(
                                context: context,
                                height: 0.9,
                                child: SelectRangeCalender(
                                  rangeCalendarMethodImp: RangeCalendarMethodImp
                                      .PAYSLIP,)),
                        child: Row(
                          children: [
                            Text(
                              AppString.textCustom,
                              style: AppStyle.mid_large_text.copyWith(
                                  color: AppColor.secondaryColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: AppLayout.getWidth(12),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.hintColor,
                            )
                          ],
                        ),
                      ),
                      Text(
                        '14 Dec 2022 - 30 Dec 2022',
                        style: AppStyle.small_text_black
                            .copyWith(color: AppColor.hintColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, bottom: 20),
              child: logsList(),

            )
          ],
        ),
      ),
    );
  }
}

Widget logsList() {
  return ListView.builder(
    itemCount: 222,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () =>
                  customButtomSheet(
                      context: context,
                      height: 0.9,
                      child: const PaySlipView()),
              child: Card(
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _dateTitle(dateText: '10', monthText: 'Dec'),
                    CustomDiveider(25, 0.5),
                    _cardMidText(
                        amountText: "\$32,00",
                        midDate: '01.11.22 - 30.11.22',
                        midMonth: 'Monthly',
                        statusText: 'Generated'),
                    avatarArrowIcon(),
                  ],
                ),
              ),
            ),
            _divider(context: context),
          ],
        ),
      );
    },
  );
}

Widget _divider({context}) {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: CustomDiveider(
        AppLayout.getHeight(0.6), MediaQuery
        .of(context)
        .size
        .width),
  );
}

Widget _dateTitle({dateText, monthText}) {
  return Column(
    children: [
      Text(
        "10",
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.normalTextColor,
            fontSize: Dimensions.fontSizeExtraLarge,
            fontWeight: FontWeight.w900),
      ),
      Text(
        "Dec",
        style: AppStyle.small_text.copyWith(
            color: AppColor.hintColor, fontSize: Dimensions.fontSizeSmall),
      ),
    ],
  );
}

Widget _cardMidText({amountText, midDate, midMonth, statusText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        amountText,
        style: AppStyle.mid_large_text.copyWith(
          color: AppColor.secondaryColor,
          fontSize: Dimensions.fontSizeDefault + 2,
        ),
      ),

      customSpacerHeight(height: 8),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                midDate,
                style: AppStyle.small_text.copyWith(color: AppColor.hintColor),
              ),
              customSpacerHeight(height: 8),
              const Icon(
                Icons.circle,
                size: 8,
                color: AppColor.hintColor,
              ),
            ],
          ),
          customSpacerHeight(height: 8),
          Text(
            midMonth,
            style: AppStyle.small_text.copyWith(color: AppColor.hintColor),
          ),
        ],
      ),
      customSpacerHeight(height: 6),
      CustomStatusButton(
        bgColor: AppColor.successColor.withOpacity(0.2),
        text: statusText,
        textColor: AppColor.successColor,
      )
    ],
  );
}

Widget _customTitleText({context, date}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () =>
                  customButtomSheet(
                      context: context,
                      height: 0.9,
                      child: SelectRangeCalender(
                        rangeCalendarMethodImp: RangeCalendarMethodImp
                            .PAYSLIP,)),
              child: _titleText(),
            ),
            Text(
              date,
              style: AppStyle.small_text_black.copyWith(
                  color: AppColor.hintColor),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _titleText() {
  return Row(
    children: [
      Text(
        AppString.textCustom,
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.secondaryColor, fontWeight: FontWeight.w700),
      ),
      SizedBox(
        width: AppLayout.getWidth(12),
      ),
      const Icon(
        Icons.keyboard_arrow_down,
        color: AppColor.hintColor,
      )
    ],
  );
}
