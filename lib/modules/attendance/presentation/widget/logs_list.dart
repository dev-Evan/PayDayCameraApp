import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_divider.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/approve_status.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/multi_log_summary_list.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/time_counter_helper.dart';

import '../../../../enum/status.dart';
import '../view/log_details_bottomsheet.dart';

class LogsList extends GetView<AttendanceLogsController> {
  final RxBool isExpanded = false.obs;

  LogsList({super.key});

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
        itemBuilder: (context, dataIndex) => controller
                    .logList[dataIndex].details.length >
                1
            ? Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.all(0),
                  onExpansionChanged: (value) => isExpanded.value = value,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 3, child: _date(dataIndex)),
                      SizedBox(width: AppLayout.getWidth(20)),
                      _logInfo(dataIndex),
                    ],
                  ),
                  trailing: CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColor.hintColor.withOpacity(0.1),
                      child: Obx(() => _changeIcon())),
                  children: [
                    SizedBox(height: AppLayout.getHeight(16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(flex: 2),
                        Expanded(
                            flex: 11,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                  height: AppLayout.getHeight(
                                      Dimensions.paddingMid)),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller
                                      .logList[dataIndex].details.length ??
                                  0,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () async {
                                    await Get.find<AttendanceController>()
                                        .logDetails(controller
                                            .logList[dataIndex]
                                            .details[index]
                                            .id);
                                    _openLogDetailsBottomSheet();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      _dottedBorder(),
                                      SizedBox(
                                          width: AppLayout.getWidth(
                                              Dimensions.paddingDefault)),
                                      multiLogSummaryList(
                                          index: index,
                                          dataIndex: dataIndex,
                                          controller: controller),
                                    ],
                                  ),
                                );
                              },
                            ))
                      ],
                    )
                  ],
                ))
            : _normalLogInfoCard(dataIndex)));
  }

  _date(int index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
          customDivider(25, 1),
        ],
      );

  _openLogDetailsBottomSheet() => showModalBottomSheet(
        enableDrag: false,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: Get.context!,
        builder: (context) => const LogDetailsBottomSheet(),
      );

  _logInfo(int dataIndex) {
    return Expanded(
        flex: 11,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${controller.logList[dataIndex].details?.last.inTime} - ${controller.logList[dataIndex].details?.first.outTime}",
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
                // controller.filteredLogSummary.data!.data![dataIndex].totalComments
                controller.logList[dataIndex].totalComments> 0
                    ? _noteCounter(dataIndex)
                    : Container(),
                customSpacerWidth(width: 12),
                controller.logList[dataIndex].details.first.statusClass !=
                        ApprovalStatus.success.name
                    ? approveStatus(
                        status: controller
                            .logList[dataIndex].details.first.statusClass)
                    : Container(),
              ],
            ),
          ],
        ));
  }

  _normalLogInfoCard(int dataIndex) {
    return InkWell(
      onTap: () async {
        await Get.find<AttendanceController>()
            .logDetails(controller.logList[dataIndex].details[0].id);
         _openLogDetailsBottomSheet();
      },
      child: Row(children: [
        Expanded(flex: 3, child: _date(dataIndex)),
        SizedBox(width: AppLayout.getWidth(20)),
        _logInfo(dataIndex),
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

  _changeIcon() {
    return !isExpanded.value
        ? const Icon(
            CupertinoIcons.arrow_turn_right_down,
            color: AppColor.primaryColor,
            size: 18,
          )
        : Icon(
            CupertinoIcons.arrow_turn_up_left,
            size: 18,
            color: AppColor.primaryColor.withOpacity(0.8),
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
            controller.logList[dataIndex].totalComments.toString(),
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
          controller.filteredLogSummary.data != null
              ? Text(
                  TimeCounterHelper.getTimeStringFromDouble(
                    controller.logList[dataIndex].totalHours.toDouble(),
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
}

_dottedBorder() {
  return Stack(
    alignment: Alignment.center,
    children: [
      DottedBorder(
        customPath: (p0) => Path()..lineTo(0, 98),
        color: AppColor.disableColor,
        dashPattern: const [6, 4],
        strokeWidth: 1,
        child: Divider(
          height: AppLayout.getHeight(70),
          color: AppColor.noColor,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            right: AppLayout.getWidth(3), bottom: AppLayout.getHeight(32)),
        child: Icon(Icons.circle,
            color: AppColor.disableColor, size: AppLayout.getWidth(16)),
      ),
    ],
  );
}
