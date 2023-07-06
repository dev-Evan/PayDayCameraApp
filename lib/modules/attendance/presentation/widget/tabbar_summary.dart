import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/enum/range_calendar_method_imp.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/selected_range_calender.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../../../common/widget/custom_divider.dart';
import '../../../../utils/app_string.dart';

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
                    Expanded(child: _filterBox()),
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        _showPopupMenu(details.globalPosition);
                      },
                      child: Icon(
                        Icons.info_outline,
                        size: AppLayout.getWidth(20),
                        color: Colors.grey,
                      ),
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

  _filterBox() => InkWell(
        onTap: () => _openBottomSheet(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.logSummaryOverview.data != null
                    ? Text(
                        controller.logSummaryOverview.data!.queryString!.start!
                                .isNotEmpty
                            ? "Custom"
                            : "This Month",
                        style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.secondaryColor,
                            fontWeight: FontWeight.w700),
                      )
                    : Container(),
                controller.logSummaryOverview.data != null
                    ? Text(
                        controller.logSummaryOverview.data!.queryString!.start!
                                .isNotEmpty
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
      );

  _showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: Get.context!,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        PopupMenuItem<String>(
          value: '',
          child: RichText(
            text: TextSpan(
              text: AppString.pop_up_scheduled_short,
              style: AppStyle.normal_text_black,
              children: [
                TextSpan(
                    text: AppString.pop_up_scheduled_long,
                    style: AppStyle.normal_text_grey),
              ],
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: '',
          child: RichText(
            text: TextSpan(
              text: AppString.pop_up_paid_leave_short,
              style: AppStyle.normal_text_black,
              children: [
                TextSpan(
                    text: AppString.pop_up_paid_leave_long,
                    style: AppStyle.normal_text_grey),
              ],
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: '',
          child: RichText(
            text: TextSpan(
              text: AppString.pop_up_worked_short,
              style: AppStyle.normal_text_black,
              children: [
                TextSpan(
                    text: AppString.pop_up_worked_long,
                    style: AppStyle.normal_text_grey),
              ],
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: '',
          child: RichText(
            text: TextSpan(
              text: AppString.pop_up_break_time_short,
              style: AppStyle.normal_text_black,
              children: [
                TextSpan(
                    text: AppString.pop_up_break_time_long,
                    style: AppStyle.normal_text_grey),
              ],
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: '',
          child: RichText(
            text: TextSpan(
              text: AppString.pop_up_balance_short,
              style: AppStyle.normal_text_black,
              children: [
                TextSpan(
                    text: AppString.pop_up_balance_long,
                    style: AppStyle.normal_text_grey),
              ],
            ),
          ),
        ),
      ],
      elevation: 8.0,
    );
  }
}

logsList(AttendanceLogsController controller) {
  return ListView.builder(
    itemCount: Get.find<AttendanceLogsController>()
        .logSummaryOverview
        .data
        ?.attendanceDetails
        ?.length,
    itemBuilder: (context, index) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _dateInfo(index),
              customSpacerWidth(width: 20),
              Expanded(child: _summaryInfo(index)),
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

_dateInfo(int index) {
  var controller = Get.find<AttendanceLogsController>();
  return SizedBox(
    width: AppLayout.getWidth(40),
    child: Row(
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
      ],
    ),
  );
}

_summaryInfo(int index) {
  var controller = Get.find<AttendanceLogsController>();
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          _logOverviewInfos(
              title: AppString.pop_up_scheduled_short,
              count: controller.logSummaryOverview.data != null
                  ? controller.logSummaryOverview.data!
                      .attendanceDetails![index].scheduledHours
                      .toString()
                  : ""),
          customSpacerHeight(height: 10),
          _logOverviewInfos(
              title: AppString.pop_up_worked_short,
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
              title: AppString.pop_up_paid_leave_short,
              count: controller.logSummaryOverview.data != null
                  ? controller.logSummaryOverview.data!
                  .attendanceDetails![index].paidLeaves
                  .toString()
                  : ""),
          customSpacerHeight(height: 10),
          _logOverviewInfos(
              title: AppString.pop_up_balance_short,
              count: controller.logSummaryOverview.data != null
                  ? controller.logSummaryOverview.data!
                  .attendanceDetails![index].balance
                  .toString()
                  : ""),
        ],
      ),
      _logOverviewInfos(
          title: AppString.pop_up_break_time_short,
          count: controller.logSummaryOverview.data != null
              ? controller
                  .logSummaryOverview.data!.attendanceDetails![index].breakTime
                  .toString()
              : ""),
    ],
  );
}

_logOverviewInfos({required String title, required String count}) => Row(
      children: [
        SizedBox(
          child: Text(
            title,
            style: AppStyle.normal_text_grey,
          ),
        ),
        customSpacerWidth(width: 4),
        Text(
          count,
          style: AppStyle.normal_text_grey,
        ),
      ],
    );

Future _openBottomSheet() {
  return showModalBottomSheet(
    enableDrag: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: Get.context!,
    builder: (context) => const SelectRangeCalender(
      rangeCalendarMethodImp: RangeCalendarMethodImp.LOG_SUMMARY,
    ),
  );
}
