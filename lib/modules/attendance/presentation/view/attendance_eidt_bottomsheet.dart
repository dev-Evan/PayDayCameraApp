import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_time_in_time_picker.dart';
import 'package:pay_day_mobile/modules/attendance/domain/change_request/change_request_req_model.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import '../../../../common/controller/date_time_helper_controller.dart';
import '../../../../common/widget/custom_time_picker.dart';
import '../../../../common/widget/input_note.dart';
import '../../../../utils/time_counter_helper.dart';
import '../../domain/log_details/log_details.dart';
import '../widget/bottom_sheet_appbar.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import '../../../../common/widget/custom_app_button.dart';

class EditAttendanceBottomSheet extends StatelessWidget {
  final LogDetails logDetailsById;

  const EditAttendanceBottomSheet(this.logDetailsById, {super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<DateTimeController>();
    var controller = Get.put(DateTimeController());
    controller.pickedInTime.value = logDetailsById.data!.inTime!;
    controller.pickedOutTime.value = logDetailsById.data!.outTime!;
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
    );
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
          _noteLayout(),
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
          logDetailsById.data?.inDate ?? "",
          style: AppStyle.extra_large_text_black
              .copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          logDetailsById.data?.punchInStatus ?? "",
          style: AppStyle.normal_text_black
              .copyWith(fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }

  _entryBehaviour() {
    return Text(
      TimeCounterHelper.getTimeStringFromDouble(
          logDetailsById.data!.totalHours.toDouble()),
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

  _noteLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.text_note,
          style: AppStyle.normal_text_black
              .copyWith(color: Colors.grey, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: AppLayout.getHeight(Dimensions.paddingDefault)),
        InputNote(
            controller: Get.find<DateTimeController>().textEditingController),
      ],
    );
  }
}

_saveButton() {
  return AppButton(
    buttonColor: AppColor.primaryBlue,
    buttonText: AppString.text_save,
    onPressed: () async {
      await Get.find<AttendanceController>().changeAttendance(
          Get.find<AttendanceController>().logDetailsById.data!.id!,
          ChangeRequestReqModel(
              inTime: Get.find<DateTimeController>().pickedInTime.value,
              outTime: Get.find<DateTimeController>().pickedOutTime.value,
              note: Get.find<DateTimeController>().textEditingController.text));
      Navigator.of(Get.context!).pop();
    },
  );
}

_cancelButton(BuildContext context) {
  return AppButton(
    onPressed: () => Navigator.of(context).pop(),
    buttonText: AppString.text_cancel,
    buttonColor: Colors.transparent,
    hasOutline: true,
    borderColor: Colors.black,
    textColor: Colors.black,
  );
}
