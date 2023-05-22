import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/vertical_divider.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import 'status_button.dart';

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
              "${controller.filteredLogSummary.data!.data![dataIndex].details?[index].inTime!} - ${controller.filteredLogSummary.data!.data![dataIndex].details?[index].outTime!}",
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
                    "9",
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.hintColor.withOpacity(0.7),
                        fontSize: Dimensions.fontSizeDefault + 2,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: AppLayout.getWidth(12),
                  ),
                  Icon(
                    Icons.sticky_note_2_outlined,
                    color: AppColor.hintColor.withOpacity(0.6),
                    size: Dimensions.fontSizeDefault + 2,
                  ),
                  SizedBox(
                    width: AppLayout.getWidth(3),
                  ),
                  Text(
                    "0",
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault + 2,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: AppLayout.getWidth(12),
                  ),
                  controller.filteredLogSummary.data != null &&
                          controller
                              .filteredLogSummary.data!.data!.isNotEmpty
                      ? getStatusButton(index, dataIndex, controller)
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
