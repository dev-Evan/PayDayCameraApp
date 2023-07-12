
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../utils/app_string.dart';

SnackbarController errorSnackBar({required String errorMessage}) =>
    Get.snackbar(
      AppString.text_error,
      errorMessage,
      colorText: Colors.white,
      icon: const Icon(Icons.error, color:AppColor.primaryColor),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: Dimensions.radiusDefault,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: AppColor.errorColor.withOpacity(0.7),
      isDismissible: false,
      duration:const  Duration(seconds: 5),
      messageText: Text(errorMessage,style:textStyle),
      forwardAnimationCurve: Curves.easeInOut,
    );

TextStyle get textStyle {
    return AppStyle.large_text.copyWith(fontSize: Dimensions.fontSizeDefault,fontWeight: FontWeight.w500);
}