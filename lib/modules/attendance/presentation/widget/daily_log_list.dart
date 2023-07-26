import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/time_counter_helper.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';
import '../../domain/daily_log/daily_log.dart';
import '../controller/attendance_controller.dart';
import '../view/log_details_bottomsheet.dart';

Widget dailyLogList(List<DailyLogs> dailyLogs) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) => InkWell(
      child: _logDetails(dailyLogs[index]),
      onTap: () async {
        _openLogDetailsBottomSheet();
        await Get.find<AttendanceController>().logDetails(dailyLogs[index].id!);
      },
    ),
    itemCount: dailyLogs.length,
  );
}

Widget _logDetails(DailyLogs dailyLog) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${dailyLog.inTime} - ${dailyLog.outTime}",
                  style: AppStyle.large_text_black),
              SizedBox(height: AppLayout.getHeight(Dimensions.paddingDefault)),
              Row(
                children: [
                  const Icon(Icons.watch_later_outlined,
                      color: Colors.grey, size: 14),
                  SizedBox(width: AppLayout.getWidth(4)),
                  Text(
                    TimeCounterHelper.getTimeStringFromDouble(
                        dailyLog.totalHours?.toDouble() ?? 0.0),
                    style: AppStyle.small_text.copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    width: AppLayout.getWidth(20),
                  ),
                  const Icon(Icons.sticky_note_2_outlined,
                      color: Colors.grey, size: 14),
                  SizedBox(width: AppLayout.getWidth(4)),
                  Text(
                    dailyLog.notes!.length.toString(),
                    style: AppStyle.small_text.copyWith(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.blueAccent,
            size: 16,
          ),
        ],
      ),
      const Divider(),
    ],
  );
}

_openLogDetailsBottomSheet() => showModalBottomSheet(
  enableDrag: false,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  context: Get.context!,
  builder: (context) => const LogDetailsBottomSheet(pendingText: "log-details"),
);
