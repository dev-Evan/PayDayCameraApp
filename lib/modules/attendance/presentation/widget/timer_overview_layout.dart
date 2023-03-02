import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/dot_indicator.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../widget/vertical_divider.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../../utils/app_style.dart';

Widget timerOverviewLayout() {
  return SizedBox(
    width: double.infinity,
    height: AppLayout.getHeight(60),
    child: PageView(
      children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inTimeLog(),
              const Spacer(),
              verticalDivider(),
              const Spacer(),
              outTimeLog(),
              const Spacer(),
              verticalDivider(),
              const Spacer(),
              balanceTimeLog(),
            ]),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              scheduledTimeLog(),
              const Spacer(),
              verticalDivider(),
              const Spacer(),
              remainingTimeLog(),
              const Spacer(),
              verticalDivider(),
              const Spacer(),
              overtimeTimeLog(),
            ]),
      ],
    ),
  );
}
overtimeTimeLog() {
  return logInfo(title: AppString.text_overtime, time: "");
}

remainingTimeLog() {
  return logInfo(title: AppString.text_remaining, time: "");
}

scheduledTimeLog() {
  return logInfo(title: AppString.text_scheduled, time: "");
}

balanceTimeLog() {
  return logInfo(title: AppString.text_balance, time: "");
}

outTimeLog() {
  return logInfo(title: AppString.text_out, time: "3.55");
}

inTimeLog() {
  return logInfo(title: AppString.text_in, time: DateTime.now().toString());
}

logInfo({required String title, required String time, Color? fontColor}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: fontColor != null
              ? AppStyle.small_text.copyWith(color: fontColor)
              : AppStyle.small_text),
      RichText(
          text: TextSpan(children: [
        TextSpan(
          text: "11",
          style: fontColor != null
              ? AppStyle.extra_large_text
                  .copyWith(fontWeight: FontWeight.bold, color: fontColor)
              : AppStyle.extra_large_text.copyWith(fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: " am ",
          style: AppStyle.small_text,
        ),
      ]))
    ],
  );
}




Widget attendanceLogsOverviewLayout(context) {
  return SizedBox(
    width: double.infinity,
    height: AppLayout.getHeight(230),
    child: PageView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logsText(AppString.text_month),
            Container(
              height:AppLayout.getHeight(210),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3 / 2.3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        elevation: 0,
                        color: AppColor.cardColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault),
                            side: BorderSide(
                                width: 2,
                                color: AppColor.cardColor.withOpacity(0.2))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '148',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Dimensions.fontSizeLarge,
                                        color: AppColor.cardColor.withOpacity(0.8)),
                                  ),
                                  Text(
                                    'Worked',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Dimensions.fontSizeMid,
                                        color: AppColor.cardColor.withOpacity(0.8)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),


        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logsText(AppString.text_year),
            Container(
              height:AppLayout.getHeight(220),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3 / 2.3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        elevation: 0,
                        color: AppColor.cardColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault),
                            side: BorderSide(
                                width: 2,
                                color: AppColor.cardColor.withOpacity(0.2))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '148',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Dimensions.fontSizeLarge,
                                        color: AppColor.cardColor.withOpacity(0.8)),
                                  ),
                                  Text(
                                    'Worked',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Dimensions.fontSizeMid,
                                        color: AppColor.cardColor.withOpacity(0.8)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

      ],
    ),
  );
}

Widget logsText(text){
  return Container(
    height: AppLayout.getHeight(20),
    width: AppLayout.getWidth(150),
    child: Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Text(text,style: AppStyle.large_text.copyWith(fontSize: Dimensions.fontSizeMid),),
    ),
  );
}

