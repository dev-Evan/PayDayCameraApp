import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

import '../../utils/app_string.dart';

SnackbarController errorSnackBar({required String errorMessage}) =>
    Get.snackbar(
      AppString.text_error,
      errorMessage,
      colorText: Colors.white,
      icon: Icon(Icons.error, color: Colors.red),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 4,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: AppColor.primaryBlue,
      isDismissible: false,
      duration: Duration(seconds: 3),
      forwardAnimationCurve: Curves.easeInOut,
    );
