import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/widget/custom_navigator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/attendance_logs.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../../utils/app_style.dart';

Widget attendanceLogText({BuildContext? context, text, onAction}) {
  return Center(
    child: TextButton.icon(
      onPressed: () => onAction(),
      icon: Text(
        text,
        style: AppStyle.normal_text,
      ),
      label: Icon(Icons.arrow_forward_outlined,
          color: Colors.white, size: AppLayout.getWidth(16)),
    ),
  );
}
