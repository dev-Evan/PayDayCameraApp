import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_time_in_time_picker.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
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
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: .9,
        maxChildSize: .9,
        minChildSize: .7,
        builder: (BuildContext context, ScrollController scrollController) {
          Get.find<DateTimeController>().pickedInTime.value =
              widget.logDetailsById.data!.checkInTime!;
          Get.find<DateTimeController>().pickedOutTime.value =
              widget.logDetailsById.data!.checkOutTime!;
          return Container(
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
          );
        });
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
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
          _timeLayout(),
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
        _logDate(),
        _entryBehaviour(),
      ],
    );
  }

  _logDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.logDetailsById.data?.inDate ?? "",
          style: AppStyle.extra_large_text_black
              .copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          widget.logDetailsById.data?.punchInStatus ?? "",
          style: AppStyle.normal_text_black
              .copyWith(fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _cancelButton(context),
          SizedBox(width: AppLayout.getWidth(10)),
          _saveButton(),
        ],
      ),
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

  _note() {
    return TextField(
      onChanged: (value) {
        setState(() {
          inputValue = value;
        });
      },
      decoration: InputDecoration(
          hintText: AppString.text_add_note_here,
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
    print(inputValue);
    return AppButton(
      buttonColor: AppColor.primaryBlue,
      buttonText: AppString.text_save,
      onPressed: () async {
        await Get.find<AttendanceController>()
            .changeAttendance(
                logId:
                    Get.find<AttendanceController>().logDetailsById.data!.id!,
                inTime: Get.find<DateTimeController>().pickedInTime.value,
                outTime: Get.find<DateTimeController>().pickedOutTime.value,
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
}
