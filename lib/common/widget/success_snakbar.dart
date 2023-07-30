import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_style.dart';

void showCustomSnackBar(
    {required String message, color = AppColor.secondaryColor}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

showSuccessMessage({String? message}) async => MotionToast.success(
      borderRadius: 4,
      position: MotionToastPosition.bottom,
      padding: const EdgeInsets.only(bottom: 60, right: 20, left: 20),
      animationType: AnimationType.fromRight,
      height: 60,
      animationDuration: const Duration(
        milliseconds: 1000,
      ),
      toastDuration: const Duration(milliseconds: 2500),
      width: double.infinity,
      displaySideBar: false,
      iconSize: 40,
      description: Text(message??"",style: AppStyle.normal_text_black,overflow: TextOverflow.ellipsis,maxLines: 2),
    ).show(Get.context!);

showErrorMessage({String? message}) async => MotionToast.error(
      borderRadius: 4,
      position: MotionToastPosition.bottom,
      padding: const EdgeInsets.only(bottom: 60, right: 20, left: 20),
      animationType: AnimationType.fromRight,
      height: 60,
      animationDuration: const Duration(
            milliseconds: 1000,
      ),
      toastDuration: const Duration(milliseconds: 2500),
      width: double.infinity,
      displaySideBar: false,
      iconSize: 40,
      description: Text(message??"",style: AppStyle.normal_text_black,overflow: TextOverflow.ellipsis,maxLines: 2),
    ).show(Get.context!);



toastMessage({context, message, double? height = 60}) async =>
    MotionToast.success(
      borderRadius: 4,
      position: MotionToastPosition.bottom,
      padding: EdgeInsets.only(bottom: 60, right: 20, left: 20),
      animationType: AnimationType.fromRight,
      height: 80,
      animationDuration: const Duration(
        milliseconds: 1000,
      ),
      toastDuration: const Duration(milliseconds: 2500),
      width: double.infinity,
      displaySideBar: false,
      iconSize: 30,
      description: Text("You can customize the toast!"),
    ).show(Get.context!);
