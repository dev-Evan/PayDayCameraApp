import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/custom_status_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/behaviour_color_picker_helper.dart';

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
                bgColor: Util.getBgColor(Get.find<AttendanceController>()
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
                textColor: Util.getTextColor(
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
