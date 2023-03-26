import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/request_attendance_bottomsheet.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_logs_widget.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/dot_indicator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/timer_overview_layout.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class AttendanceLogsScreen extends StatelessWidget {
  const AttendanceLogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: AppLayout.getWidth(30)),
          child: CustomButton(AppString.text_requstAttendance, () {
            _openRequestAttendanceBottomSheet(context: context);
          }),
        ),
        appBar: const CustomAppbar(),
        body: Stack(
          children: [
            CustomScrollView(
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
                                bottomLeft:
                                    Radius.circular(Dimensions.radiusMid),
                                bottomRight:
                                    Radius.circular(Dimensions.radiusMid))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              backlogs(context),
                              attendanceLogsOverviewLayout(context),
                              dotIndicator(),
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
                          child: tabBar(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        )


    );
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
