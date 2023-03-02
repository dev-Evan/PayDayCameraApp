import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/map_layout.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import '../../../../common/custom_app_button.dart';
import '../../../../utils/dimensions.dart';
import '../widget/timer_overview_layout.dart';

import '../../../../utils/app_layout.dart';
import '../widget/bottom_sheet_appbar.dart';
import '../widget/vertical_divider.dart';

Widget logEntryBottomSheet() {
  return DraggableScrollableSheet(
    initialChildSize: .8,
    maxChildSize: .8,
    builder: (BuildContext context, ScrollController scrollController) =>
        Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      child: ListView(
        controller: scrollController,
        children: [
          bottomSheetAppbar(context),
          Divider(color: Colors.grey.shade200, thickness: 1),
          _contentLayout(),
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
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _timeLayout(),
      SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
      _noteLayout(),
      SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
      _mapLayout(),
      SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
      _currentLocation(),
      SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
      _deviceIP(),
      SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
      _buttonLayout(Get.context!),
    ]),
  );
}

Widget _mapLayout() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
    width: double.infinity,
    height: AppLayout.getHeight(168),
    child: const MapSample(),
  );
}

_noteLayout() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _noteText(),
      SizedBox(height: AppLayout.getHeight(Dimensions.paddingDefault)),
      _inputNote()
    ],
  );
}

_noteText() {
  return Text(
    AppString.note_text,
    style: AppStyle.normal_text
        .copyWith(color: Colors.grey, fontWeight: FontWeight.w600),
  );
}

_inputNote() {
  return TextField(
    keyboardType: TextInputType.multiline,
    decoration: InputDecoration(
        hintText: "Add Note Here",
        hintStyle: AppStyle.normal_text
            .copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
        isDense: true,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey))),
    maxLines: 5,
    minLines: 3,
  );
}

_timeLayout() {
  return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _inTimeLog(),
        const Spacer(),
        verticalDivider(dividerColor: AppColor.grey_drak),
        const Spacer(),
        _outTimeLog(),
        const Spacer(),
        verticalDivider(dividerColor: AppColor.grey_drak),
        const Spacer(),
        _totalTimeLog(),
      ]);
}

_inTimeLog() {
  return logInfo(title: AppString.text_in, time: "", fontColor: Colors.black);
}

_outTimeLog() {
  return logInfo(title: AppString.text_out, time: "", fontColor: Colors.black);
}

_totalTimeLog() {
  return logInfo(
      title: AppString.text_total, time: "", fontColor: Colors.black);
}

_currentLocation() {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.1),
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(4),
            vertical: AppLayout.getHeight(4)),
        child: const Icon(
          Icons.my_location,
          color: Colors.blueAccent,
        ),
      ),
      SizedBox(
        width: AppLayout.getWidth(8),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data",
            style: AppStyle.normal_text_black
                .copyWith(fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'My Location',
            style: AppStyle.small_text
                .copyWith(fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ],
      ),
    ],
  );
}

_deviceIP() {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.1),
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(4),
            vertical: AppLayout.getHeight(4)),
        child: const Icon(
          Icons.location_on_outlined,
          color: Colors.blueAccent,
        ),
      ),
      SizedBox(
        width: AppLayout.getWidth(8),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data",
            style: AppStyle.normal_text_black
                .copyWith(fontWeight: FontWeight.w400),
          ),
          Text(
            'IP Address',
            style: AppStyle.small_text
                .copyWith(fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ],
      ),
    ],
  );
}

_buttonLayout(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _cancelButton(),
      SizedBox(width: AppLayout.getWidth(10)),
      _punchButton(),
    ],
  );
}

_punchButton() {
  return AppButton(
    buttonColor: AppColor.primary_blue,
    buttonText: "Punch In",
    onPressed: () {},
  );
}

_cancelButton() {
  return AppButton(
    buttonText: AppString.text_cancel,
    onPressed: () {},
    buttonColor: Colors.transparent,
    hasOutline: true,
    borderColor: Colors.black,
    textColor: Colors.black,
  );
}
