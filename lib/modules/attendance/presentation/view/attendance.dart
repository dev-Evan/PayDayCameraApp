import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_log_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../widget/dot_indicator.dart';
import '../widget/info_layout.dart';
import '../widget/punch_button.dart';
import '../widget/timer_layout.dart';
import '../widget/timer_overview_layout.dart';

class Attendance extends StatelessWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
        child: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
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
                    punchButton(() {}),
                    SizedBox(
                        height: AppLayout.getHeight(Dimensions.paddingMid)),
                    dotIndicator(),
                    attendanceLogText(),
                  ]),
            ),
          ),
        ],
      ),
    ));
  }
}
