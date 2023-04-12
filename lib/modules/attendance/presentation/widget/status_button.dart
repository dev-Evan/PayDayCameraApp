import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';

import '../../../../common/widget/custom_status_button.dart';
import '../../../../utils/color_picker_helper.dart';

Widget getStatusButton(
    int index, int dataIndex, AttendanceLogsController controller) {
  String status = controller.filteredLogSummary.value.data!.data![dataIndex]
      .details![index].statusName!;
  return status.startsWith("status_approve")
      ? Container()
      : CustomStatusButton(
          bgColor: Util.getChipBgColor(status),
          text: Util.getChipText(status),
          textColor: Util.getChipTextColor(status),
        );
}
