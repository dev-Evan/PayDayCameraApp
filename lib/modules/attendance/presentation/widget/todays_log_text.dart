import 'package:flutter/material.dart';

import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';

Widget  todaysLogIntroText() {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: AppLayout.getHeight(20),
        horizontal: AppLayout.getWidth(20)),
    child: Text(
      AppString.todays_log,
      style: AppStyle.mid_large_text.copyWith(color: Colors.grey),
    ),
  );
}