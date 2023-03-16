import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_navigator.dart';
import 'package:pay_day_mobile/common/custom_status_button.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/view_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/calender_holiday_title.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/view_holiday.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/custom_divider.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/images.dart';
import '../../../attendance/presentation/widget/selected_range_calender.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime today = DateTime.now();
  final firstDate = DateTime.utc(2012);
  final lastDate = DateTime.utc(2040);
  DateTime _focusedDay = DateTime.now();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDate;




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: const CustomAppbar(),
      body: Container(

        child: ListView.builder(
          itemCount: 1,


          itemBuilder: (context, index){

          return SingleChildScrollView(
            child: Column(
              children: [
                customMoreAppbar(titleText: AppString.text_caleder),
                TableCalendar(
                  locale: "en_US",
                  rowHeight: 43,
                  rangeSelectionMode: RangeSelectionMode.toggledOn,
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  availableGestures: AvailableGestures.all,
                  firstDay: firstDate,
                  lastDay: lastDate,
                  focusedDay: today,
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDate, selectedDay)) {
                      setState(() {
                        _selectedDate = selectedDay;
                        _focusedDay = focusedDay;
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
                  calendarFormat: CalendarFormat.month,
                ),
                holyDayTitle(AllHolidayAction: ()=>CustomNavigator(context: context,pageName: const ViewHoliday() )),
                holidaysList()
              ],
            ),
          );
        },)



      ),










    );
  }
}

Widget holidaysList() {
  return ListView.builder(
    itemCount: 33,
    shrinkWrap: true,

    //physics: ClampingScrollPhysics(),

    physics:  const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0,left: 20,right: 20),
        child: Column(
          children: [
            Card(
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "10",
                        style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.normalTextColor,
                            fontSize: Dimensions.fontSizeExtraLarge,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "Dec",
                        style: AppStyle.small_text.copyWith(
                            color: AppColor.hintColor,
                            fontSize: Dimensions.fontSizeSmall),
                      ),
                    ],
                  ),
                  CustomDiveider(25, 1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Martyrs' day",
                        style: AppStyle.mid_large_text.copyWith(
                          color: AppColor.secondaryColor,
                          fontSize: Dimensions.fontSizeDefault + 2,
                        ),
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(6),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: AppColor.hintColor.withOpacity(0.6),
                            size: Dimensions.fontSizeDefault + 2,
                          ),
                          SizedBox(
                            width: AppLayout.getWidth(3),
                          ),
                          Text(
                            "9h",
                            style: AppStyle.mid_large_text.copyWith(
                                color: AppColor.hintColor.withOpacity(0.7),
                                fontSize: Dimensions.fontSizeDefault + 2,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: AppLayout.getWidth(12),
                          ),

                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                      backgroundColor: AppColor.backgroundColor.withOpacity(0.2),
                      radius: 14,
                      child: const Icon(
                        Icons.done,
                        color: AppColor.primaryColor,
                        size: 16,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: CustomDiveider(
                  AppLayout.getHeight(0.6), MediaQuery.of(context).size.width),
            )
          ],
        ),
      );
    },
  );
}
