import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
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
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _timeLayout(),
    ]),
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
        verticalDivider( dividerColor: AppColor.grey_drak),
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
