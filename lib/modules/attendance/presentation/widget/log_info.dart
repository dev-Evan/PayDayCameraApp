import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';

import '../../../../common/widget/custom_spacer.dart';
import '../../../../enum/status.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/time_counter_helper.dart';
import 'approve_status.dart';

Widget logInfo(int dataIndex) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "${Get.find<AttendanceLogsController>().logList[dataIndex].details?.last.inTime} - ${Get.find<AttendanceLogsController>().logList[dataIndex].details?.first.outTime}",
        style: AppStyle.mid_large_text.copyWith(
          color: AppColor.secondaryColor,
          fontSize: Dimensions.fontSizeDefault + 2,
        ),
      ),
      SizedBox(
        height: AppLayout.getHeight(6),
      ),
      Row(
        children: [
          _timeCounter(dataIndex),
          Get.find<AttendanceLogsController>().logList[dataIndex].totalComments > 0
              ? _noteCounter(dataIndex)
              : Container(),
          customSpacerWidth(width: 12),
          Get.find<AttendanceLogsController>().logList[dataIndex].details.first.statusClass !=
              ApprovalStatus.success.name
              ? approveStatus(
              status:
              Get.find<AttendanceLogsController>().logList[dataIndex].details.first.statusClass)
              : Container(),
        ],
      ),
    ],
  );
}


_noteCounter(int dataIndex) => Row(
  children: [
    Icon(
      Icons.sticky_note_2_outlined,
      color: AppColor.hintColor.withOpacity(0.6),
      size: Dimensions.fontSizeDefault + 2,
    ),
    SizedBox(
      width: AppLayout.getWidth(3),
    ),
    Text(
      Get.find<AttendanceLogsController>().logList[dataIndex].totalComments.toString(),
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.hintColor,
          fontSize: Dimensions.fontSizeDefault + 2,
          fontWeight: FontWeight.w500),
    ),
  ],
);

_timeCounter(int dataIndex) => Row(
  children: [
    Icon(
      Icons.access_time_outlined,
      color: AppColor.hintColor.withOpacity(0.6),
      size: Dimensions.fontSizeDefault + 2,
    ),
    SizedBox(
      width: AppLayout.getWidth(3),
    ),
    Get.find<AttendanceLogsController>().filteredLogSummary.data != null
        ? Text(
      TimeCounterHelper.getTimeStringFromDouble(
        Get.find<AttendanceLogsController>().logList[dataIndex].totalHours.toDouble(),
      ),
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.hintColor.withOpacity(0.7),
          fontSize: Dimensions.fontSizeDefault + 2,
          fontWeight: FontWeight.w500),
    )
        : Container(),
    SizedBox(
      width: AppLayout.getWidth(12),
    ),
  ],
);