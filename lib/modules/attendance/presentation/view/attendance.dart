import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/error_alert.dart';
import 'package:pay_day_mobile/common/loading_indicator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
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

class Attendance extends GetView<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    Get.put(AttendanceController());
    return controller.obx(
            (state) =>
            Scaffold(
              body: _body(context),
            ),
        onLoading: const LoadingIndicator()

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
                      colors: [
                        AppColor.gradient_blue1,
                        AppColor.gradient_blue2
                      ]),
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
                            height:
                            AppLayout.getHeight(Dimensions.paddingExtraLarge)),
                        Obx(() => timerLayout()),
                        Obx(() => timerOverviewLayout()),
                        SizedBox(
                            height: AppLayout.getHeight(
                                Dimensions.paddingDefault)),
                        punchButton(()  async {
                          _openBottomSheet(context: context);
                          await Get.find<AttendanceController>().getLatLong();
                        }),
                        SizedBox(
                            height: AppLayout.getHeight(Dimensions.paddingMid)),
                        Obx(() => dotIndicator()),
                        attendanceLogText(context),
                      ]),
                ),
              ),
              Obx(
                    () =>
                Get
                    .find<AttendanceController>()
                    .logs
                    .value
                    .data!
                    .dailyLogs!
                    .isNotEmpty
                    ? Container(
                  padding: EdgeInsets.symmetric(
                      vertical: AppLayout.getHeight(Dimensions.paddingLarge),
                      horizontal:
                      AppLayout.getWidth(Dimensions.paddingLarge)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        todaysLogIntroText(),
                        SizedBox(
                            height:
                            AppLayout.getHeight(Dimensions.paddingLarge)),
                        logList(Get
                            .find<AttendanceController>()
                            .logs
                            .value
                            .data!
                            .dailyLogs!),
                      ]),
                )
                    : noLogLayout(),
              )
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
