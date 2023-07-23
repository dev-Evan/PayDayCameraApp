import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/request_attendance_bottomsheet.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import '../../../../common/widget/custom_appbar.dart';
import '../../../../common/widget/custom_button.dart';
import '../../../../common/widget/custom_divider.dart';
import '../../../../enum/range_calendar_method_imp.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import '../../../more/presentation/widget/documents_appbar.dart';
import '../widget/attendace_log_overview.dart';
import '../widget/dot_indicator.dart';
import '../widget/logs_list.dart';
import '../widget/selected_range_calender.dart';

class AttendanceLog extends GetView<AttendanceLogsController> {
  const AttendanceLog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: AppLayout.getWidth(30)),
        child: CustomButton(AppString.text_requstAttendance, () {
          _openRequestAttendanceBottomSheet(context: context);
        }),
      ),
      body: controller.obx((state) => _body(),
          onLoading: const LoadingIndicator()),
    );
  }

  _body() {
    return RefreshIndicator(
        onRefresh: _reloadPage,
        child: SingleChildScrollView(
          controller: controller.scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            _totalLogInfoSummary(),
            customSpacerHeight(height: 20),
            _attendanceLogLayout()
          ]),
        ));
  }

  _totalLogInfoSummary() {
    return Container(
      padding: EdgeInsets.only(bottom: AppLayout.getHeight(20)),
      decoration: const BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          customMoreAppbar(
              titleText: AppString.text_attendance_log,
              bgColor: AppColor.primaryColor,
              textColor: Colors.white),
          attendanceLogsOverviewLayout(),
          Obx(() => dotIndicator(controller.currentIndex.value)),
        ],
      ),
    );
  }

  _attendanceLogLayout() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _tabButton(),
          customSpacerHeight(height: 20),
          Obx(
            () => Visibility(
              child: _summaryLogScreen(),
              visible: controller.isShortSummaryClicked.value,
              replacement: _allLogScreen(),
            ),
          ),
          // _tabScreen(),
        ],
      ),
    );
  }

  _tabButton() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: InkWell(
                    onTap: () => controller.isShortSummaryClicked(false),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(10)),
                      decoration: BoxDecoration(
                        color: controller.isShortSummaryClicked.isTrue
                            ? Colors.transparent
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(AppString.text_all_logs,
                              style: controller.isShortSummaryClicked.isTrue
                                  ? AppStyle.normal_text_grey
                                  : AppStyle.normal_text_black)),
                    )),
              ),
              customSpacerWidth(width: 10),
              Expanded(
                child: InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(10)),
                      decoration: BoxDecoration(
                        color: controller.isShortSummaryClicked.isTrue
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(AppString.text_summary,
                              style: controller.isShortSummaryClicked.isTrue
                                  ? AppStyle.normal_text_black
                                  : AppStyle.normal_text_grey)),
                    ),
                    onTap: () => controller.isShortSummaryClicked(true)),
              )
            ],
          )),
    );
  }

  _allLogScreen() {
    return Column(
      children: [
        _filterLayoutAllLogs(),
        customSpacerHeight(height: 20),
        _allLogList(),
      ],
    );
  }

  _filterLayoutAllLogs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => _openBottomSheet(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.filteredLogSummary.data != null
                      ? Text(
                          controller.filteredLogSummary.data!.queryString!
                                  .start!.isNotEmpty
                              ? "Custom"
                              : "This Month",
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.secondaryColor,
                              fontWeight: FontWeight.w700),
                        )
                      : Container(),
                  controller.filteredLogSummary.data != null
                      ? Text(
                          controller.filteredLogSummary.data!.queryString!
                                  .start!.isNotEmpty
                              ? "${controller.filteredLogSummary.data?.queryString?.start} - ${controller.filteredLogSummary.data?.queryString?.end}"
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
    );
  }

  _allLogList() {
    return const LogsList();
  }

  Future _openBottomSheet() {
    return showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) => const SelectRangeCalender(
          rangeCalendarMethodImp: RangeCalendarMethodImp.ALL_LOG),
    );
  }

  _summaryLogScreen() {
    return Column(
      children: [
        _filterLayoutSummary(),
        customSpacerHeight(height: 20),
        _shortSummaryListLayout(),
      ],
    );
  }

  _filterLayoutSummary() {
    return Row(
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
    );
  }

  _filterBox() => InkWell(
        onTap: () => _openShortSummaryLogSheet(),
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

  _shortSummaryListLayout() {
    return _shortSummaryLogsList();
  }

  _shortSummaryLogsList() {
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      separatorBuilder: (context, index) => customSpacerHeight(height: 30),
      itemCount:
          (Get.find<AttendanceLogsController>().logSummaryOverview.data != null)
              ? Get.find<AttendanceLogsController>()
                      .logSummaryOverview
                      .data!
                      .attendanceDetails!
                      .length +
                  1
              : 0,
      itemBuilder: (context, index) {
        if (index ==
            controller.logSummaryOverview.data?.attendanceDetails?.length) {
          return customSpacerHeight(height: 70);
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _dateInfo(index),
              customSpacerWidth(width: 20),
              Expanded(child: _summaryInfo(index)),
            ],
          );
        }
      },
    );
  }

  _dateInfo(int index) {
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
          customDivider(25, 1),
        ],
      ),
    );
  }

  _summaryInfo(int index) {
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
                ? controller.logSummaryOverview.data!.attendanceDetails![index]
                    .breakTime
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

  Future _openShortSummaryLogSheet() {
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

  Future _openRequestAttendanceBottomSheet({required BuildContext context}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const RequestAttendanceBottomSheet(),
    );
  }

  Future<void> _reloadPage() async {
    await controller.getLogSummaryByMonth();
    await controller.getLogSummaryByYear();
    await controller.getAllFilteredLogSummary();
    await controller.getLogSummaryOverview();
  }
}
