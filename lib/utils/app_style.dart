import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class AppStyle {
  AppStyle._();

  static TextStyle title_text = TextStyle(
      fontSize: AppLayout.getWidth(Dimensions.paddingExtraLarge),
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins");
  static TextStyle timer_text = TextStyle(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeDoubleLarge),
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins");

  static TextStyle small_text = GoogleFonts.poppins(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeSmall),
      color: Colors.white,
      fontWeight: FontWeight.w500,
   );
  static TextStyle small_text_black = TextStyle(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeSmall),
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins");

  static TextStyle normal_text = TextStyle(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeDefault),
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins");

  static TextStyle large_text = TextStyle(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeExtraDefault),
      color: AppColor.cardColor,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins");

  static TextStyle large_text_black = TextStyle(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeExtraDefault),
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins");
  static TextStyle mid_large_text = TextStyle(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeMid),
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins");
  static TextStyle extra_large_text = TextStyle(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeLarge),
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins");

}
