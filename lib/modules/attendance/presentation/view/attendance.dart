import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_app_button.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/custom_navigator.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/attendance_log.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_log_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../../../common/widget/loading_indicator.dart';
import '../../../../utils/app_style.dart';
import '../widget/break_pop_up.dart';
import '../widget/dot_indicator.dart';
import '../widget/info_layout.dart';
import '../widget/daily_log_list.dart';
import '../widget/no_log_layout.dart';
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
    return controller.obx(
        (state) => Scaffold(body: _body(context)),
        onLoading: const LoadingIndicator());
  }

  Widget _body(BuildContext context) {
    return SafeArea(
        child: RefreshIndicator(
      onRefresh: _refreshPage,
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
                          vertical:
                              AppLayout.getHeight(Dimensions.paddingLarge),
                          horizontal:
                              AppLayout.getWidth(Dimensions.paddingLarge)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            todayLogIntroText(),
                            SizedBox(
                                height: AppLayout.getHeight(
                                    Dimensions.paddingLarge)),
                            dailyLogList(controller.logs.value.data!.dailyLogs!),
                          ]),
                    )
                  : noLogLayout(),
            )
          ],
        ),
      ),
    ));
  }

  _openBottomSheet() => customButtonSheet(
    context: Get.context,
    height: 0.9,
    child: const LogEntryBottomSheet(),
  );

  _upperLayout() => Obx(() => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
          gradient: controller.logs.value.data != null &&
                  controller.logs.value.data!.todayOvertime.toDouble() > 0
              ? const LinearGradient(colors: [
                  AppColor.overTimeGradientOne,
                  AppColor.overTimeGradientTwo
                ])
              : const LinearGradient(colors: [
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
                controller.isPunchIn.isFalse
                    ? punchInLayout()
                    : punchOutLayout(),
                customSpacerHeight(height: 20),
                // attendanceLogText(
                //     text: "text_attendance_log".tr,
                //     onAction: () {
                //       Get.find<AttendanceLogsController>()
                //           .getLogSummaryByMonth();
                //       Get.find<AttendanceLogsController>()
                //           .getLogSummaryByYear();
                //       Get.find<AttendanceLogsController>()
                //           .getAllFilteredLogSummary();
                //       Get.find<AttendanceLogsController>()
                //           .getLogSummaryOverview();
                //       customNavigator(
                //           context: Get.context!,
                //           pageName: const AttendanceLog());
                //     }),
              ]),
        ),
      ));

  punchInLayout() => InkWell(
        onTap: ()async  {
          _openBottomSheet();
          await controller.getLatLong();
        },
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1, color: Colors.white.withOpacity(.33)),
              color: Colors.white.withOpacity(.18),
              borderRadius: BorderRadius.circular(
                Dimensions.radiusDefault,
              )),
          width: double.maxFinite,
          height: AppLayout.getHeight(48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.login,
                color: Colors.white,
                size: AppLayout.getWidth(20),
              ),
              customSpacerWidth(width: 10),
              Text("text_punch_in".tr, style: AppStyle.normal_text),
            ],
          ),
        ),
      );

  punchOutLayout() {
    return Row(
      children: [
        AppButton(
          buttonText: "text_punch_out".tr,
          onPressed: () async {
            _openBottomSheet();
            await controller.getLatLong();
          },
          borderColor: Colors.white,
          buttonColor: Colors.white.withOpacity(.18),
          iconsData: Icons.logout,
          textColor: Colors.white,
        ),
      ],
    );
  }

  Future<void> _refreshPage() async {
    await controller.checkUserIsPunchedIn();
    await controller.getDailyLog();
  }
}
