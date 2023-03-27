import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';

Widget customMoreAppbar({
  titleText,
  bgColor = AppColor.backgroundColor,
  titleTextColor=AppColor.normalTextColor,
  iconColor = AppColor.normalTextColor,
}) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: Icon(
        Icons.arrow_back,
        color: iconColor,
      ),
    ),
    centerTitle: true,
    title: Text(
      titleText,
      style: AppStyle.title_text.copyWith(
          color: titleTextColor,
          fontSize: Dimensions.fontSizeDefault + 1),
    ),
    backgroundColor: bgColor,
  );
}

Widget profileViewAppbar(
    {titleText, bgColor = AppColor.backgroundColor, rightBtnAction}) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(
        Icons.arrow_back,
        color: AppColor.normalTextColor,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
          onPressed: () => rightBtnAction(),
          icon:   Icon(
            Icons.edit_square,
            color: AppColor.normalTextColor.withOpacity(0.6),
          ))
    ],
    title: Text(
      titleText,
      style: AppStyle.title_text.copyWith(
          color: AppColor.normalTextColor,
          fontSize: Dimensions.fontSizeDefault + 1),
    ),
    backgroundColor: bgColor,
  );
}
