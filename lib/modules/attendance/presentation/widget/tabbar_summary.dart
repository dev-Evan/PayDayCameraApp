import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../../../common/widget/custom_divider.dart';

class SummaryScreen extends GetView<AttendanceLogsController> {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Container(
            padding: EdgeInsets.symmetric(
                vertical: AppLayout.getHeight(Dimensions.paddingDefault),
                horizontal: AppLayout.getWidth(Dimensions.paddingDefault)),
            child: Column(
              children: [
                SizedBox(height: AppLayout.getHeight(12)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.logSummaryOverview.data != null
                            ? Text(
                                controller.logSummaryOverview.data!.queryString!
                                        .start!.isNotEmpty
                                    ? "Custom"
                                    : "This Month",
                                style: AppStyle.mid_large_text.copyWith(
                                    color: AppColor.secondaryColor,
                                    fontWeight: FontWeight.w700),
                              )
                            : Container(),
                        controller.logSummaryOverview.data != null
                            ? Text(
                                controller.logSummaryOverview.data!.queryString!
                                        .start!.isNotEmpty
                                    ? "${controller.logSummaryOverview.data?.queryString?.start} - ${controller.logSummaryOverview.data?.queryString?.end}"
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
                SizedBox(
                  height: AppLayout.getHeight(12),
                ),
                Expanded(child: logsList(controller))
              ],
            )),
        onLoading: const LoadingIndicator());
  }
}

logsList(AttendanceLogsController controller) {
  return ListView.builder(
    itemCount: controller.logSummaryOverview.data?.attendanceDetails?.length,
    itemBuilder: (context, index) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  controller.logSummaryOverview.data != null
                      ? Text(
                          controller.logSummaryOverview.data!
                              .attendanceDetails![index].dateInNumber
                              .toString(),
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeExtraLarge,
                              fontWeight: FontWeight.w900),
                        )
                      : Container(),
                  controller.logSummaryOverview.data != null
                      ? Text(
                          controller.logSummaryOverview.data!
                              .attendanceDetails![index].month
                              .toString(),
                          style: AppStyle.small_text.copyWith(
                              color: AppColor.hintColor,
                              fontSize: Dimensions.fontSizeSmall),
                        )
                      : Container(),
                ],
              ),
              CustomDiveider(25, 1),
              Column(
                children: [
                  _logOverviewInfos(
                      title: "S",
                      count: controller.logSummaryOverview.data != null
                          ? controller.logSummaryOverview.data!
                              .attendanceDetails![index].scheduledHours
                              .toString()
                          : ""),
                  _logOverviewInfos(
                      title: "W",
                      count: controller.logSummaryOverview.data != null
                          ? controller.logSummaryOverview.data!
                              .attendanceDetails![index].totalWorkingHours
                              .toString()
                          : ""),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _logOverviewInfos(
                      title: "PL",
                      count: controller.logSummaryOverview.data != null
                          ? controller.logSummaryOverview.data!
                              .attendanceDetails![index].paidLeaves
                              .toString()
                          : ""),
                  _logOverviewInfos(
                      title: "B",
                      count: controller.logSummaryOverview.data != null
                          ? controller.logSummaryOverview.data!
                              .attendanceDetails![index].balance
                              .toString()
                          : ""),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppLayout.getHeight(32),
          )
        ],
      );
    },
  );
}

_logOverviewInfos({required String title, required String count}) => Row(
      children: [
        Text(
          '$title : ',
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.hintColor,
              fontSize: Dimensions.fontSizeDefault + 4,
              fontWeight: FontWeight.w500),
        ),
        Text(
          count,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.secondaryColor,
              fontSize: Dimensions.fontSizeDefault + 2),
        ),
      ],
    );
