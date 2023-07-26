import 'package:flutter/material.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';

Widget todayLogIntroText() {
  return Text(
    AppString.todays_log,
    style: AppStyle.mid_large_text
        .copyWith(color: AppColor.greyDark, fontWeight: FontWeight.w600),
  );
}
