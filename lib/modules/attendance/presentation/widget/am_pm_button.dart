import 'package:flutter/cupertino.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';

Widget amPmToggleButton() {
  int currentIndex = 1;
  return CupertinoSegmentedControl(
borderColor: AppColor.primaryColor,
    children: <int, Widget>{
      1: _amButton(title: "AM"),
      2: _pmButton(title: "PM"),
    },
    onValueChanged: (int value) {
      currentIndex = value;
    },
  );
}

_pmButton({required String title}) {
  var currentIndex = 1;
  return Container(
    margin: EdgeInsets.symmetric(horizontal: Dimensions.paddingSmall),
    decoration: currentIndex == 1
        ? BoxDecoration(
            border: Border.all(color: AppColor.primaryColor, width: 1),
            color: AppColor.primary_blue.withOpacity(0.12),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault))
        : BoxDecoration(
            color: AppColor.backgroundColor,
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
    padding: EdgeInsets.symmetric(
        vertical: Dimensions.paddingDefault, horizontal: Dimensions.paddingMid),
    child: Text(
      title,
      style: currentIndex == 1
          ? AppStyle.normal_text_black.copyWith(color: AppColor.primaryColor)
          : AppStyle.normal_text_black,
    ),
  );
}

_amButton({required String title}) {
  var currentIndex = 1;
  return Container(
    margin: EdgeInsets.symmetric(horizontal: Dimensions.paddingSmall),
    decoration: currentIndex == 1
        ? BoxDecoration(
            color: AppColor.backgroundColor,
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault))
        : BoxDecoration(
            border: Border.all(color: AppColor.primaryColor, width: 1),
            color: AppColor.primary_blue.withOpacity(0.12),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
    padding: EdgeInsets.symmetric(
        vertical: Dimensions.paddingDefault, horizontal: Dimensions.paddingMid),
    child: Text(
      title,
      style: currentIndex == 1
          ? AppStyle.normal_text_black
          : AppStyle.normal_text_black.copyWith(color: AppColor.primary_blue),
    ),
  );
}
