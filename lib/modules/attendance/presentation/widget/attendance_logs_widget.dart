import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/all_logs.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/tabbar_summary.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget backlogs() {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColor.primaryColor,
    leading: IconButton(
      onPressed: () {},
      icon: Icon(Icons.arrow_back),
    ),
    title: Text(
      AppString.text_attendance_log,
      style: AppStyle.mid_large_text.copyWith(
          fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeDefault),
    ),
  );
}

Widget tabBar() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child:  Container(
    child: DefaultTabController(
    length: 2,
    child: Column(
      children: [
        Container(
          height: AppLayout.getHeight(53),
          decoration: BoxDecoration(
            color: AppColor.disableColor.withOpacity(0.6),
            borderRadius:
            BorderRadius.circular(Dimensions.radiusDefault + 4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: TabBar(
              indicator: BoxDecoration(
                color: AppColor.cardColor,
                borderRadius:
                BorderRadius.circular(Dimensions.radiusDefault),
              ),
              labelColor: AppColor.normalTextColor,
              unselectedLabelColor: AppColor.hintColor,
              labelStyle: AppStyle.mid_large_text
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
              tabs: [
                Tab(
                  text: AppString.text_all_logs,
                ),
                Tab(
                  text: AppString.text_summary,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(children: [
            allLogsScreen(),
            summaryScreen(),
          ]),
        ),
      ],
    ),
  ),
  ),
  );
}

Widget tabBarAllSummary() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      color: Colors.red,
    ),
  );
}
