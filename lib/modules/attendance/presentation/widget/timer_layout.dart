import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/timer_progress_bar.dart';

import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';

Widget timerLayout() {
  return Center(
    child: Stack(
      alignment: Alignment.topCenter,
      children: [TimerProgressBar(),Positioned(top: AppLayout.getHeight(30),child: timeStory())],
    ),
  );
}

Widget timeStory() {
  // Duration timerTime = Get.find<AttendanceController>().duration.value;
  // String twoDigits(int num) => num.toString().padLeft(2, "0");
  // final hrs = twoDigits(timerTime.inHours.remainder(60));
  // final mins = twoDigits(timerTime.inMinutes.remainder(60));

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(children: [
            // TextSpan(
            //   text: "5",
            //   style: AppStyle.title_text.copyWith(fontWeight: FontWeight.bold),
            // ),
            // TextSpan(
            //   text: " h ",
            //   style: AppStyle.small_text,
            // ),
            TextSpan(
              text: "45",
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
