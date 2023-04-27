import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';


ThemeData get appTheme => _themeData;

ThemeData _themeData = ThemeData(

  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Colors.transparent,
    ),
  ),

  // scaffoldBG, applicable for aLL PAGES
  scaffoldBackgroundColor: AppColor.cardColor,
  //primary color for the application
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColor.primaryColor                                                ,

  ),
);
