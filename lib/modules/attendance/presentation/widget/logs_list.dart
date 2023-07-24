import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_divider.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/approve_status.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/logs_date.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/logs_expandable_list.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/multi_log_summary_list.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/time_counter_helper.dart';
import '../../../../enum/status.dart';
import '../view/log_details_bottomsheet.dart';
import 'log_info.dart';

class LogsList extends GetView<AttendanceLogsController> {
  const LogsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(8)),
            child: const Divider(),
          );
        },
        itemCount: controller.logList.length + 1,
        itemBuilder: (context, dataIndex) {
          if (dataIndex == controller.logList.length) {
            return customSpacerHeight(height: 70);
          } else {
            return controller.logList[dataIndex].details.length > 1
                ? Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: LogsExpandableList(
                      dataIndex: dataIndex,
                    ))
                : _normalLogInfoCard(dataIndex);
          }
        }));
  }

  _normalLogInfoCard(int dataIndex) {
    return InkWell(
      onTap: () async {
        _openLogDetailsBottomSheet(controller.logList[dataIndex].details[0].statusClass);
        await Get.find<AttendanceController>()
            .logDetails(controller.logList[dataIndex].details[0].id);
      },
      child: Row(children: [
        SizedBox(width: 40, child: logsDate(dataIndex)),
        customSpacerWidth(width: 20),
        Expanded(child: logInfo(dataIndex)),
        CircleAvatar(
          radius: 14,
          backgroundColor: AppColor.hintColor.withOpacity(0.1),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColor.primaryColor.withOpacity(0.8),
          ),
        )
      ]),
    );
  }
}

_openLogDetailsBottomSheet(String? statusClass) => showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) => LogDetailsBottomSheet(
          pendingText: statusClass??'log-details'),
    );
