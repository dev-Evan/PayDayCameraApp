import 'package:flutter/cupertino.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget textFieldTitleText({titleText}) {
  return Text(
    titleText,
    style: AppStyle.small_text.copyWith(
        color: AppColor.hintColor,
        fontWeight: FontWeight.w600,
        fontSize: Dimensions.fontSizeDefault + 1),
  );
}