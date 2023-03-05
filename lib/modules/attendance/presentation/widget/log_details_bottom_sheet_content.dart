import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/timer_overview_layout.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/vertical_divider.dart';

import '../../../../common/custom_status_button.dart';
import '../../../../common/users_current_info_layout.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';

Widget contentLayout() {
  return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(Dimensions.paddingLarge),
          horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topLayout(),
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
          _logTimeLayout(),
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
          _punchInDetails(),
          SizedBox(height: AppLayout.getHeight(48)),
          _punchOutDetails(),
        ],
      ));
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
        style: AppStyle.large_text_black.copyWith(fontWeight: FontWeight.w600),
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
  return const CustomStatusButton(
      bgColor: Colors.green, text: "Regular", textColor: Colors.white);
}

_logTimeLayout() {
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

_punchInDetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      punchDetails(
          title: AppString.text_punch_in,
          note: "Late entry because of heavy traffic jam"),
      SizedBox(height: AppLayout.getHeight(Dimensions.paddingExtraLarge)),
      UsersCurrentInfoLayout(
          title: AppString.text_my_location, data: "Pallabi,Dhaka"),
      SizedBox(height: AppLayout.getHeight(Dimensions.paddingMid)),
      UsersCurrentInfoLayout(
          title: AppString.text_ip_address, data: "10.233.12.244"),
    ],
  );
}

_punchOutDetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      punchDetails(
          title: AppString.text_punch_out,
          note: "Late entry because of heavy traffic jam"),
      SizedBox(height: AppLayout.getHeight(Dimensions.paddingExtraLarge)),
      UsersCurrentInfoLayout(
          title: AppString.text_my_location, data: "Pallabi,Dhaka"),
      SizedBox(height: AppLayout.getHeight(Dimensions.paddingMid)),
      UsersCurrentInfoLayout(
          title: AppString.text_ip_address, data: "10.233.12.244"),
    ],
  );
}

punchDetails({required String title, String? note}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppStyle.large_text_black,
      ),
      Text(note ?? "", style: AppStyle.normal_text_black),
    ],
  );
}
