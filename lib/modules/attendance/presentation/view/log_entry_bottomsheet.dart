import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/users_current_info_layout.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/map_layout.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import '../../../../common/custom_app_button.dart';
import '../../../../common/input_note.dart';
import '../../../../utils/dimensions.dart';
import '../widget/timer_overview_layout.dart';

import '../../../../utils/app_layout.dart';
import '../widget/bottom_sheet_appbar.dart';
import '../widget/vertical_divider.dart';

Widget logEntryBottomSheet() {
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
              bottomSheetAppbar(context: context),
              _contentLayout(),
              SizedBox(
                height: AppLayout.getHeight(60),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buttonLayout(context),
          ),
          // _noteLayout(),
          // _positionInfoLayout(context),
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
        _timeLayout(),
        SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
        _noteLayout(),
        SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
        _mapLayout(),
        SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
        UsersCurrentInfoLayout(
            title: AppString.text_my_location, data: "Pallabi,Dhaka"),
        SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
        UsersCurrentInfoLayout(
            title: AppString.text_ip_address, data: "10.233.12.244"),
      ],
    ),
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
      inputNote()
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

_buttonLayout(BuildContext context) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(
      left: AppLayout.getWidth(Dimensions.paddingLarge),
      right: AppLayout.getWidth(Dimensions.paddingLarge),
      bottom: AppLayout.getHeight(Dimensions.paddingLarge),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _cancelButton(context),
        SizedBox(width: AppLayout.getWidth(10)),
        _punchButton(),
      ],
    ),
  );
}

_punchButton() {
  return AppButton(
    buttonColor: AppColor.primary_blue,
    buttonText: "Punch In",
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
