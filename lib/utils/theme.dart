import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

ThemeData get appTheme => _themeData;

ThemeData _themeData = ThemeData(
  // scaffoldBG, applicable for aLL PAGES
  scaffoldBackgroundColor: AppColor.bgColor,
  //primary color for the application
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColor.bgColor,
  ),
);
