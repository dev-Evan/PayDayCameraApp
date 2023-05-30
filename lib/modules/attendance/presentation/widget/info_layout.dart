import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/custom_status_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/color_picker_helper.dart';

Widget infoLayout() {
  var controller = Get.find<AttendanceController>();
  return Obx(
    () => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userName(),
            _getCurrentDate(),
          ],
        ),
        //check if user is punched in
        // has data to show
        controller.isPunchIn.isTrue && controller.logs.value.data != null
            ? CustomStatusButton(
                bgColor: Util.getBtnBgColor(
                    controller.logs.value.data!.behavior.toString(), true),
                text: controller.logs.value.data!.behavior.toString(),
                textColor: Util.getBtnTextColor(
                  controller.logs.value.data!.behavior.toString(),
                ),
              )
            : Container()
      ],
    ),
  );
}

_userName() {
  return Text(
    "Hi, ${ Get.find<ProfileDataController>().userProfile.data?.fullName
        .toString() ??
        GetStorage().read(AppString.USER_FIRST_NAME)}",
    style: AppStyle.title_text,
  );
}
_getCurrentDate() {
  return Text(
    DateFormat.MMMMEEEEd().format(DateTime.now()),
    style: AppStyle.normal_text,
  );
}
