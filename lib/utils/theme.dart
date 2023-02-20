import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData get appTheme => _themeData;

ThemeData _themeData = ThemeData(
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Colors.blue,
    ),
  ),

  // scaffoldBG, applicable for aLL PAGES
  scaffoldBackgroundColor: Colors.blue,
  //primary color for the application
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.blueAccent,
  ),
);
