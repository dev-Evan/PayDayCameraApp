import 'package:flutter/cupertino.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget textFieldTitleText({titleText}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 2.0),
    child: Text(
      titleText,
      style: AppStyle.small_text.copyWith(
          color: AppColor.normalTextColor,
          fontWeight: FontWeight.w600,
          fontSize: Dimensions.fontSizeDefault+2 ),
    ),
  );
}