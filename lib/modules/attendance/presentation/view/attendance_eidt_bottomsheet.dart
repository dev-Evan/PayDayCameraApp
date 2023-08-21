import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_time_in_time_picker.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../common/controller/date_time_helper_controller.dart';
import '../../../../common/widget/custom_time_picker.dart';
import '../../../../utils/time_counter_helper.dart';
import '../../domain/log_details/log_details.dart';
import '../widget/bottom_sheet_appbar.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import '../../../../common/widget/custom_app_button.dart';

class EditAttendanceBottomSheet extends StatefulWidget {
  final LogDetails logDetailsById;

  const EditAttendanceBottomSheet(this.logDetailsById, {super.key});

  @override
  State<EditAttendanceBottomSheet> createState() =>
      _EditAttendanceBottomSheetState();
}

class _EditAttendanceBottomSheetState extends State<EditAttendanceBottomSheet> {
  String inputValue = '';

  var controller = TextEditingController();

  @override
  void initState() {
    if (Get.isRegistered<DateTimeController>()) {
      Get.delete<DateTimeController>();
    }
    Get.put(DateTimeController());
    //store in date value
    Get.find<DateTimeController>().requestedInDate.value =
        _getDate(widget.logDetailsById.data!.inDate ?? '');
    //store out date value
    Get.find<DateTimeController>().requestedOutDate.value =
        _getDate(widget.logDetailsById.data!.logDate ?? '');
    //store in time value
    Get.find<DateTimeController>().pickedInTime.value =
        widget.logDetailsById.data!.checkInTime!;
    //store out time value
    Get.find<DateTimeController>().pickedOutTime.value =
        widget.logDetailsById.data!.checkOutTime!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Get.find<AttendanceController>().obx(
        (state) => Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16))),
              child: Stack(
                children: [
                  Column(
                    children: [
                      bottomSheetAppbar(
                          context: context,
                          appbarTitle: AppString.text_edit_attendance),
                      _contentLayout(),
                      SizedBox(
                        height: AppLayout.getHeight(60),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: _buttonLayout(context),
                  )
                ],
              ),
            ),
        onLoading: const LoadingIndicator());
  }

  _contentLayout() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(Dimensions.paddingLarge),
          horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topLayout(),
          customSpacerHeight(height: 20),
          _inTimeDetails(),
          customSpacerHeight(height: 20),
          _outTimeDetails(),
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
          _note(),
        ],
      ),
    );
  }

  _topLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Entry Type : ${widget.logDetailsById.data?.punchInStatus}",
          style: AppStyle.normal_text_black
              .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        _entryBehaviour(),
      ],
    );
  }

  _dateEntry(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.normal_text_grey,
        ),
        SizedBox(
          height: AppLayout.getHeight(Dimensions.radiusDefault),
        ),
        Obx(() => _dateInputField(
            Get.context!, title.startsWith("In Time Date") ? true : false))
      ],
    );
  }

  _dateInputField(BuildContext context, bool inInDate) {
    DateTimeController controller = Get.find<DateTimeController>();
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          border: Border.all(color: AppColor.lightGrey, width: 1),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(Dimensions.paddingDefaultExtra),
          vertical: AppLayout.getHeight(Dimensions.paddingDefault),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                inInDate == true
                    ? (controller.requestedInDate.value.isEmpty
                        ? AppString.text_select_date
                        : controller.requestedInDate.value)
                    : (controller.requestedOutDate.value.isEmpty
                        ? AppString.text_select_date
                        : controller.requestedOutDate.value),
                style: controller.requestedDate.value.isNotEmpty
                    ? AppStyle.normal_text_black
                        .copyWith(fontWeight: FontWeight.w400)
                    : AppStyle.normal_text_grey
                        .copyWith(fontWeight: FontWeight.w400),
              ),
              Icon(
                Icons.calendar_today_outlined,
                size: AppLayout.getWidth(16),
              )
            ]),
      ),
      onTap: () => _showCalendar(inInDate),
    );
  }

  Future _showCalendar(bool isInDatePicker) {
    return showDialog(
      context: Get.context!,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            insetPadding: EdgeInsets.zero,
            child: EditAttendanceSingleDatePicker(isInDatePicker: isInDatePicker));
      },
    );
  }

  _entryBehaviour() {
    return Text(
      TimeCounterHelper.getTimeStringFromDouble(
          widget.logDetailsById.data!.totalHours.toDouble()),
      style: AppStyle.normal_text_black.copyWith(fontWeight: FontWeight.w400),
    );
  }

  _buttonLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppLayout.getWidth(Dimensions.paddingLarge),
        right: AppLayout.getWidth(Dimensions.paddingLarge),
        bottom: AppLayout.getHeight(Dimensions.paddingLarge),
      ),
      color: Colors.white,
      child: Obx(() => Get.find<AttendanceController>().isLoading.isTrue
          ? loadingIndicatorLayout()
          : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              _cancelButton(context),
              SizedBox(width: AppLayout.getWidth(10)),
              _saveButton()
            ])),
    );
  }

  _inTimeEntry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppString.text_in_time,
            style: AppStyle.normal_text
                .copyWith(color: Colors.grey, fontWeight: FontWeight.w600)),
        SizedBox(height: AppLayout.getHeight(Dimensions.paddingDefault)),
        const CustomTimeInTimePicker(),
      ],
    );
  }

  _outTimeEntry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppString.text_out_time,
            style: AppStyle.normal_text
                .copyWith(color: Colors.grey, fontWeight: FontWeight.w600)),
        SizedBox(height: AppLayout.getHeight(Dimensions.paddingDefault)),
        const CustomOutTimePicker(),
      ],
    );
  }

  _note() {
    return TextField(
      onChanged: (value) {
        setState(() {
          inputValue = value;
        });
      },
      decoration: InputDecoration(
          hintText: AppString.text_edit_text_hint,
          hintStyle: AppStyle.normal_text
              .copyWith(color: AppColor.solidGray, fontWeight: FontWeight.w400),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.solidGray),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.solidGray))),
      maxLines: 5,
      minLines: 3,
    );
  }

  _saveButton() {
    return AppButton(
      buttonColor: AppColor.primaryBlue,
      buttonText: AppString.text_save,
      onPressed: () async {
        await Get.find<AttendanceController>()
            .changeAttendance(
                logId:
                    Get.find<AttendanceController>().logDetailsById.data!.id!,
                inTime:
                    "${DateFormat("yyyy-MM-dd hh:mm a").parse("${Get.find<DateTimeController>().requestedInDate.value} ${Get.find<DateTimeController>().pickedInTime.value}")}",
                outTime:
                    "${DateFormat("yyyy-MM-dd hh:mm a").parse("${Get.find<DateTimeController>().requestedOutDate.value} ${Get.find<DateTimeController>().pickedOutTime.value}")}",
                note: inputValue)
            .then((value) {
          if (value == true) {
            Navigator.of(Get.context!).pop();
          }
        });
      },
    );
  }

  _cancelButton(BuildContext context) {
    Get.find<AttendanceLogsController>().textEditingController.clear();
    return AppButton(
      onPressed: () => Navigator.of(context).pop(),
      buttonText: AppString.text_cancel,
      buttonColor: Colors.transparent,
      hasOutline: true,
      borderColor: Colors.black,
      textColor: Colors.black,
    );
  }

  String _getDate(String inDate) {
    try {
      DateFormat inputFormat = DateFormat('dd MMM yyyy');
      DateFormat outputFormat = DateFormat('yyyy-MM-dd');

      DateTime dateTime = inputFormat.parse(inDate);
      String convertedDate = outputFormat.format(dateTime);
      return convertedDate;
    } catch (e) {
      return "";
    }
  }

  _inTimeDetails() {
    return Row(
      children: [
        Expanded(child: _dateEntry("In Time Date")),
        customSpacerWidth(width: 10),
        Expanded(child: _inTimeEntry())
      ],
    );
  }

  _outTimeDetails() {
    return Row(
      children: [
        Expanded(child: _dateEntry("Out Time Date")),
        customSpacerWidth(width: 10),
        Expanded(child: _outTimeEntry())
      ],
    );
  }
}

class EditAttendanceSingleDatePicker extends StatefulWidget {
  bool isInDatePicker;

  EditAttendanceSingleDatePicker({required this.isInDatePicker, Key? key})
      : super(key: key);

  @override
  State<EditAttendanceSingleDatePicker> createState() =>
      _EditAttendanceSingleDatePicker();
}

class _EditAttendanceSingleDatePicker
    extends State<EditAttendanceSingleDatePicker> {
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
                widget.isInDatePicker
                    ? Get.find<DateTimeController>().requestedInDate.value =
                        DateFormat('yyyy-MM-dd').format(today)
                    : Get.find<DateTimeController>().requestedOutDate.value =
                        DateFormat('yyyy-MM-dd').format(today);
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
