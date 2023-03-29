import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/common/custom_navigator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_log_text.dart';
import 'package:pay_day_mobile/modules/leave/presentation/view/leave_calendar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/view/leve_records_view.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_leave_view.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/view/payrun_badge.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../widget/page_view_layout.dart';

class Leave extends StatelessWidget {
  const Leave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                        child: Container(
                        decoration: AppStyle.ContainerStyle.copyWith(color: AppColor.primaryColor).copyWith(
                          borderRadius: BorderRadius.only(
                              bottomLeft:
                              Radius.circular(Dimensions.radiusMid),
                              bottomRight:
                              Radius.circular(Dimensions.radiusMid))
                        ),

                          child: Column(
                            children: [
                              PageViewLayout(),
                              const Spacer(),
                              attendanceLogText(
                                  context: context,
                                  text: AppString.text_payrun_badge,
                                  onAction: () => CustomNavigator(
                                      context: context,
                                      pageName: const LeaveRecordsView())),
                            ],
                          ),


                        )),
                    Expanded(
                        flex: 8,
                        child: Container(
                          color: AppColor.cardColor,
                          child: Column(
                            children:  [
                               const DatePickerCustom(),
                           //   const Spacer(),
                              Padding(
                                padding:  const EdgeInsets.all(12.0),
                                child: CustomButton(AppString.text_apply_leve, ()=>customButtomSheet(
                                    context: context,
                                    Height: 0.9,
                                    Child: const ApplyLeaveView())),
                              ),

                            ],
                          ),



                        )),





                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
