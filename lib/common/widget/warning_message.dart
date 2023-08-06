import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../utils/app_style.dart';


showWarningMessage({String? message,double marginForButton=60,double height=60,int maxLines=2}) async => MotionToast.warning(
  borderRadius: 4,
  position: MotionToastPosition.bottom,
  padding:  EdgeInsets.only(bottom: marginForButton, right: 20, left: 20),
  animationType: AnimationType.fromRight,
  height: height,
  animationDuration: const Duration(
    milliseconds: 1000,
  ),
  toastDuration: const Duration(milliseconds: 2500),
  width: double.infinity,
  displaySideBar: false,
  iconSize: 40,
  description: Text(message??"",style: AppStyle.normal_text_black,overflow: TextOverflow.ellipsis,maxLines: maxLines),
).show(Get.context!);