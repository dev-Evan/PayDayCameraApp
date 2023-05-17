

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget userStatusView({statusText}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge)),
    child: Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14, top: 4, bottom: 4),
      child: Text(
        statusText,
        style: AppStyle.normal_text.copyWith(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.fontSizeDefault - 2,
            letterSpacing: 0.3


        ),
      ),
    ),
  );
}