import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_allowance.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/view/leve_records_view.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_leave_view.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../common/widget/custom_buttom_sheet.dart';
import '../../../../common/widget/custom_button.dart';
import '../../../../common/widget/custom_navigator.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_style.dart';
import '../../../attendance/presentation/widget/attendance_log_text.dart';
import '../widget/individual_leave_record.dart';

class Leave extends GetView<LeaveController> {
  const Leave({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.getLeaveAllowance();
    Map<String, String> queryParams = {
      "start": DateFormat("yyyy-MM-dd").format(DateTime.now()),
      "end": DateFormat("yyyy-MM-dd").format(DateTime.now())
    };
    String value = json.encode(queryParams);
    Get.find<LeaveController>().getIndividualLeaveList(queryParams: "date_range=$value");
    return controller.obx(
        (state) => Scaffold(
              floatingActionButton: Padding(
                padding: EdgeInsets.only(left: AppLayout.getWidth(28)),
                child: _appLeaveBtn(context: context),
              ),
              body: RefreshIndicator(
                onRefresh: _refreshPage,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      _leaveAllowanceLayout(context: context),
                      individualDateLeaveRecord(),
                    ],
                  ),
                ),
              ),
            ),
        onLoading: const LoadingIndicator());
  }

  Widget _appLeaveBtn({context}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(12),
          horizontal: AppLayout.getWidth(12)),
      child: CustomButton(AppString.text_apply_leve, () async {
        customButtonSheet(
            context: context, height: 0.9, child: const ApplyLeaveView());
        await controller.getLeaveType();


      }),
    );
  }

  _leaveAllowanceLayout({required context}) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12))),
      child: Column(
        children: [
          _leaveAllowance(),
          attendanceLogText(
              context: Get.context!,
              text: AppString.text_leave_records,
              onAction: () async {
                defaultNavigator(context:context,routeName:const LeaveRecordsView());
                await Get.find<LeaveController>().getLeaveSummary();
                await Get.find<LeaveController>().getLeaveRecord(params: "&within=thisMonth");}),
        ],
      ),
    );
  }

  _leaveAllowance() {

    List<Data>? data = Get.find<LeaveController>().leaveAllowance.data;
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: AppLayout.getWidth(20)),
      scrollDirection: Axis.horizontal,
      child: data != null
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: Get.find<LeaveController>()
                  .leaveAllowance
                  .data!
                  .map((Data data) {
                return Container(
                  width: AppLayout.getSize(Get.context!).width * .85,
                  margin: EdgeInsets.only(
                      top: AppLayout.getHeight(20),
                      right: AppLayout.getWidth(10)),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getWidth(10),
                      vertical: AppLayout.getHeight(10)),
                  decoration: AppStyle.ContainerStyle.copyWith(
                      color: AppColor.cardColor.withOpacity(0.1),
                      border: Border.all(
                          width: 1, color: AppColor.cardColor.withOpacity(0.2)),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Column(children: [
                    _titleLayout(data),
                    customSpacerHeight(height: 20),
                    _allowanceDetails(data),
                  ]),
                );
              }).toList(growable: true))
          : Container(),
    );
  }

  _titleLayout(Data data) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            data.leaveStatus ?? "",
            style: AppStyle.small_text,
          )),
          _leaveTypeStatusButton(type: data.leaveType ?? ""),
        ],
      );

  _leaveTypeStatusButton({required String type}) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(12),
          vertical: AppLayout.getHeight(4),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: type.toLowerCase().startsWith("paid")
                ? AppColor.primaryGreen
                : AppColor.primaryYellow),
        child: Text(type, style: AppStyle.small_text),
      );

  _allowanceDetails(Data data) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisExtent: AppLayout.getHeight(25),
      ),
      children: data.values!
          .map((value) => _allowanceCounter(value))
          .toList(growable: true),
    );
  }

  Widget _allowanceCounter(Values values) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            values.leaveType ?? "",
            style: AppStyle.small_text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Text(
          values.value ?? "",
          style: AppStyle.small_text,
        )
      ],
    );
  }

  Future<void> _refreshPage() async {
    controller.getLeaveAllowance();
    Map<String, String> queryParams = {
      "start": DateFormat("yyyy-MM-dd").format(DateTime.now()),
      "end": DateFormat("yyyy-MM-dd").format(DateTime.now())
    };
    String value = json.encode(queryParams);
    Get.find<LeaveController>()
        .getIndividualLeaveList(queryParams: "date_range=$value");
  }
}
