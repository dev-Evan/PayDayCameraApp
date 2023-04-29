import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_log_text.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/view/leave_calendar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/view/leve_records_view.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_leave_view.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../common/widget/custom_buttom_sheet.dart';
import '../../../../common/widget/custom_button.dart';
import '../../../../common/widget/custom_navigator.dart';
import '../widget/page_view_layout.dart';

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
              body: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              decoration: AppStyle.ContainerStyle.copyWith(
                                      color: AppColor.primaryColor)
                                  .copyWith(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              Dimensions.radiusMid),
                                          bottomRight: Radius.circular(
                                              Dimensions.radiusMid))),
                              child: Column(
                                children: [
                                  customSpacerHeight(height: 20),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: AppLayout.getWidth(20)),
                                      child: Row(children: [
                                        pageViewLayout(
                                            title: AppString.text_availablity,
                                            data: Get.find<LeaveController>()
                                                .leaveAllowance
                                                .data),
                                        customSpacerWidth(width: 20),
                                        pageViewLayout(
                                            title: AppString.text_taken,
                                            data: Get.find<LeaveController>()
                                                .leaveAllowance
                                                .data),
                                      ]),
                                    ),
                                  ),
                                  attendanceLogText(
                                      context: context,
                                      text: AppString.text_payrun_badge,
                                      onAction: () async {
                                        CustomNavigator(
                                            context: context,
                                            pageName: const LeaveRecordsView());
                                        await Get.find<LeaveController>()
                                            .getLeaveSummary();
                                      }),
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              color: AppColor.backgroundColor,
                              child: Column(
                                children: [
                                  const DatePickerCustom(),
                                  _noDataImg(),
                                ],
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
        onLoading: const LoadingIndicator());
  }
}

Widget _appLeaveBtn({context}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: CustomButton(
        AppString.text_apply_leve,
        () => customButtomSheet(
            context: context, height: 0.9, child: const ApplyLeaveView())),
  );
}

Widget _noDataImg() {
  return SizedBox(
    height: AppLayout.getHeight(160),
    child: Image.asset(
      Images.calendar,
      fit: BoxFit.fitHeight,
    ),
  );
}
