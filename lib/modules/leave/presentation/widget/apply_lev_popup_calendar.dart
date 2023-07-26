import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../common/widget/custom_button.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../../../attendance/presentation/widget/bottom_sheet_appbar.dart';

class ApplyLevPopUpCalendar extends StatefulWidget {
  final bool? isStartDay;

  const ApplyLevPopUpCalendar({ this.isStartDay, super.key});

  @override
  State<ApplyLevPopUpCalendar> createState() => _ApplyLevPopUpCalendarState();
}

class _ApplyLevPopUpCalendarState extends State<ApplyLevPopUpCalendar> {
  DateTime today = DateTime.now();
  final firstDate = DateTime.utc(2012);
  final lastDate = DateTime.utc(2040);

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bottomSheetAppbar(
            context: context, appbarTitle: AppString.text_select_date),
        TableCalendar(
          locale: "en_US",
          rowHeight: 38,
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
          availableGestures: AvailableGestures.all,
          firstDay: firstDate,
          lastDay: lastDate,
          focusedDay: today,
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDate, selectedDay)) {
              setState(() {
                _selectedDate = selectedDay;
                _focusedDay = focusedDay;
                print(selectedDay.toString());
              });
            }
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDate, day);
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        customSpacerHeight(height: 20),

        _save(),
        customSpacerHeight(height: 8),

      ],
    );
  }

  _save() {
    return  CustomSmallButton(AppString.text_save, () {
      widget.isStartDay!
          ? Get.find<LeaveController>().startDate.value =
          DateFormat('yyyy-MM-dd').format(_selectedDate!)
          : Get.find<LeaveController>().endDate.value =
          DateFormat('yyyy-MM-dd').format(_selectedDate!);
      Get.back();
    });
  }
}
