import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../utils/app_style.dart';

showErrorMessage({String? errorMessage,double marginForButton=10}) async => MotionToast.error(
  borderRadius: 4,
  position: MotionToastPosition.bottom,
  padding:  EdgeInsets.only(bottom: marginForButton, right: 20, left: 20),
  animationType: AnimationType.fromRight,
  height: 60,
  toastDuration: const Duration(milliseconds: 1500),
  width: double.infinity,
  displaySideBar: false,
  iconSize: 40,
  description: Text(errorMessage??"",style: AppStyle.normal_text_black,overflow: TextOverflow.ellipsis,maxLines: 2),
).show(Get.context!);
