import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:table_calendar/table_calendar.dart';

class ApplyLevPopUpCalendar extends StatefulWidget {
  const ApplyLevPopUpCalendar({Key? key}) : super(key: key);

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

  Map<String, List> mySelectedEvents = {};
  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          locale: "en_US",
          rowHeight: 43,

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

       
      ],
    );
  }
}
