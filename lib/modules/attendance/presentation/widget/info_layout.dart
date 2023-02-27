import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/custom_status_button.dart';

import '../../../../utils/app_style.dart';

Widget infoLayout() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _userName(),
          _getCurrentDate()
        ],
      ),
      const CustomStatusButton(bgColor: Colors.white, text: 'Regular',textColor: Colors.green,)
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
