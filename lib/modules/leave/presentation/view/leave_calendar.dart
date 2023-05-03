import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

import '../controller/leave_controller.dart';
import '../widget/custom_horizontal_calendar/custom_horizontal_calendar.dart';

class DatePickerCustom extends StatefulWidget {
  const DatePickerCustom({Key? key}) : super(key: key);

  @override
  State<DatePickerCustom> createState() => _DatePickerCustomState();
}

class _DatePickerCustomState extends State<DatePickerCustom> {
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomCalendarTimeline(
              initialDate: now,
              showYears: false,
              monthColor: Colors.blueAccent,
              firstDate: DateTime(2015, 1, 1),
              lastDate: DateTime(2030, 12, 1),
              onDateSelected: (date) {
                Map<String, String> queryParams = {
                  "start": DateFormat("yyyy-MM-dd").format(date),
                  "end": DateFormat("yyyy-MM-dd").format(date)
                };
                String value = json.encode(queryParams);
                Get.find<LeaveController>()
                    .getIndividualLeaveList(queryParams: "date_range=$value");
              },
              dayNameColor: AppColor.cardColor,
              dayColor: AppColor.normalTextColor,
              activeDayColor: Colors.white,
              activeBackgroundDayColor: AppColor.primaryColor,
              dotsColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
