import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/all_logs.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/tabbar_summary.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget logSummaryTabBar() {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: AppLayout.getHeight(Dimensions.paddingLarge),
        horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
    child: DefaultTabController(
      length: 2,
      initialIndex: Get.find<AttendanceLogsController>().tabIndex.value,
      child: Column(
        children: [
          Container(
            height: AppLayout.getHeight(53),
            decoration: BoxDecoration(
              color: AppColor.disableColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TabBar(
                onTap: (value) =>
                    Get.find<AttendanceLogsController>().tabIndex.value = value,
                indicator: BoxDecoration(
                  color: AppColor.cardColor,
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                ),
                labelColor: AppColor.normalTextColor,
                unselectedLabelColor: AppColor.hintColor,
                labelStyle: AppStyle.mid_large_text
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
                tabs: const [
                  Tab(
                    text: AppString.text_all_logs,
                  ),
                  Tab(
                    text: AppString.text_summary,
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: TabBarView(children: [
              AllLogsScreen(),
              SummaryScreen(),
            ]),
          ),
        ],
      ),
    ),
  );
}
