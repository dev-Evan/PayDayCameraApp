import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_leave_view.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../common/widget/custom_buttom_sheet.dart';
import '../../../../common/widget/custom_button.dart';
import '../widget/individual_leave_record.dart';
import '../widget/leave_allowance_layout.dart';

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
    Get.find<LeaveController>()
        .getIndividualLeaveList(queryParams: "date_range=$value");
    return controller.obx(
        (state) => Scaffold(
              floatingActionButton: Padding(
                padding: EdgeInsets.only(left: AppLayout.getWidth(28)),
                child: _appLeaveBtn(context: context),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    leaveAllowanceLayout(),
                    individualDateLeaveRecord(),
                  ],
                ),
              ),
            ),
        onLoading: const LoadingIndicator());
  }


  Widget _appLeaveBtn({context}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(12),horizontal: AppLayout.getWidth(12)),
      child: CustomButton(AppString.text_apply_leve, () async {
        await controller.getLeaveType();
        customButtonSheet(
            context: context, height: 0.9, child: const ApplyLeaveView());
      }),
    );
  }


}
