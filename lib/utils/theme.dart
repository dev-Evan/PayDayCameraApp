import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

ThemeData get appTheme => _themeData;

ThemeData _themeData = ThemeData(
  // scaffoldBG, applicable for aLL PAGES

  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.white,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black)),  scaffoldBackgroundColor: AppColor.bgColor,
  //primary color for the application
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColor.bgColor,
  ),
);
