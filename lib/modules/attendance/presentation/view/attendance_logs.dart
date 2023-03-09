import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_logs_widget.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/dot_indicator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/timer_overview_layout.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class attendanceLogsScreen extends StatelessWidget {
  const attendanceLogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        floatingActionButton:Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: CustomButton(AppString.text_requstAttendance, (){}),
        ),
        appBar: CustomAppbar(),
        body: Stack(
       children: [
         CustomScrollView(
          slivers: [

            SliverFillRemaining(
              hasScrollBody: false,

              child: Column(
                children: [
                  Container(
                    height: AppLayout.getHeight(310),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Dimensions.radiusMid),
                            bottomRight: Radius.circular(Dimensions.radiusMid))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          backlogs(),
                          attendanceLogsOverviewLayout(context),
                          dotIndicator()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(2),
                  ),
                  SingleChildScrollView(
                    child: Container(
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
        ));
  }
}
