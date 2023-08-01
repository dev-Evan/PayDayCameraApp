import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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

 // toastMessage({context,message,double ?height=60}) async => ElegantNotification.success(
 //      height:AppLayout.getHeight(height!),
 //      background: AppColor.normalTextColor,
 //      progressIndicatorBackground: AppColor.pendingTextColor,
 //      notificationPosition: NotificationPosition.bottomRight,
 //      description: Text("$message",style: const TextStyle(color: AppColor.cardColor),)
 //  ).show(context);

 toastMessage({context,message}) async =>
     showToast('$message',
       context: context,
       animation: StyledToastAnimation.slideFromRightFade,
     );