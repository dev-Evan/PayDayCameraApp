import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/utils/time_counter_helper.dart';

import '../../../../common/widget/custom_spacer.dart';
import '../../../../enum/status.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import 'approve_status.dart';

Widget multiLogSummaryList(
    {required int index,
    required int dataIndex,
    required AttendanceLogsController controller}) {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${controller.logList[dataIndex].details?[index].inTime} - ${controller.logList[dataIndex].details?[index].outTime!}",
              style: AppStyle.mid_large_text.copyWith(
                color: AppColor.normalTextColor,
                fontSize: Dimensions.fontSizeDefault + 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppLayout.getHeight(12)),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    color: AppColor.hintColor.withOpacity(0.6),
                    size: Dimensions.fontSizeDefault + 2,
                  ),
                  SizedBox(width: AppLayout.getWidth(3)),
                  Text(
                    TimeCounterHelper.getTimeStringFromDouble(controller
                        .logList[dataIndex].details?[index].totalHours
                        .toDouble()),
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.hintColor.withOpacity(0.7),
                        fontSize: Dimensions.fontSizeDefault + 2,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: AppLayout.getWidth(12),
                  ),
                  controller.logList[dataIndex].details[index].comments.length >
                          0
                      ? _noteCounterMulti(dataIndex: dataIndex, index: index)
                      : Container(),
                  customSpacerWidth(width: 12),
                  controller.logList[dataIndex].details[index].statusClass !=
                          ApprovalStatus.success.name
                      ? approveStatus(
                          status: controller
                              .logList[dataIndex].details[index].statusClass)
                      : Container(),
                ],
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 14,
          backgroundColor: AppColor.hintColor.withOpacity(0.1),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColor.primaryColor.withOpacity(0.8),
          ),
        )
      ],
    ),
  );
}

_noteCounterMulti({required int dataIndex, required int index}) {
  return Row(
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
        Get.find<AttendanceLogsController>()
            .logList[dataIndex]
            .details![index]
            .comments
            .length
            .toString(),
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.hintColor,
            fontSize: Dimensions.fontSizeDefault + 2,
            fontWeight: FontWeight.w500),
      ),
    ],
  );
}
