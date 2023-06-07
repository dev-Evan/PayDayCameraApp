import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

void showCustomSnackBar({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: AppColor.secondaryColor,
      textColor: Colors.white,
      fontSize: 16.0);
}


