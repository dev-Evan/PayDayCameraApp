import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import '../../../../common/widget/custom_navigator.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimensions.dart';
import '../../../attendance/presentation/widget/attendance_log_text.dart';
import '../view/leve_records_view.dart';
import 'leave_allowance.dart';

Widget leaveAllowanceLayout() => Container(
  height: AppLayout.getHeight(200),
  decoration: BoxDecoration(
      color: AppColor.primaryColor,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimensions.radiusMid),
          bottomRight: Radius.circular(Dimensions.radiusMid))),
  child: Column(
    children: [
      const Spacer(),
      leaveAllowance(),
      attendanceLogText(
          context: Get.context!,
          text: AppString.text_leave_records,
          onAction: () async {
            CustomNavigator(
                context: Get.context!,
                pageName: const LeaveRecordsView());
            await Get.find<LeaveController>().getLeaveSummary();
            await Get.find<LeaveController>().getLeaveRecord("&within=thisYear");
          }),
    ],
  ),
);