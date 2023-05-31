import 'package:flutter/cupertino.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';



Widget textFieldTitleText({titleText}) {
  return Padding(
    padding:  EdgeInsets.only(top: AppLayout.getHeight(10),bottom:AppLayout.getHeight(10) ),
    child: Text(
      titleText,
      style: AppStyle.normal_text_black),
  );
}

Widget textFieldTitleText2({titleText}) {
  return Padding(
    padding:  EdgeInsets.only(top: AppLayout.getHeight(0),bottom:AppLayout.getHeight(16) ),
    child: Text(
      titleText,
      style: AppStyle.small_text.copyWith(
          color: AppColor.hintColor,
          fontWeight: FontWeight.w600,
          fontSize: Dimensions.fontSizeDefault),
    ),
  );
}