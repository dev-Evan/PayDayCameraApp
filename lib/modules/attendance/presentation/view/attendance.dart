import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_app_button.dart';
import 'package:pay_day_mobile/common/widget/custom_navigator.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/attendance_logs.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_log_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../../../common/widget/loading_indicator.dart';
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
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<AttendanceController>()) {
      Get.lazyPut(() => AttendanceController(), fenix: true);
    }
    controller.checkUserIsPunchedIn();
    controller.getDailyLog();
    return controller.obx(
        (state) => Scaffold(
              body: _body(context),
            ),
        onLoading: const LoadingIndicator());
  }

  Widget _body(
    BuildContext context,
  ) {
    return SafeArea(
        child: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _upperLayout(),
          Obx(
            () => (controller.logs.value.data != null &&
                    controller.logs.value.data!.dailyLogs!.isNotEmpty)
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
                          logList(controller.logs.value.data!.dailyLogs!),
                        ]),
                  )
                : noLogLayout(),
          )
        ],
      ),
    ));
  }

  Future _openBottomSheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) => const LogEntryBottomSheet(),
    );
  }

  _upperLayout() => Obx(() => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
          gradient: controller.logs.value.data != null &&
                  controller.logs.value.data!.todayOvertime.toDouble() > 0
              ? LinearGradient(colors: [
                  AppColor.overTimeGradientOne,
                  AppColor.overTimeGradientTwo
                ])
              : LinearGradient(colors: [
                  AppColor.balanceTimeGradientOne,
                  AppColor.balanceTimeGradientTwo
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
                customSpacerHeight(height: 40),
                Obx(() => timerLayout()),
                Obx(() => timerOverviewLayout()),
                customSpacerHeight(height: 30),
                SizedBox(
                    height: AppLayout.getHeight(Dimensions.paddingDefault)),
                punchButton(() async {
                  await controller.getLatLong();
                  _openBottomSheet();
                }),
                punchOutLayout(),
                customSpacerHeight(height: 20),
                Obx(() => dotIndicator(controller.currentIndex.value)),
                attendanceLogText(
                    text: AppString.text_attendance_log,
                    onAction: () {
                      Get.find<AttendanceLogsController>()
                          .getLogSummaryByMonth();
                      Get.find<AttendanceLogsController>()
                          .getLogSummaryByYear();
                      Get.find<AttendanceLogsController>()
                          .getAllFilteredLogSummary();
                      Get.find<AttendanceLogsController>()
                          .getLogSummaryOverview();
                      CustomNavigator(
                          context: Get.context!,
                          pageName: const AttendanceLogsScreen());
                    }),
              ]),
        ),
      ));
}

punchOutLayout() {
  return Row(
    children: [
      AppButton(
        buttonText: AppString.text_punch_out,
        onPressed: () {},
        buttonColor: Colors.white.withOpacity(.18),
        iconsData: Icons.logout,
        textColor: Colors.white,
      ),
      customSpacerWidth(width: 8),
      AppButton(
          buttonText: AppString.text_punch_out,
          onPressed: () {},
          buttonColor: Colors.transparent,
          borderColor: Colors.white,
      iconsData: Icons.local_cafe_outlined),
    ],
  );
}
