import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import '../../../../common/widget/custom_divider.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';

Widget logsDate(int index) => Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Get.find<AttendanceLogsController>().logList[index].dateInNumber ?? "",
                style: AppStyle.mid_large_text.copyWith(
                    color: AppColor.normalTextColor,
                    fontSize: Dimensions.fontSizeExtraLarge,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                Get.find<AttendanceLogsController>().logList[index].month ?? "",
                style: AppStyle.small_text.copyWith(
                    color: AppColor.hintColor,
                    fontSize: Dimensions.fontSizeSmall),
              ),
            ],
          ),
        ),
        customDivider(25, 1)
      ],
    );
