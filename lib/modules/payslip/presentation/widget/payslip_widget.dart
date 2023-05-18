import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget dropDawHintText() {
  return Text(
    AppString.text_this_month,
    style: AppStyle.normal_text.copyWith(color: AppColor.normalTextColor),
  );
}

Widget viewDate({required dateText}) {
  return Padding(
    padding: EdgeInsets.only(left: AppLayout.getWidth(18)),
    child: Text(
      dateText,
      style: AppStyle.normal_text_grey,
    ),
  );
}

Widget vertical({required child}) {
  return Padding(
    padding: EdgeInsets.only(
        left: AppLayout.getWidth(8),
        right: AppLayout.getWidth(8),
        top: AppLayout.getHeight(8)),
    child: child,
  );
}

Widget dropDawnBtnCard({required child}) {
  return Padding(
    padding: EdgeInsets.only(top: AppLayout.getHeight(8)),
    child: Card(
      color: AppColor.cardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          side: const BorderSide(width: 0.0, color: Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: child,
      ),
    ),
  );
}

Widget calTitleRow({required titleText}) {
  return Row(
    children: [
      Text(
        titleText,
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.secondaryColor, fontWeight: FontWeight.w700),
      ),
    ],
  );
}