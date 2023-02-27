import 'package:flutter/material.dart';
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
              _verticalDivider(),
              const Spacer(),
              outTimeLog(),
              const Spacer(),
              _verticalDivider(),
              const Spacer(),
              balanceTimeLog(),
            ]),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              scheduledTimeLog(),
              const Spacer(),
              _verticalDivider(),
              const Spacer(),
              remainingTimeLog(),
              const Spacer(),
              _verticalDivider(),
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

logInfo({required String title, required String time}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: AppStyle.small_text),
      RichText(
          text: TextSpan(children: [
        TextSpan(
          text: "11",
          style:
              AppStyle.extra_large_text.copyWith(fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: " am ",
          style: AppStyle.small_text,
        ),
      ]))
    ],
  );
}

_verticalDivider() {
  return Container(
    height: AppLayout.getHeight(30),
    padding: const EdgeInsets.all(1),
    color: Colors.white,
  );
}
