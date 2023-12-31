import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/controller/date_time_helper_controller.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_time_in_time_picker.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import '../../../../common/widget/custom_app_button.dart';
import '../../../../common/widget/custom_time_picker.dart';
import '../../../../common/widget/loading_indicator.dart';
import '../../../../common/widget/note_layout.dart';
import '../../../../common/widget/success_message.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimensions.dart';
import '../widget/bottom_sheet_appbar.dart';
import '../widget/single_date_picker_calendar.dart';
import 'attendance_eidt_bottomsheet.dart';

class RequestAttendanceBottomSheet extends GetView<AttendanceLogsController> {
  const RequestAttendanceBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      child: Column(
        children: [
          bottomSheetAppbar(
              context: context, appbarTitle: AppString.text_request_attendance),
          _contentLayout(context),
          const Spacer(),
          _buttonLayout(context),
        ],
      ),
    );
  }

  _contentLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppLayout.getHeight(Dimensions.paddingLarge),
            horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _inTimeDetails(),
            customSpacerHeight(height: 20),
            _outTimeDetails(),
            customSpacerHeight(height: 20),
            noteLayout(),
            customSpacerHeight(height: 70)
          ],
        ),
      ),
    );
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
            child:
                EditAttendanceSingleDatePicker(isInDatePicker: isInDatePicker));
      },
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
        child: Obx(
          () => Get.find<AttendanceLogsController>().isLoading.isTrue
              ? loadingIndicatorLayout()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cancelButton(context),
                    SizedBox(width: AppLayout.getWidth(10)),
                    _requestButton(context),
                  ],
                ),
        ));
  }

  _requestButton(BuildContext context) {
    Get.find<AttendanceLogsController>().textEditingController.clear();
    var controller = Get.find<DateTimeController>();
    return AppButton(
      buttonColor: AppColor.primaryBlue,
      buttonText: AppString.text_request,
      onPressed: () {
        if (controller.requestedDate.isNotEmpty &&
            controller.pickedInTime.isNotEmpty &&
            controller.pickedOutTime.isNotEmpty) {
          Get.find<AttendanceLogsController>()
              .requestAttendance()
              .then((value) {
            if (value == true) {
              Navigator.pop(Get.context!);
              showSuccessMessage(
                  message: AppString.text_attendance_request_successfully);
            }
          });
        } else {
          Get.showSnackbar(const GetSnackBar(
            message: "Select a valid input before request a attendance",
            duration: Duration(seconds: 2),
            dismissDirection: DismissDirection.down,
          ));
        }
      },
    );
  }

  _cancelButton(BuildContext context) {
    Get.find<AttendanceLogsController>().textEditingController.clear();
    return AppButton(
      buttonText: AppString.text_cancel,
      onPressed: () => Navigator.of(context).pop(),
      buttonColor: Colors.transparent,
      hasOutline: true,
      borderColor: Colors.black,
      textColor: Colors.black,
    );
  }
}
