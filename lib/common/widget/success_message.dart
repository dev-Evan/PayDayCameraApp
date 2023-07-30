import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../utils/app_style.dart';

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
