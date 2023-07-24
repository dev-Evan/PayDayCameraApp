import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/common/widget/no_data_found.dart';
import 'package:pay_day_mobile/enum/range_calendar_method_imp.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/selected_range_calender.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/view_list_view.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import '../../../payslip/presentation/widget/summary_layout.dart';

class LeaveRecordsView extends GetView<LeaveController> {
  const LeaveRecordsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: controller.obx(
          (state) => RefreshIndicator(
                onRefresh: _refreshPage,
                child: controller.obx((state) => SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          _defaultAppbar(),
                          summaryLayout(
                              sentDynamic:
                                  controller.leaveSummary.data?.approved ??
                                      "",
                              conflictedDynamic:
                                  controller.leaveSummary.data?.upcoming ??
                                      "",
                              totalDynamic:
                                  controller.leaveSummary.data?.pending ?? "",
                              total: AppString.text_approved,
                              sent: AppString.text_upcomming,
                              conflicted: AppString.text_pending,
                              topTextValue: "",
                              layoutHeight: 20,context: context),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppLayout.getWidth(20),
                                    vertical: AppLayout.getHeight(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [_customTexTitle(context)],
                                ),
                              ),
                              (controller.leaveRecord.data?.leaveRecords !=null &&  controller.leaveRecord.data!.leaveRecords!.isNotEmpty)?
                              viewListViewLayout():noDataFound(height: 100,svgHeight: 140,svgWidth: 140),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
          onLoading: const LoadingIndicator()),
    );
  }

  Widget _customTitleTextStyle({titleText}) {
    return Row(
      children: [
        Text(
          titleText,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.secondaryColor, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          width: AppLayout.getWidth(12),
        ),
        const Icon(
          Icons.keyboard_arrow_down,
          color: AppColor.hintColor,
        )
      ],
    );
  }

  Future _openBottomSheet() {
    return showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) => const SelectRangeCalender(
        rangeCalendarMethodImp: RangeCalendarMethodImp.LEAVE_RECORD,
      ),
    );
  }

  Widget _customTexTitle(context) {
    return InkWell(
      onTap: () => _openBottomSheet(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _customTitleTextStyle(titleText: controller.rangeName.value),
          Text(
            '${DateFormat("dd MMM yyyy").format(controller.rangeStartDay.value)} - ${DateFormat("dd MMM yyyy").format(controller.rangeEndDate.value)}',
            style:
                AppStyle.small_text_black.copyWith(color: AppColor.hintColor),
          ),
        ],
      ),
    );
  }

  Future<void> _refreshPage() async {
    await Get.find<LeaveController>().getLeaveSummary();
    await Get.find<LeaveController>()
        .getLeaveRecord(params: "&within=thisMonth");
  }

  _defaultAppbar() {
    return customMoreAppbar(
      titleText: AppString.text_leave_records,
      bgColor: AppColor.primaryColor,
      textColor: AppColor.backgroundColor,
    );
  }
}
