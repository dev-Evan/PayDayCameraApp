import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/domain/daily_log/daily_log.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/time_counter_helper.dart';
import '../widget/vertical_divider.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../../utils/app_style.dart';

Widget timerOverviewLayout() {
  return SizedBox(
    width: double.infinity,
    height: AppLayout.getHeight(60),
    child: PageView(
      onPageChanged: (currentIndex) =>
          Get.find<AttendanceController>().currentIndex.value = currentIndex,
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(flex: 1, child: inTimeLog()),
          Expanded(flex: 2, child: outTimeLog()),
          Expanded(flex: 1, child: balanceTimeLog()),
        ]),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: scheduledTimeLog()),
              Expanded(flex: 2, child: remainingTimeLog()),
              Expanded(flex: 1, child: overtimeTimeLog()),
            ]),
      ],
    ),
  );
}

overtimeTimeLog() {
  Data? data = Get.find<AttendanceController>().logs.value.data;
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      logInfo(
          title: AppString.text_overtime,
          time: TimeCounterHelper.getTimeStringFromDouble(
              data?.todayOvertime.toDouble() ?? 0.0))
    ],
  );
}

remainingTimeLog() {
  Data? data = Get.find<AttendanceController>().logs.value.data;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      customSpacerWidth(width: 16),
      scheduledLogInfo(
          title: AppString.text_remaining,
          time: TimeCounterHelper.getTimeStringFromDouble(
              data?.todayShortage.toDouble() ?? 0.0)),
      verticalDivider(),
    ],
  );
}

scheduledTimeLog() {
  Data? data = Get.find<AttendanceController>().logs.value.data;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      scheduledLogInfo(
          title: "text_scheduled".tr,
          time: TimeCounterHelper.getTimeStringFromDouble(
              data?.todayScheduled.toDouble() ?? 0.0)),
      verticalDivider()
    ],
  );
}

overTimedBalanceTime() {
  Duration timerTime = Get.find<AttendanceController>().balanceDuration.value;
  String hrs = timerTime.inHours.remainder(60).toString();
  String mins = timerTime.inMinutes.remainder(60).toString();

//if there is no hr then not need to show 0 before mins mark
  if (hrs.length.isEqual(1) && hrs.startsWith('0') && mins.length < 2) {
    hrs = '';
  }
  return logInfo(title: "text_balance".tr, time: "$hrs h $mins m");
}

Widget normalBalanceTime() {
  Duration timerTime = Get.find<AttendanceController>().countdownDuration.value;
  String hrs = timerTime.inHours.remainder(60).toString();
  String mins = timerTime.inMinutes.remainder(60).toString();

//if there is no hr then not need to show 0 before mins mark
  if (hrs.length.isEqual(1) && hrs.startsWith('0') && mins.length < 2) {
    hrs = '';
  }
  return logInfo(title: "text_balance".tr, time: "-$hrs h $mins m");
}

outTimeLog() {
  AttendanceController controller = Get.find<AttendanceController>();
  Data? data = controller.logs.value.data;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      customSpacerWidth(width: 16),
      scheduledLogInfo(
          title: "text_out".tr,
          time: data != null &&
                  controller.isPunchIn.isFalse &&
                  data.dailyLogs!.isNotEmpty
              ? data.dailyLogs?.first.outTime
              : ''),
      verticalDivider(),
    ],
  );
}

inTimeLog() {
  Data? data = Get.find<AttendanceController>().logs.value.data;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      scheduledLogInfo(
          title: "text_in".tr,
          time: data != null && data.dailyLogs!.isNotEmpty
              ? data.dailyLogs?.last.inTime
              : ''),
      verticalDivider(),
    ],
  );
}

Widget balanceTimeLog() {
  var data = Get.find<AttendanceController>().logs.value.data;
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      data != null
          ? data.todayOvertime > 0
              ? overTimedBalanceTime()
              : normalBalanceTime()
          : Container()
    ],
  );
}

logInfo({required String title, required String time, Color? fontColor}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(title,
          style: fontColor != null
              ? AppStyle.small_text.copyWith(color: Colors.grey)
              : AppStyle.small_text),
      Text(
        time.isNotEmpty
            ? "${time.substring(0, time.length - 2)} ${time.substring(time.length - 2)}"
            : time,
        style: fontColor != null
            ? AppStyle.normal_text
                .copyWith(fontWeight: FontWeight.bold, color: fontColor)
            : AppStyle.normal_text.copyWith(fontWeight: FontWeight.bold),
      ),
    ],
  );
}

scheduledLogInfo({required String title, String? time, Color? fontColor}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(title,
          style: fontColor != null
              ? AppStyle.small_text.copyWith(color: Colors.grey)
              : AppStyle.small_text),
      Text(
        time ?? "",
        style: fontColor != null
            ? AppStyle.normal_text
                .copyWith(fontWeight: FontWeight.bold, color: fontColor)
            : AppStyle.normal_text.copyWith(fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget attendanceLogsOverviewLayout(context) {
  return SizedBox(
    width: double.infinity,
    height: AppLayout.getHeight(230),
    child: PageView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logsText(AppString.textMonth),
            SizedBox(
              height: AppLayout.getHeight(210),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3.8 / 3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      color: AppColor.cardColor.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              Dimensions.radiusDefault + 2),
                          side: BorderSide(
                              width: 1,
                              color: AppColor.cardColor.withOpacity(0.2))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '148',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.fontSizeLarge - 3,
                                      color:
                                          AppColor.cardColor.withOpacity(0.8)),
                                ),
                                Text(
                                  'Worked',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.fontSizeMid - 3,
                                      color:
                                          AppColor.cardColor.withOpacity(0.8)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logsText(AppString.textYear),
            SizedBox(
              height: AppLayout.getHeight(210),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3.8 / 3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      color: AppColor.cardColor.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              Dimensions.radiusDefault + 2),
                          side: BorderSide(
                              width: 1,
                              color: AppColor.cardColor.withOpacity(0.2))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '148',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.fontSizeLarge - 3,
                                      color:
                                          AppColor.cardColor.withOpacity(0.8)),
                                ),
                                Text(
                                  'Worked',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.fontSizeMid - 3,
                                      color:
                                          AppColor.cardColor.withOpacity(0.8)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget logsText(text) {
  return SizedBox(
    height: AppLayout.getHeight(20),
    width: AppLayout.getWidth(150),
    child: Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Text(
        text,
        style: AppStyle.large_text.copyWith(fontSize: Dimensions.fontSizeMid),
      ),
    ),
  );
}
