import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget dotIndicator() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      2,
      (index) => Container(
        margin: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(Dimensions.paddingExtraSmall)),
        height: AppLayout.getHeight(6),
        width: Get.find<AttendanceController>().currentIndex.value == index
            ? AppLayout.getWidth(16)
            : AppLayout.getWidth(6),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
      ),
    ),
  );
}
