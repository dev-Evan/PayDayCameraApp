import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_navigator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
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
    bool value = Get.isRegistered<AttendanceController>();
    if (value) {
      Get.lazyPut(() => AttendanceController(),fenix: true);
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
                        height:
                            AppLayout.getHeight(Dimensions.paddingExtraLarge)),
                    Obx(() => timerLayout()),
                    Obx(() => timerOverviewLayout()),
                    SizedBox(
                        height: AppLayout.getHeight(Dimensions.paddingDefault)),
                    punchButton(() async {
                      await _openBottomSheet();
                      await controller.getLatLong();
                    }),
                    SizedBox(
                        height: AppLayout.getHeight(Dimensions.paddingMid)),
                    Obx(() => dotIndicator(controller.currentIndex.value)),
                    attendanceLogText(
                      context: context,
                      text: AppString.text_attendance_log,
                      onAction: () => CustomNavigator(
                          context: context,
                          pageName: const AttendanceLogsScreen()),
                    ),
                  ]),
            ),
          ),
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
}
