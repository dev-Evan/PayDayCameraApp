
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/custom_divider.dart';
import 'package:pay_day_mobile/common/custom_navigator.dart';
import 'package:pay_day_mobile/common/custom_status_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_filter.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_log_text.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/selected_range_calender.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/timer_overview_layout.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/view/payrun_badge.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_view.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../widget/payslip_overview_layout.dart';

class PaySlip extends StatelessWidget {
  const PaySlip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: AppLayout.getHeight(194),

              child: Container(
                height: AppLayout.getHeight(222),

                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft:
                        Radius.circular(Dimensions.radiusMid),
                        bottomRight:
                        Radius.circular(Dimensions.radiusMid))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppLayout.getHeight(14),
                      ),
                      paySlipOverviewLayout(
                        context: context,
                      ),
                      attendanceLogText(
                          context: context,
                          text: AppString.text_payrun_badge,
                          onAction: () => CustomNavigator(
                              context: context,
                              pageName: const PayRunBadge())),
                    ],
                  ),
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
                        onTap: () => customButtomSheet(
                            context: context,
                            height: 0.9,
                            child: const SelectRangeCalender()),
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
              onTap: () => customButtomSheet(
                  context: context, height: 0.9, child: const PaySlipView()),
              child: Card(
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                              color: AppColor.hintColor,
                              fontSize: Dimensions.fontSizeSmall),
                        ),
                      ],
                    ),
                    CustomDiveider(25, 0.5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$32,00",
                          style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.secondaryColor,
                            fontSize: Dimensions.fontSizeDefault + 2,
                          ),
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(6),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '01.11.22 - 30.11.22',
                                  style: AppStyle.small_text
                                      .copyWith(color: AppColor.hintColor),
                                ),
                                SizedBox(
                                  width: AppLayout.getWidth(8),
                                ),
                                const Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: AppColor.hintColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: AppLayout.getWidth(8),
                            ),
                            Text(
                              'Monthly',
                              style: AppStyle.small_text
                                  .copyWith(color: AppColor.hintColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(6),
                        ),
                        CustomStatusButton(
                          bgColor: AppColor.successColor.withOpacity(0.2),
                          text: 'Generated',
                          textColor: AppColor.successColor,
                        )
                      ],
                    ),
                    CircleAvatar(
                        backgroundColor: AppColor.disableColor.withOpacity(0.2),
                        radius: 14,
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColor.primaryColor,
                          size: 16,
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: CustomDiveider(
                  AppLayout.getHeight(0.6), MediaQuery.of(context).size.width),
            )
          ],
        ),
      );
    },
  );
}
