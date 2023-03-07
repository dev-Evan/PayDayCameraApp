import 'package:flutter/material.dart';

import '../../../../common/custom_time_picker.dart';
import '../widget/bottom_sheet_appbar.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import '../../../../common/custom_app_button.dart';

class EditAttendanceBottomSheet extends StatelessWidget {
  const EditAttendanceBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          "20-01-23",
          style: AppStyle.extra_large_text_black
              .copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          "Auto",
          style: AppStyle.normal_text_black
              .copyWith(fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }

  _entryBehaviour() {
    return Text(
      "8h 10m",
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
          CustomTimePicker(),
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
          CustomTimePicker(),
        ],
      ),
    );
  }
}

_saveButton() {
  return AppButton(
    buttonColor: AppColor.primary_blue,
    buttonText: AppString.text_save,
    onPressed: () {},
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
