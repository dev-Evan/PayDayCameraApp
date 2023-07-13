import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import '../../../payslip/presentation/widget/summary_layout.dart';

Widget attendanceLogsOverviewLayout(context) {
  final controller = Get.find<AttendanceLogsController>();
  return SizedBox(
    width: double.infinity,
    height: AppLayout.getHeight(230),
    child: PageView(
      onPageChanged: (value) {
        controller.currentIndex.value = value;
      },
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logsText(AppString.textMonth),
            SizedBox(
              height: AppLayout.getHeight(210),
              child: Padding(
                padding:
                     EdgeInsets.only(left:AppLayout.getWidth(20), right:AppLayout.getWidth(20), top:AppLayout.getHeight(10)),
                child: GridView.count(
                    childAspectRatio:
                        AppLayout.getWidth(90) / AppLayout.getHeight(65),
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _logSummaryCard(
                          title: AppString.text_scheduled,
                          count: controller
                              .logSummaryByMonth.value.data?.scheduled),
                      _logSummaryCard(
                          title: AppString.text_worked,
                          count:
                              controller.logSummaryByMonth.value.data?.worked),
                      _logSummaryCard(
                          title: AppString.text_balance,
                          count: controller
                              .logSummaryByMonth.value.data?.balance),
                      _logSummaryCard(
                          title: AppString.text_leave_hour,
                          count: controller
                              .logSummaryByMonth.value.data?.paidLeave),
                      _logSummaryCard(
                          title: AppString.text_behaviour,
                          count: controller
                              .logSummaryByMonth.value.data?.behavior),
                      _logSummaryCard(
                          title: AppString.text_availablity,
                          count:"${ controller
                              .logSummaryByMonth.value.data?.availablity} %"),
                    ]),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logsText(AppString.textYear),
            SizedBox(
              height: AppLayout.getHeight(210),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: GridView.count(
                    childAspectRatio:
                        AppLayout.getWidth(90) / AppLayout.getHeight(65),
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _logSummaryCard(
                          title: AppString.text_scheduled,
                          count: controller
                              .logSummaryByYear.value.data?.scheduled),
                      _logSummaryCard(
                          title: AppString.text_worked,
                          count:
                              controller.logSummaryByYear.value.data?.worked),
                      _logSummaryCard(
                          title: AppString.text_balance,
                          count:
                              controller.logSummaryByYear.value.data?.balance),
                      _logSummaryCard(
                          title: AppString.text_leave_hour,
                          count: controller
                              .logSummaryByYear.value.data?.paidLeave),
                      _logSummaryCard(
                          title: AppString.text_behaviour,
                          count: controller
                              .logSummaryByYear.value.data?.behavior),
                      _logSummaryCard(
                          title: AppString.text_availablity,
                          count: "${controller
                              .logSummaryByYear.value.data?.availablity} %"),
                    ]),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget logCard(String count, String title) => Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        color: AppColor.cardColor.withOpacity(0.1),
        border: Border.all(
          width: 2,
          color: AppColor.cardColor.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.radiusDefault),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.fontSizeLarge - 3,
                color: AppColor.cardColor.withOpacity(0.8)),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.fontSizeMid - 3,
                color: AppColor.cardColor.withOpacity(0.8)),
          ),
        ],
      ),
    );

Widget _logSummaryCard({String? count, String? title}) => SizedBox(
      child: Card(
        elevation: 0,
        color: AppColor.cardColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault+2),
            side: BorderSide(
                width: 1, color: AppColor.cardColor.withOpacity(0.2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(Dimensions.paddingDefault),
                  vertical: AppLayout.getHeight(Dimensions.paddingDefault)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    count ?? "",
                    style: dynamicTextStyle
                  ),
                  Text(
                    title ?? "",
                    style:countTextStyle
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget logsText(text) {
  return SizedBox(
    height: AppLayout.getHeight(20),
    width: AppLayout.getWidth(150),
    child: Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Text(
        text,
        style: AppStyle.large_text.copyWith(fontSize: Dimensions.fontSizeMid),
      ),
    ),
  );
}
