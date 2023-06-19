import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_details/log_details.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/timer_overview_layout.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/vertical_divider.dart';
import 'package:pay_day_mobile/utils/time_counter_helper.dart';

import '../../../../common/widget/custom_status_button.dart';
import '../../../../common/widget/users_current_info_layout.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/utils.dart';

Widget contentLayout() {
  return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(Dimensions.paddingLarge),
          horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topLayout(),
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
          _logTimeLayout(),
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
          _punchInDetails(),
          _punchOutDetails(),
        ],
      ));
}

_topLayout() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _logDate(),
      _entryBehaviour(),
    ],
  );
}

_logDate() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        Get.find<AttendanceController>().logDetailsById.data?.logDate ?? '',
        style: AppStyle.large_text_black.copyWith(fontWeight: FontWeight.w600),
      ),
      Text(
        Get.find<AttendanceController>().logDetailsById.data?.punchInStatus ??
            "",
        style: AppStyle.normal_text_black
            .copyWith(fontWeight: FontWeight.w400, color: Colors.grey),
      ),
    ],
  );
}

_entryBehaviour() {
  return CustomStatusButton(
      bgColor: Util.getBtnBgColor(
          behaviour:
              Get.find<AttendanceController>().logDetailsById.data?.behavior ??
                  "",
          isBgColorWhite: false),
      text:
          Get.find<AttendanceController>().logDetailsById.data?.behavior ?? "",
      textColor: Util.getBtnTextColor(
          behaviour:
              Get.find<AttendanceController>().logDetailsById.data?.behavior ??
                  "",
          isBgColorWhite: false));
}

_logTimeLayout() {
  return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _inTimeLog(),
        const Spacer(),
        verticalDivider(dividerColor: AppColor.greyDark),
        const Spacer(),
        _outTimeLog(),
        const Spacer(),
        verticalDivider(dividerColor: AppColor.greyDark),
        const Spacer(),
        _totalTimeLog(),
      ]);
}

_inTimeLog() {
  return scheduledLogInfo(
      title: AppString.text_in,
      time: Get.find<AttendanceController>().logDetailsById.data?.inTime ?? "",
      fontColor: Colors.black);
}

_outTimeLog() {
  return scheduledLogInfo(
      title: AppString.text_out,
      time: Get.find<AttendanceController>().logDetailsById.data?.outTime ?? "",
      fontColor: Colors.black);
}

_totalTimeLog() {
  return scheduledLogInfo(
      title: AppString.text_total,
      time: TimeCounterHelper.getTimeStringFromDouble(
          Get.find<AttendanceController>()
                  .logDetailsById
                  .data
                  ?.totalHours
                  ?.toDouble() ??
              0.0),
      fontColor: Colors.black);
}

_punchInDetails() {
  LogDetails logDetails = Get.find<AttendanceController>().logDetailsById;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      punchDetails(
          title: AppString.text_punch_in,
          note: (logDetails.data?.comments != null &&
                  logDetails.data!.comments!.isNotEmpty)
              ? logDetails.data?.comments?.first.comment
              : ""),
      SizedBox(height: AppLayout.getHeight(Dimensions.paddingExtraLarge)),
      UsersCurrentInfoLayout(
          title: AppString.text_my_location,
          data: logDetails.data?.inIpData?.location ?? ""),
      SizedBox(height: AppLayout.getHeight(Dimensions.paddingMid)),
      UsersCurrentInfoLayout(
          title: AppString.text_ip_address,
          data: logDetails.data?.inIpData?.ip ?? ""),
    ],
  );
}

_punchOutDetails() {
  LogDetails logDetails = Get.find<AttendanceController>().logDetailsById;
  return (logDetails.data?.outTime !=null && logDetails.data!.outTime!.isNotEmpty)
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppLayout.getHeight(48)),
            punchDetails(
                title: AppString.text_punch_out,
                note: (logDetails.data?.comments != null &&
                        logDetails.data!.comments!.isNotEmpty)
                    ? (logDetails.data!.comments!.last.type!
                            .startsWith("out-note")
                        ? logDetails.data?.comments?.last.comment
                        : "")
                    : ""),
            SizedBox(height: AppLayout.getHeight(Dimensions.paddingExtraLarge)),
            UsersCurrentInfoLayout(
                title: AppString.text_my_location,
                data: logDetails.data?.outIpData?.location ?? ""),
            SizedBox(height: AppLayout.getHeight(Dimensions.paddingMid)),
            UsersCurrentInfoLayout(
                title: AppString.text_ip_address,
                data: logDetails.data?.outIpData?.ip ?? ""),
          ],
        )
      : Container();
}

punchDetails({required String title, String? note}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppStyle.large_text_black,
      ),
      note!.isNotEmpty
          ? Text(note, style: AppStyle.normal_text_black)
          : Container(),
    ],
  );
}
