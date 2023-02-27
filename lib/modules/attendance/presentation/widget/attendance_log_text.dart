import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../../utils/app_style.dart';

Widget attendanceLogText() {
  return Center(
    child: TextButton.icon(
      onPressed: () {},
      icon: Text(
        AppString.text_attendance_log,
        style: AppStyle.normal_text,
      ),
      label: Icon(Icons.arrow_forward_outlined,
          color: Colors.white, size: AppLayout.getWidth(16)),
    ),
  );
}