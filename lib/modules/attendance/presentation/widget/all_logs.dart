import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/logs_list.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/selected_range_calender.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import 'attendance_filter.dart';

class AllLogsScreen extends GetView<AttendanceLogsController> {
  const AllLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppLayout.getHeight(Dimensions.paddingLarge),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => customButtomSheet(
                      context: context,
                      height: 0.9,
                      child: const SelectRangeCalender()),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.filteredLogSummary.value.data != null
                              ? Text(
                                  controller.filteredLogSummary.value.data!
                                          .queryString!.start!.isNotEmpty
                                      ? "Custom"
                                      : "This Month",
                                  style: AppStyle.mid_large_text.copyWith(
                                      color: AppColor.secondaryColor,
                                      fontWeight: FontWeight.w700),
                                )
                              : Container(),
                          controller.filteredLogSummary.value.data != null
                              ? Text(
                                  controller.filteredLogSummary.value.data!
                                          .queryString!.start!.isNotEmpty
                                      ? "${controller.filteredLogSummary.value.data?.queryString?.start} - ${controller.filteredLogSummary.value.data?.queryString?.end}"
                                      : DateFormat('MMMM yyyy')
                                          .format(DateTime.now())
                                          .toString(),
                                  style: AppStyle.normal_text_grey,
                                )
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        width: AppLayout.getWidth(12),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.hintColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () => customButtomSheet(
                                context: context,
                                height: 0.9,
                                child: const AttendanceFilter()),
                            child: const Icon(
                              Icons.filter_alt_outlined,
                              color: AppColor.hintColor,
                            )),
                        SizedBox(
                          width: AppLayout.getWidth(24),
                        ),
                      ],
                    ),
                    (controller.filteredLogSummary.value.data != null &&
                            controller.filteredLogSummary.value.data!.queryString!
                                .start!.isNotEmpty)
                        ? Positioned(
                            left: AppLayout.getWidth(24),
                            top: -1,
                            child: const Icon(
                              Icons.circle,
                              size: 8,
                              color: AppColor.primaryColor,
                            ))
                        : Container()
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: AppLayout.getHeight(12),
        ),
        Expanded(child: LogsList()),
      ],
    );
  }
}
