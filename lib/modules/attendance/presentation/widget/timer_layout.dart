import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/timer_progress_bar.dart';

import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';

Widget timerLayout() {
  return Center(
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        const TimerProgressBar(),
        Positioned(top: AppLayout.getHeight(30), child: timeStory())
      ],
    ),
  );
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
              style: AppStyle.timer_text
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: (hrs.length < 2 && hrs.startsWith('0')) ? "" : " h ",
              style: AppStyle.small_text,
            ),
            TextSpan(
              text: mins,
              style: AppStyle.timer_text
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: " m ",
              style: AppStyle.normal_text,
            ),
          ]),
        ),
        // Get.find<AttendanceController>().isPunchIn.value == true
        //     ? RichText(
        //         text: TextSpan(children: [
        //           TextSpan(
        //             text: (hrs.length < 2 && hrs.startsWith('0')) ? "" : hrs,
        //             style: AppStyle.timer_text
        //                 .copyWith(fontWeight: FontWeight.bold),
        //           ),
        //           TextSpan(
        //             text: (hrs.length < 2 && hrs.startsWith('0')) ? "" : " h ",
        //             style: AppStyle.small_text,
        //           ),
        //           TextSpan(
        //             text: mins,
        //             style: AppStyle.timer_text
        //                 .copyWith(fontWeight: FontWeight.bold),
        //           ),
        //           TextSpan(
        //             text: " m ",
        //             style: AppStyle.normal_text,
        //           ),
        //         ]),
        //       )
        //     : RichText(
        //         text: TextSpan(children: [
        //           TextSpan(
        //             text: (TimeCounterHelper.getHrsStringFromDouble(Get.find<AttendanceController>().logs.value.data?.todayWorked.toDouble()).length < 2 && hrs.startsWith('0')) ? "" : hrs,
        //             style: AppStyle.timer_text
        //                 .copyWith(fontWeight: FontWeight.bold),
        //           ),
        //           TextSpan(
        //             text: (TimeCounterHelper.getHrsStringFromDouble(Get.find<AttendanceController>().logs.value.data?.todayWorked.toDouble()).length < 2 && hrs.startsWith('0')) ? "" : " h ",
        //             style: AppStyle.small_text,
        //           ),
        //           TextSpan(
        //             text: TimeCounterHelper.getMinsStringFromDouble(Get.find<AttendanceController>().logs.value.data?.todayWorked.toDouble()),
        //             style: AppStyle.timer_text
        //                 .copyWith(fontWeight: FontWeight.bold),
        //           ),
        //           TextSpan(
        //             text: " m ",
        //             style: AppStyle.normal_text,
        //           ),
        //         ]),
        //       ),
        Text(
          "Worked",
          style: AppStyle.small_text,
        ),
      ],
    ),
  );
}
