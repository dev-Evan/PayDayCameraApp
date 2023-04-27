import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';

Widget punchButton(Function onPressed) {
  return Obx(() => InkWell(
        onTap: () => onPressed(),
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1, color: Colors.white.withOpacity(.33)),
              color: Colors.white.withOpacity(.18),
              borderRadius: BorderRadius.circular(
                Dimensions.radiusDefault,
              )),
          width: double.maxFinite,
          height: AppLayout.getHeight(48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.logout, color: Colors.white),
              Text(
                  Get.find<AttendanceController>().isPunchIn.value
                      ? AppString.text_punch_out
                      : AppString.text_punch_in,
                  style: AppStyle.normal_text),
            ],
          ),
        ),
      ));
}
