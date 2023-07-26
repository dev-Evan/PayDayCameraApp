import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';

void showCustomSnackBar({required String message,color=AppColor.secondaryColor}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);


}



 toastMessage({context,message,double ?height=60}){
  ElegantNotification.success(
      height:AppLayout.getHeight(height!),
      description: Text("$message")
  ).show(context);
}