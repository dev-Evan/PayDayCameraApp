import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/controller/date_time_helper_controller.dart';
import 'package:pay_day_mobile/common/widget/custom_time_in_time_picker.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/single_date_picker_calendar.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import '../../../../common/widget/custom_app_button.dart';
import '../../../../common/widget/custom_time_picker.dart';
import '../../../../common/widget/input_note.dart';
import '../../../../common/widget/note_layout.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimensions.dart';
import '../widget/bottom_sheet_appbar.dart';

class RequestAttendanceBottomSheet extends GetView<AttendanceLogsController> {
  const RequestAttendanceBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.delete<DateTimeController>();
    Get.put(DateTimeController());
    return DraggableScrollableSheet(
      initialChildSize: .8,
      maxChildSize: .8,
      minChildSize: .5,
      builder: (BuildContext context, ScrollController scrollController) =>
          Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        child: Stack(
          children: [
            ListView(
              controller: scrollController,
              children: [
                bottomSheetAppbar(
                    context: context,
                    appbarTitle: AppString.text_request_attendance),
                SizedBox(
                  height: AppLayout.getHeight(Dimensions.paddingLarge),
                ),
                _contentLayout(context),
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
    );
  }

  _contentLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(Dimensions.paddingLarge),
          horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _dateEntry(),
          SizedBox(height: AppLayout.getHeight(24)),
          _timeLayout(),
          SizedBox(height: AppLayout.getHeight(24)),
          noteLayout(),
        ],
      ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _cancelButton(context),
          SizedBox(width: AppLayout.getWidth(10)),
          _requestButton(context),
        ],
      ),
    );
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
          Get.find<AttendanceLogsController>().requestAttendance();
          Navigator.pop(Get.context!);
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

  _dateEntry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.text_date,
          style: AppStyle.normal_text_grey,
        ),
        SizedBox(
          height: AppLayout.getHeight(Dimensions.radiusDefault),
        ),
        Obx(() => _dateInputField(Get.context!))
      ],
    );
  }

  _dateInputField(BuildContext context) {
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
                controller.requestedDate.value.isEmpty
                    ? AppString.text_select_date
                    : controller.requestedDate.value,
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
      onTap: () => _showCalendar(),
    );
  }

  Future _showCalendar() {
    return showDialog(
      context: Get.context!,
      builder: (context) {
        return const Dialog(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            insetPadding: EdgeInsets.zero,
            child: SingleDatePicker());
      },
    );
  }

  _timeLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _inTimeEntry(),
        SizedBox(width: AppLayout.getWidth(Dimensions.paddingDefaultMid)),
        _outTimeEntry(),
      ],
    );
  }

  _inTimeEntry() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppString.text_in_time,
              style: AppStyle.normal_text
                  .copyWith(color: Colors.grey, fontWeight: FontWeight.w600)),
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingDefault)),
          const CustomTimeInTimePicker(),
        ],
      ),
    );
  }

  _outTimeEntry() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppString.text_out_time,
              style: AppStyle.normal_text
                  .copyWith(color: Colors.grey, fontWeight: FontWeight.w600)),
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingDefault)),
          const CustomOutTimePicker(),
        ],
      ),
    );
  }

}
