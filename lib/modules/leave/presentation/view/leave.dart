import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_log_text.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/view/leave_calendar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/view/leve_records_view.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_leave_view.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/leave_allowance.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
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

}

Widget _appLeaveBtn({context}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: CustomButton(AppString.text_apply_leve, () async {
      await Get.find<LeaveController>().getLeaveType();
      customButtomSheet(
          context: context, height: 0.9, child: const ApplyLeaveView());
    }),
  );
}

