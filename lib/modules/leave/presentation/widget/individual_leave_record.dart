import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/leave_details.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/widget/custom_spacer.dart';
import '../../../../common/widget/custom_buttom_sheet.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/images.dart';

Widget individualDateLeaveRecord() => Container(
      color: AppColor.backgroundColor,
      child: Column(
        children: [
          const HorizontalCalendar(),
          Obx(() => Get.find<LeaveController>().isValueLoading.isTrue
              ? const CircularProgressIndicator()
              : Get.find<LeaveController>()
                          .individualDateLeaveList
                          .value
                          .data !=
                      null
                  ? (Get.find<LeaveController>()
                          .individualDateLeaveList
                          .value
                          .data!
                          .isNotEmpty
                      ? _individualDateLeaveRecordList()
                      : _noDataImg())
                  : _noDataImg())
          // ,
        ],
      ),
    );

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({Key? key}) : super(key: key);

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  DateTime today = DateTime.now();
  final firstDate = DateTime.utc(2012);
  final lastDate = DateTime.utc(2040);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: "en_US",
      rowHeight: AppLayout.getHeight(70),
      availableGestures: AvailableGestures.all,
      firstDay: firstDate,
      lastDay: lastDate,
      focusedDay: today,
      calendarFormat: CalendarFormat.week,
      calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          outsideTextStyle: AppStyle.normal_text_black.copyWith(fontSize: 30),
          outsideDecoration: defaultTableDecoration,
          weekNumberTextStyle:
              AppStyle.normal_text_black.copyWith(fontSize: 30),
          weekendDecoration: defaultTableDecoration,
          disabledTextStyle: AppStyle.normal_text_black.copyWith(fontSize: 30),
          disabledDecoration: defaultTableDecoration,
          weekendTextStyle: AppStyle.normal_text_black.copyWith(fontSize: 30),
          withinRangeDecoration: defaultTableDecoration,
          holidayTextStyle: AppStyle.normal_text_black.copyWith(fontSize: 30),
          holidayDecoration: defaultTableDecoration,
          defaultTextStyle: AppStyle.normal_text_black.copyWith(fontSize: 30),
          defaultDecoration: defaultTableDecoration,
          selectedTextStyle: AppStyle.normal_text_black
              .copyWith(fontSize: 30, color: Colors.white),
          selectedDecoration:
              defaultTableDecoration.copyWith(color: AppColor.primary_blue),
          todayDecoration: const BoxDecoration(color: Colors.transparent),
          todayTextStyle: AppStyle.normal_text_black.copyWith(fontSize: 30)),
      onHeaderTapped: (focusedDay) {
        print(focusedDay);
      },
      headerStyle: HeaderStyle(
          titleTextStyle: AppStyle.normal_text.copyWith(
              fontSize: 24,
              color: AppColor.primary_blue,
              fontWeight: FontWeight.bold),
          titleCentered: true,
          formatButtonVisible: false),
      selectedDayPredicate: (day) => isSameDay(day, today),
      onDaySelected: (selectedDay, focusedDay) async {
        setState(() {
          today = selectedDay;
        });
        try {
          Map<String, String> queryParams = {
            "start": DateFormat("yyyy-MM-dd").format(selectedDay),
            "end": DateFormat("yyyy-MM-dd").format(selectedDay)
          };
          String value = json.encode(queryParams);
          Get.find<LeaveController>()
              .getIndividualLeaveList(queryParams: "date_range=$value");
        } catch (e) {
          print(e);
        }
      },
    );
  }
}

BoxDecoration defaultTableDecoration = BoxDecoration(
    shape: BoxShape.rectangle,
    border: Border.all(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(8)),
    color: Colors.transparent);

_individualDateLeaveRecordList() => Padding(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: Get.find<LeaveController>()
                .individualDateLeaveList
                .value
                .data
                ?.length ??
            0,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => InkWell(
          onTap: () async {
            customButtomSheet(
                context: Get.context!, height: 0.9, child: LeaveDetails());
            await Get.find<LeaveController>().getILeaveDetails(
                id: Get.find<LeaveController>()
                    .individualDateLeaveList
                    .value
                    .data![index]
                    .id!);
          },
          child: _listCard(index),
        ),
      ),
    );

_listCard(int index) => Padding(
      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      Get.find<LeaveController>()
                              .individualDateLeaveList
                              .value
                              .data?[index]
                              .leaveType ??
                          '',
                      style: AppStyle.large_text_black,
                    ),
                    customSpacerWidth(width: 8),
                    Image.asset(
                      Images.attachment_file,
                      height: AppLayout.getHeight(12),
                      width: AppLayout.getWidth(12),
                    )
                  ],
                ),
                customSpacerHeight(height: 6),
                Text(
                  Get.find<LeaveController>()
                          .individualDateLeaveList
                          .value
                          .data?[index]
                          .leaveDuration ??
                      '',
                  style: AppStyle.small_text_black,
                )
              ],
            ),
            CircleAvatar(
                radius: 14,
                backgroundColor: AppColor.hintColor.withOpacity(0.1),
                child: Icon(
                  CupertinoIcons.right_chevron,
                  size: 16,
                  color: AppColor.primaryColor.withOpacity(0.8),
                )),
          ],
        ),
        if (index ==
            Get.find<LeaveController>()
                    .individualDateLeaveList
                    .value
                    .data!
                    .length -
                1)
          customSpacerHeight(height: 80)
      ]),
    );

Widget _noDataImg() {
  return SizedBox(
    height: AppLayout.getHeight(120),
    child: Image.asset(
      Images.calendar,
      fit: BoxFit.fitHeight,
    ),
  );
}
