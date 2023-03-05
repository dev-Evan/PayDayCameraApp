import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/log_details_bottomsheet.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_log_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../widget/dot_indicator.dart';
import '../widget/info_layout.dart';
import '../widget/log_list.dart';
import '../widget/no_log_layout.dart';
import '../widget/punch_button.dart';
import '../widget/timer_layout.dart';
import '../widget/timer_overview_layout.dart';
import '../widget/todays_log_text.dart';
import 'log_entry_bottomsheet.dart';

class Attendance extends StatelessWidget {
  bool loggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              gradient: LinearGradient(
                  colors: [AppColor.gradient_blue1, AppColor.gradient_blue2]),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getWidth(20),
                vertical: AppLayout.getHeight(20),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    infoLayout(),
                    SizedBox(
                      height: AppLayout.getHeight(Dimensions.paddingExtraLarge),
                    ),
                    timerLayout(),
                    timerOverviewLayout(),
                    SizedBox(
                        height: AppLayout.getHeight(Dimensions.paddingDefault)),
                    punchButton(() => _openBottomSheet(context: context)),
                    SizedBox(
                        height: AppLayout.getHeight(Dimensions.paddingMid)),
                    dotIndicator(),
                    attendanceLogText(),
                  ]),
            ),
          ),
          loggedIn
              ? Container(
                  padding: EdgeInsets.symmetric(
                      vertical: AppLayout.getHeight(Dimensions.paddingLarge),
                      horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        todaysLogIntroText(),
                        SizedBox(
                            height:
                                AppLayout.getHeight(Dimensions.paddingLarge)),
                        logList(),
                      ]),
                )
              : noLogLayout(),
        ],
      ),
    ));
  }

  Future _openBottomSheet({required BuildContext context}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => logEntryBottomSheet(),
    );
  }

}
