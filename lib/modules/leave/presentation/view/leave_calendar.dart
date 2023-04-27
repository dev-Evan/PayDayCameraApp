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
    _resetSelectedDate();
    lastDayOfMonth = DateTime(now.year, now.month + 1, now.day);
  }
  late DateTime _selectedDate;

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 148.0,
        title: Column(
          children: [
            CalendarTimeline(
              showYears: true,
              initialDate: DateTime(now.year, now.month, now.day),
              firstDate: DateTime(now.year-5, now.month-5, now.day-5),
              lastDate: DateTime(2050, 11, 20),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.blueGrey,
              dayColor: Colors.teal[200],
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.redAccent[100],
              dotsColor: const Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en_ISO',
            )


            // Row(
            //   children: const [
            //     Icon(
            //       Icons.arrow_back_ios,
            //       color: AppColor.primaryColor,
            //     ),
            //     // Expanded(
            //     //     child: Text(DateTime.april.toString(),
            //     //         textAlign: TextAlign.center,
            //     //         style: TextStyle(
            //     //           color: Colors.black,
            //     //         ))),
            //     Spacer(),
            //
            //     Icon(
            //       Icons.arrow_forward_ios,
            //       color: AppColor.primaryColor,
            //     ),
            //
            //
            //   ],
            // ),
            // const SizedBox(height: 16.0),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   physics: const ClampingScrollPhysics(),
            //   child: Row(
            //     children: List.generate(
            //       lastDayOfMonth.day,
            //           (index) {
            //         final currentDate =
            //         lastDayOfMonth.add(Duration(days: index + 1));
            //         final dayName = DateFormat('E').format(currentDate);
            //         return Padding(
            //           padding: EdgeInsets.only(
            //               left: index == 0 ? 16.0 : 0.0, right: 16.0),
            //           child: GestureDetector(
            //             onTap: () => setState(() {
            //               selectedIndex = index;
            //             }),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Container(
            //                   height: 70.0,
            //                   width: 60.0,
            //                   alignment: Alignment.center,
            //                   decoration: BoxDecoration(
            //                     color: selectedIndex == index
            //                         ? Colors.orange
            //                         : Colors.transparent,
            //                     borderRadius: BorderRadius.circular(8.0),
            //                   ),
            //                   child: Column(
            //                     children: [
            //                       Text(
            //                         "${index + 1}",
            //                         style: const TextStyle(
            //                           fontSize: 16.0,
            //                           color: Colors.black54,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //                       ),
            //                       Text(
            //                         dayName.substring(0, 1),
            //                         style: TextStyle(
            //                           fontSize: 16.0,
            //                           color: selectedIndex == index
            //                               ? Colors.white
            //                               : Colors.black54,
            //                           fontWeight: FontWeight.w500,
            //                         ),
            //                       ),
            //
            //                       // Container(
            //                       //   height: 2.0,
            //                       //   width: 28.0,
            //                       //   color: selectedIndex == index
            //                       //       ? Colors.orange
            //                       //       : Colors.transparent,
            //                       // ),
            //                     ],
            //                   ),
            //                 ),
            //                 const SizedBox(height: 8.0),
            //
            //                 const SizedBox(height: 8.0),
            //
            //               ],
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
