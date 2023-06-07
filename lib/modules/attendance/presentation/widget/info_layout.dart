import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/custom_status_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/color_picker_helper.dart';

Widget infoLayout() {
  var controller = Get.find<AttendanceController>();
  return Obx(
    () => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _userName(),
              _getCurrentDate(),
            ],
          ),
        ),
        controller.isPunchIn.isTrue && controller.logs.value.data != null
            ? CustomStatusButton(
                bgColor: Util.getBtnBgColor(
                    behaviour: controller.logs.value.data!.behavior.toString(),
                    isBgColorWhite: true),
                text: controller.logs.value.data!.behavior.toString(),
                textColor: Util.getBtnTextColor(
                    behaviour: controller.logs.value.data!.behavior.toString(),
                    isBgColorWhite: true),
              )
            : Container()
      ],
    ),
  );
}

_userName() {
  return Padding(
    padding:EdgeInsets.only(right: AppLayout.getWidth(4.0)),
    child: Text(
      "Hi, ${GetStorage().read(AppString.USER_NAME)}",
      style: AppStyle.title_text,
    ),
  );
}

_getCurrentDate() {
  return Text(
    DateFormat.MMMMEEEEd().format(DateTime.now()),
    style: AppStyle.normal_text,
  );
}
