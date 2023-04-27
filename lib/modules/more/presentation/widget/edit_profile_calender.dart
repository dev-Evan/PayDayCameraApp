import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../utils/app_string.dart';
import 'package:intl/intl.dart';

class EditProfileCalender extends StatefulWidget {
  const EditProfileCalender({Key? key}) : super(key: key);

  @override
  State<EditProfileCalender> createState() => _EditProfileCalenderState();
}

class _EditProfileCalenderState extends State<EditProfileCalender> {
  DateTime today = DateTime.now();
  final firstDate = DateTime.utc(2012);
  final lastDate = DateTime.utc(2040);
  final _box = GetStorage();

  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
      _box.write(AppString.STORE_DATE,
          DateFormat('yyyy-MM-dd').format(today).toString());
      print(_box.read(AppString.STORE_DATE.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: "en_US",
      rowHeight: AppLayout.getHeight(43),
      calendarFormat: CalendarFormat.month,
      calendarStyle: const CalendarStyle(
        selectedDecoration:
            BoxDecoration(color: AppColor.primaryColor, shape: BoxShape.circle),
        todayDecoration: BoxDecoration(color: Colors.transparent),
        todayTextStyle: TextStyle(color: AppColor.primaryColor),
      ),
      headerStyle:
          const HeaderStyle(formatButtonVisible: false, titleCentered: true),
      availableGestures: AvailableGestures.all,
      firstDay: firstDate,
      lastDay: lastDate,
      focusedDay: today,
      onDaySelected: _onDaySelected,
      selectedDayPredicate: (day) => isSameDay(day, today),
    );
  }
}
