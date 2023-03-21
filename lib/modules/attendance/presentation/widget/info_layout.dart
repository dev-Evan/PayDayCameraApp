import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/custom_status_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';

Widget infoLayout() {
  return Obx(
    () => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_userName(), _getCurrentDate()],
        ),
        Get.find<AttendanceController>().isPunchIn.value == true
            ? CustomStatusButton(
                bgColor: getBgColor(Get.find<AttendanceController>()
                    .logs
                    .value
                    .data!
                    .behavior
                    .toString()),
                text: Get.find<AttendanceController>()
                    .logs
                    .value
                    .data!
                    .behavior
                    .toString(),
                textColor: getTextColor(
                  Get.find<AttendanceController>()
                      .logs
                      .value
                      .data!
                      .behavior
                      .toString(),
                ),
              )
            : Container()
      ],
    ),
  );
}

Color getBgColor(String behaviour) {
  if (Get.find<AttendanceController>()
      .logs
      .value
      .data!
      .behavior
      .toString()
      .startsWith("late")) {
    return AppColor.errorColor;
  } else if (Get.find<AttendanceController>()
      .logs
      .value
      .data!
      .behavior
      .toString()
      .startsWith("regular")) {
    return Colors.white;
  } else {
    return AppColor.primary_orange;
  }
}

Color getTextColor(String behaviour) {
  if (Get.find<AttendanceController>()
      .logs
      .value
      .data!
      .behavior
      .toString()
      .startsWith("late")) {
    return Colors.white;
  } else if (Get.find<AttendanceController>()
      .logs
      .value
      .data!
      .behavior
      .toString()
      .startsWith("regular")) {
    return AppColor.primary_green;
  } else {
    return Colors.white;
  }
}

_userName() {
  return Text(
    "Hi, ${GetStorage().read(AppString.USERNAME)}",
    style: AppStyle.title_text,
  );
}

_getCurrentDate() {
  return Text(
    DateFormat.MMMMEEEEd().format(DateTime.now()),
    style: AppStyle.normal_text,
  );
}
