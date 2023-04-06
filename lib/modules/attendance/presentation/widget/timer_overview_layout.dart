import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inTimeLog(),
              const Spacer(),
              verticalDivider(),
              const Spacer(),
              outTimeLog(),
              const Spacer(),
              verticalDivider(),
              const Spacer(),
              balanceTimeLog()
            ]),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          scheduledTimeLog(),
          const Spacer(),
          verticalDivider(),
          const Spacer(),
          remainingTimeLog(),
          const Spacer(),
          verticalDivider(),
          const Spacer(),
          overtimeTimeLog(),
        ]),
      ],
    ),
  );
}

overtimeTimeLog() {
  return logInfo(
      title: AppString.text_overtime,
      time: TimeCounterHelper.getTimeStringFromDouble(
          Get.find<AttendanceController>().logs.value.data != null
              ? Get.find<AttendanceController>()
                  .logs
                  .value
                  .data!
                  .todayOvertime
                  !.toDouble()
              : 0.0));
}

remainingTimeLog() {
  return scheduledLogInfo(
      title: AppString.text_remaining,
      time: TimeCounterHelper.getTimeStringFromDouble(
          Get.find<AttendanceController>().logs.value.data != null
              ? Get.find<AttendanceController>()
                  .logs
                  .value
                  .data!
                  .todayShortage
                  !.toDouble()
              : 0.0));
}

scheduledTimeLog() {
  return scheduledLogInfo(
      title: AppString.text_scheduled,
      time: TimeCounterHelper.getTimeStringFromDouble(
          Get.find<AttendanceController>().logs.value.data != null
              ? Get.find<AttendanceController>()
                  .logs
                  .value
                  .data!
                  .todayScheduled
                  !.toDouble()
              : 0.0));
}

balanceTimeLog() {
  Duration timerTime = Get.find<AttendanceController>().countdownDuration.value;
  String hrs = timerTime.inHours.remainder(60).toString();
  String mins = timerTime.inMinutes.remainder(60).toString();
  if ((hrs.length < 2 && hrs.startsWith('0'))) {
    hrs = '';
  }
  if ((mins.length < 2 && hrs.startsWith('0'))) {
    hrs = '';
  }
  return logInfo(title: AppString.text_balance, time: "- $hrs h $mins m");
}

outTimeLog() {
  var controller = Get.find<AttendanceController>();
  return scheduledLogInfo(
      title: AppString.text_out,
      time: (!controller.isPunchIn.value &&
              controller.logs.value.data != null &&
              controller.logs.value.data!.dailyLogs!.isNotEmpty)
          ? controller.logs.value.data?.dailyLogs?.first.outTime
          : '');
}

inTimeLog() {
  var controller = Get.find<AttendanceController>();
  return scheduledLogInfo(
      title: AppString.text_in,
      time: (controller.logs.value.data != null &&
              controller.logs.value.data!.dailyLogs!.isNotEmpty)
          ? controller.logs.value.data?.dailyLogs?.first.inTime
          : '');
}

logInfo({required String title, required String time, Color? fontColor}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
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
    crossAxisAlignment: CrossAxisAlignment.center,
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
