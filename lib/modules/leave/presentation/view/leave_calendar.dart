import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

class DatePickerCustom extends StatefulWidget {
  const DatePickerCustom({Key? key}) : super(key: key);

  @override
  State<DatePickerCustom> createState() => _DatePickerCustomState();
}

class _DatePickerCustomState extends State<DatePickerCustom> {
  int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;
  @override
  void initState() {
    super.initState();

    lastDayOfMonth = DateTime(now.year, now.month + 1, now.day);
  }
  late DateTime _selectedDate;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          CalendarTimeline(
            initialDate: DateTime(2019, 1, 15),
            firstDate: DateTime(2019, 1, 15),
            lastDate: DateTime(2020, 11, 20),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            dayNameColor: AppColor.cardColor,
            //showYears: true,
            //shrink: true,
            monthColor: Colors.blueGrey,
            dayColor: AppColor.normalTextColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: AppColor.primaryColor,
            dotsColor: AppColor.primaryColor,

            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en_ISO',
          )
        ],),
      ),
    );
  }
}
