import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/timer_progress_bar.dart';

import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';

Widget timerLayout() {
  var todayScheduled = Get.find<AttendanceController>().logs.value.data != null
      ? Get.find<AttendanceController>().logs.value.data?.todayScheduled
      : 0;
  double value =
      (Get.find<AttendanceController>().duration.value.inMinutes / 60) /
          todayScheduled;
  print(value);
  return Center(
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        TimerProgressBar(
            lowerBound:
                value.isNaN || value.isInfinite ? 0 : getWorkPercentage(value)),
        Positioned(top: AppLayout.getHeight(30), child: timeStory())
      ],
    ),
  );
}

double getWorkPercentage(double value) {
  if (value >= 1) {
    return value = 1.00;
  }
  return value;
}

Widget timeStory() {
  Duration timerTime = Get.find<AttendanceController>().duration.value;
  String hrs = timerTime.inHours.remainder(60).toString();
  String mins = timerTime.inMinutes.remainder(60).toString();

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: (hrs.length < 2 && hrs.startsWith('0')) ? "" : hrs,
              style: AppStyle.timer_text.copyWith(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: (hrs.length < 2 && hrs.startsWith('0')) ? "" : " h ",
              style: AppStyle.small_text,
            ),
            TextSpan(
              text: mins,
              style: AppStyle.timer_text.copyWith(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: " m ",
              style: AppStyle.normal_text,
            ),
          ]),
        ),
        Text(
          "Worked",
          style: AppStyle.small_text,
        ),
      ],
    ),
  );
}
