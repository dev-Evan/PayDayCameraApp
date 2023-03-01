import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';

Widget todaysLogIntroText() {
  return Text(
    AppString.todays_log,
    style: AppStyle.mid_large_text
        .copyWith(color: AppColor.grey_drak, fontWeight: FontWeight.w600),
  );
}
