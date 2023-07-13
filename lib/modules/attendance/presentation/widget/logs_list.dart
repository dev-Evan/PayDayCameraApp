import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_divider.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/approve_status.dart';
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
        separatorBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(8)),
            child: const Divider(),
          );
        },
        shrinkWrap: true,
        controller: controller.scrollController,
        itemCount: controller.logList.length,
        itemBuilder: (context, dataIndex) =>
            controller.logList[dataIndex].details.length > 1
                ? Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: LogsExpandableList(
                      dataIndex: dataIndex,
                    ))
                : _normalLogInfoCard(dataIndex)));
  }

  _date(int index) => Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  controller.logList[index].dateInNumber ?? "",
                  style: AppStyle.mid_large_text.copyWith(
                      color: AppColor.normalTextColor,
                      fontSize: Dimensions.fontSizeExtraLarge,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  controller.logList[index].month ?? "",
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

  _normalLogInfoCard(int dataIndex) {
    return InkWell(
      onTap: () async {
        _openLogDetailsBottomSheet();
        await Get.find<AttendanceController>()
            .logDetails(controller.logList[dataIndex].details[0].id);
      },
      child: Row(children: [
        SizedBox(width: 60, child: _date(dataIndex)),
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

_openLogDetailsBottomSheet() => showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) => const LogDetailsBottomSheet(),
    );
