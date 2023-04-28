import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/custom_divider.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/enum/range_calendar_method_imp.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:table_calendar/table_calendar.dart';

import 'bottom_sheet_appbar.dart';

class SelectRangeCalender extends StatefulWidget {
  RangeCalendarMethodImp rangeCalendarMethodImp;

  SelectRangeCalender({required this.rangeCalendarMethodImp, super.key});

  @override
  State<SelectRangeCalender> createState() => _SelectRangeCalenderState();
}

class _SelectRangeCalenderState extends State<SelectRangeCalender> {
  DateTime today = DateTime.now();
  final firstDate = DateTime.utc(2012);
  final lastDate = DateTime.utc(2040);
  DateTime? _rangeEndDate;
  DateTime? _rangeStartDay;
  bool isStartDaySelected = false;

  List dateTime = [
    AppString.text_today,
    AppString.text_this_week,
    AppString.text_last_week,
    AppString.text_last_month,
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TableCalendar(
                    locale: "en_US",
                    rowHeight: 43,
                    rangeStartDay: _rangeStartDay,
                    rangeEndDay: _rangeEndDate,
                    availableGestures: AvailableGestures.all,
                    firstDay: firstDate,
                    lastDay: lastDate,
                    focusedDay: today,
                    calendarStyle: CalendarStyle(
                        selectedDecoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primary_blue),
                        todayDecoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.transparent),
                        todayTextStyle: AppStyle.normal_text_black),
                    headerStyle: HeaderStyle(
                        titleTextStyle: AppStyle.normal_text.copyWith(
                            color: AppColor.primary_blue,
                            fontWeight: FontWeight.bold),
                        titleCentered: true,
                        formatButtonVisible: false),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        if (_rangeStartDay == null) {
                          _rangeStartDay = selectedDay;
                          isStartDaySelected = true;
                        }
                        if (_rangeStartDay != null &&
                            isStartDaySelected == true) {
                          _rangeEndDate = selectedDay;
                        }
                      });
                    },
                    // selectedDayPredicate: (day) => isSameDay(day, today),
                  ),
                  // const Spacer(),
                  Row(
                    children: [
                      Expanded(child: _dateRangeFromText()),
                      const Text('  -  '),
                      Expanded(child: _dateRangeToText()),
                    ],
                  ),
                  // const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                    child:
                        CustomDiveider(0.7, MediaQuery.of(context).size.width),
                  ),

                  SizedBox(
                    height: AppLayout.getHeight(56),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: dateTime.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Card(
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
                          ),
                          onTap: () {
                            switch (index) {
                              case 0:
                                {
                                  setState(() {
                                    _rangeStartDay = today;
                                    _rangeEndDate = today;
                                  });
                                  break;
                                }
                              case 1:
                                {
                                  setState(() {
                                    _rangeStartDay = getDate(today.subtract(
                                        Duration(days: today.weekday - 1)));
                                    _rangeEndDate = getDate(today.add(Duration(
                                        days: DateTime.daysPerWeek -
                                            today.weekday)));
                                  });
                                }
                                break;
                              case 2:
                                setState(() {
                                  _rangeStartDay = getDate(today.subtract(
                                      Duration(days: today.weekday + 6)));
                                  _rangeEndDate = getDate(today.add(Duration(
                                      days: DateTime.daysPerWeek -
                                          7 -
                                          today.weekday)));
                                });
                                break;
                              case 3:
                                setState(() {
                                  _rangeStartDay = DateTime.utc(
                                      today.year, today.month - 1, 1);
                                  _rangeEndDate =
                                      DateTime.utc(today.year, today.month, 0);
                                });
                                break;
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // const Spacer(),
        customDoubleButton(
            context: context,
            textBtnText: 'Clear',
            textButtonAction: () {
              setState(() {
                _rangeStartDay = null;
                _rangeEndDate = null;
              });
            },
            elevatedBtnText: 'Apply',
            elevatedButtonAction: () {
              print(
                  "start ::: ${DateFormat("yyyy-MM-dd").format(_rangeStartDay!)} End ::: ${DateFormat("yyyy-MM-dd").format(_rangeEndDate!)}");
              switch (widget.rangeCalendarMethodImp) {
                case RangeCalendarMethodImp.ALL_LOG:
                  if (_rangeStartDay != null && _rangeEndDate != null) {
                    Map<String, String> queryParams = {
                      'start': DateFormat("yyyy-MM-dd").format(_rangeStartDay!),
                      'end': DateFormat("yyyy-MM-dd").format(_rangeEndDate!)
                    };
                    String v = json.encode(queryParams);
                    Get.find<AttendanceLogsController>()
                        .getAllFilteredLogSummary(queryParams: "date=$v");
                  }
                  Navigator.pop(Get.context!);
                  break;
                case RangeCalendarMethodImp.LOG_SUMMARY:
                  if (_rangeStartDay != null && _rangeEndDate != null) {
                    Map<String, String> queryParams = {
                      'start': DateFormat("yyyy-MM-dd").format(_rangeStartDay!),
                      'end': DateFormat("yyyy-MM-dd").format(_rangeEndDate!)
                    };
                    String v = json.encode(queryParams);
                    Get.find<AttendanceLogsController>()
                        .getLogSummaryOverview(queryParams: "time_range=$v");
                  }
                  Navigator.pop(Get.context!);
                  break;
                case RangeCalendarMethodImp.VIEW_HOLIDAY:
                  // TODO: Handle this case.
                  break;
                case RangeCalendarMethodImp.PAYSLIP:
                  // TODO: Handle this case.
                  break;
                case RangeCalendarMethodImp.LEAVE_RECORD:
                  // TODO: Handle this case.
                  break;
              }
            })
      ],
    );
  }

  _dateRangeFromText() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withOpacity(0.25), width: .5),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(16),
              vertical: AppLayout.getHeight(16)),
          child: Text(_rangeStartDay != null
              ? DateFormat('yMMMMd').format(_rangeStartDay!)
              : "From")),
    );
  }

  _dateRangeToText() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withOpacity(0.25), width: .5),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(16),
              vertical: AppLayout.getHeight(16)),
          child: Text(_rangeEndDate != null
              ? DateFormat('yMMMMd').format(_rangeEndDate!)
              : "To")),
    );
  }
}

DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);
