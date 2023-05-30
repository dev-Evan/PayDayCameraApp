import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/controller/date_time_helper_controller.dart';
import '../../../../common/widget/custom_app_button.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimensions.dart';
import 'bottom_sheet_appbar.dart';

class SingleDatePicker extends StatefulWidget {
  const SingleDatePicker({Key? key}) : super(key: key);

  @override
  State<SingleDatePicker> createState() => _SingleDatePickerState();
}

class _SingleDatePickerState extends State<SingleDatePicker> {
  DateTime today = DateTime.now().toUtc();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(550),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(0, 3),
            )
          ]),
      margin: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
      child: Column(
        children: [
          bottomSheetAppbar(
              context: context, appbarTitle: AppString.text_select_date),
          TableCalendar(
            calendarStyle: CalendarStyle(
                selectedDecoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.primaryBlue),
                todayDecoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent),
                todayTextStyle: AppStyle.extra_large_text_black.copyWith(
                    color: AppColor.primaryBlue, fontWeight: FontWeight.bold)),
            headerStyle: HeaderStyle(
                titleTextStyle: AppStyle.normal_text.copyWith(
                    color: AppColor.primaryBlue, fontWeight: FontWeight.bold),
                titleCentered: true,
                formatButtonVisible: false),
            focusedDay: today,
            firstDay: DateTime.utc(2010, 01, 01),
            lastDay: DateTime.utc(2030, 12, 31),
            selectedDayPredicate: (day) => isSameDay(day, today),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                today = selectedDay;
              });
            },
          ),
          const Spacer(),
          SizedBox(
            width: AppLayout.getWidth(170),
            child: AppButton(
              buttonText: AppString.text_save,
              onPressed: () {
                Navigator.pop(Get.context!);
                print("Pressed");
                Get.find<DateTimeController>().requestedDate.value =
                    DateFormat('yyyy-MM-dd').format(today);
                Get.find<LeaveController>().requestLeaveQueries["date"]=DateFormat('yyyy-MM-dd').format(today);
              },
              isButtonExpanded: false,
              buttonColor: AppColor.primaryBlue,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
