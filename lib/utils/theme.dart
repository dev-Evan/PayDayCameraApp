import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


ThemeData get appTheme => _themeData;

ThemeData _themeData = ThemeData(



  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Colors.white,
    ),
  ),

  // scaffoldBG, applicable for aLL PAGES
  scaffoldBackgroundColor: Colors.white,
  //primary color for the application
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.white,

  // appBarTheme: const AppBarTheme(
  //     systemOverlayStyle: SystemUiOverlayStyle(
  //       // Status bar color
  //       statusBarColor: Colors.white,
  //     ),
  //     elevation: 0,
  //     backgroundColor: Colors.white,
  //     iconTheme: IconThemeData(color: Colors.black)),

  //  scaffoldBackgroundColor: AppColor.bgColor,
  // //primary color for the application
  // colorScheme: ColorScheme.fromSwatch().copyWith(
  //   primary: AppColor.bgColor,

  ),
);
