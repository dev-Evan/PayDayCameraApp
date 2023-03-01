import 'package:flutter/material.dart';
import '../widget/vertical_divider.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../../utils/app_style.dart';

Widget timerOverviewLayout() {
  return SizedBox(
    width: double.infinity,
    height: AppLayout.getHeight(60),
    child: PageView(
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
              balanceTimeLog(),
            ]),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
  return logInfo(title: AppString.text_overtime, time: "");
}

remainingTimeLog() {
  return logInfo(title: AppString.text_remaining, time: "");
}

scheduledTimeLog() {
  return logInfo(title: AppString.text_scheduled, time: "");
}

balanceTimeLog() {
  return logInfo(title: AppString.text_balance, time: "");
}

outTimeLog() {
  return logInfo(title: AppString.text_out, time: "3.55");
}

inTimeLog() {
  return logInfo(title: AppString.text_in, time: DateTime.now().toString());
}

logInfo({required String title, required String time, Color? fontColor}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: fontColor != null
              ? AppStyle.small_text.copyWith(color: fontColor)
              : AppStyle.small_text),
      RichText(
          text: TextSpan(children: [
        TextSpan(
          text: "11",
          style: fontColor != null
              ? AppStyle.extra_large_text
                  .copyWith(fontWeight: FontWeight.bold, color: fontColor)
              : AppStyle.extra_large_text.copyWith(fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: " am ",
          style: AppStyle.small_text,
        ),
      ]))
    ],
  );
}
