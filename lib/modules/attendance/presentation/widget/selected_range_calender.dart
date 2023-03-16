import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_divider.dart';
import 'package:pay_day_mobile/common/custom_double_button.dart';
import 'package:pay_day_mobile/common/text_field.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:table_calendar/table_calendar.dart';

import 'bottom_sheet_appbar.dart';

class SelectRangeCalender extends StatefulWidget {
  const SelectRangeCalender({super.key});

  @override
  State<SelectRangeCalender> createState() => _SelectRangeCalenderState();
}

class _SelectRangeCalenderState extends State<SelectRangeCalender> {
  final TextEditingController _formController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

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

  List dateTime = [
    "Today",
    "This Week",
    "Last Week",
    "Last Month",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bottomSheetAppbar(
            appbarTitle: AppString.text_select_time_range, context: context),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TableCalendar(
                  locale: "en_US",
                  rowHeight: 43,
                  rangeSelectionMode: RangeSelectionMode.toggledOn,
                  rangeStartDay: today,
                  rangeEndDay: _selectedDate,
                  // onRangeSelected: (_selectedDate, end, focusedDay) {
                  //
                  // },
                  headerStyle: const HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
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
                  // selectedDayPredicate: (day) {
                  //   return isSameDay(_selectedDate, day);
                  // },
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
                const Spacer(),
                Row(
                  children: [
                    Flexible(
                        child: CustomTextFeild(
                            hintText: 'Form',inputType:  TextInputType.text,controller:  _formController)),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Icon(Icons.minimize_outlined),
                    ),
                    Flexible(
                        child: CustomTextFeild(
                           hintText:  'To', inputType: TextInputType.text,controller:  _toController)),
                  ],
                ),
                const Spacer(),
                CustomDiveider(0.7, MediaQuery.of(context).size.width),
                const Spacer(),
                SizedBox(
                  height: AppLayout.getHeight(56),
                  child: ListView.builder(
                    itemCount: dateTime.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        color: Colors.grey.shade100,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                Dimensions.radiusDefault)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12, top: 8, bottom: 8),
                          child: Center(
                              child: Text(
                            dateTime[index],
                            style: AppStyle.mid_large_text.copyWith(
                                color: AppColor.normalTextColor,
                                fontSize: Dimensions.fontSizeDefault + 3),
                          )),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                customDoubleButton(
                    context: context,
                    textBtnText: 'Clear',
                    textButtonAction: () {},
                    elevatedBtnText: 'Apply',
                    elevatedButtonAction: () {})
              ],
            ),
          ),
        )
      ],
    );
  }
}
