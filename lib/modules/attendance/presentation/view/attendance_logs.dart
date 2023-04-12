import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/request_attendance_bottomsheet.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/log_summary_tabbar.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/dot_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../widget/attendace_log_overview.dart';

class AttendanceLogsScreen extends GetView<AttendanceLogsController> {
  const AttendanceLogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getLogSummaryByMonth();
    controller.getLogSummaryByYear();
    controller.getAllFilteredLogSummary();
    controller.getLogSummaryOverview();
    return controller.obx(
        (state) => Scaffold(
            backgroundColor: AppColor.backgroundColor,
            floatingActionButton: Padding(
              padding: EdgeInsets.only(left: AppLayout.getWidth(30)),
              child: CustomButton(AppString.text_requstAttendance, () {
                _openRequestAttendanceBottomSheet(context: context);
              }),
            ),
            appBar: const CustomAppbar(),
            body: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Container(
                        height: AppLayout.getHeight(305),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Dimensions.radiusMid),
                            bottomRight: Radius.circular(Dimensions.radiusMid),
                          ),
                        ),
                        child: SingleChildScrollView(
                          physics: const PageScrollPhysics(),
                          child: Column(
                            children: [
                              customMoreAppbar(
                                  titleText: AppString.text_attendance_log,
                                  bgColor: AppColor.primaryColor,
                                  textColor: Colors.white),
                              attendanceLogsOverviewLayout(context),
                              Obx(() => dotIndicator(controller.currentIndex.value)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(2),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: logSummaryTabBar(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
        onLoading: const LoadingIndicator());
  }
}

Future _openRequestAttendanceBottomSheet({required BuildContext context}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => const RequestAttendanceBottomSheet(),
  );
}
