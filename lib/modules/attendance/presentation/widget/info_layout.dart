import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/custom_status_button.dart';

import '../../../../utils/app_style.dart';

Widget infoLayout() {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _userName(),
          _getCurrentDate()
        ],
      ),
      CustomStatusButton(bgColor: Colors.green, text: 'Regular')
    ],
  );
}

_userName() {
  return Text(
    "Hi, Steve",
    style: AppStyle.title_text,
  );
}

_getCurrentDate() {
  return Text(
    DateFormat.MMMMEEEEd().format(DateTime.now()),
    style: AppStyle.normal_text,
  );
}
