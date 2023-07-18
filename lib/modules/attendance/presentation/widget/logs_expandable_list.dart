import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/logs_date.dart';
import '../../../../common/widget/custom_spacer.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/dimensions.dart';
import '../controller/attendance_controller.dart';
import '../controller/attendance_log_controller.dart';
import '../view/log_details_bottomsheet.dart';
import 'log_info.dart';
import 'multi_log_summary_list.dart';

class LogsExpandableList extends StatefulWidget {
  const LogsExpandableList({Key? key, required this.dataIndex})
      : super(key: key);
  final int dataIndex;

  @override
  State<LogsExpandableList> createState() => _LogsExpandableListState();
}

class _LogsExpandableListState extends State<LogsExpandableList> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.zero,
      expandedCrossAxisAlignment: CrossAxisAlignment.end,
      tilePadding: const EdgeInsets.all(0),
      onExpansionChanged: (value) => setState(() {
        isExpanded = value;
      }),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 40, child: logsDate(widget.dataIndex)),
          customSpacerWidth(width: 20),
          Expanded(
            child: logInfo(widget.dataIndex),
          )
        ],
      ),
      trailing: CircleAvatar(
          radius: 14,
          backgroundColor: AppColor.hintColor.withOpacity(0.1),
          child: _changeIcon()),
      children: [
        customSpacerHeight(height: 16),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: ListView.separated(
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppLayout.getHeight(Dimensions.paddingMid)),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Get.find<AttendanceLogsController>()
                      .logList[widget.dataIndex]
                      .details
                      .length ??
                  0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    _openLogDetailsBottomSheet();
                    await Get.find<AttendanceController>().logDetails(
                        Get.find<AttendanceLogsController>()
                            .logList[widget.dataIndex]
                            .details[index]
                            .id);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 40,
                        child: _dottedBorder(),
                      ),
                      multiLogSummaryList(
                          index: index,
                          dataIndex: widget.dataIndex,
                          controller: Get.find<AttendanceLogsController>()),
                    ],
                  ),
                );
              },
            ))
          ],
        )
      ],
    );
  }

  _changeIcon() {
    return !isExpanded
        ? const Icon(
            CupertinoIcons.arrow_turn_right_down,
            color: AppColor.primaryColor,
            size: 18,
          )
        : Icon(
            CupertinoIcons.arrow_turn_up_left,
            size: 18,
            color: AppColor.primaryColor.withOpacity(0.8),
          );
  }

  _dottedBorder() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: DottedBorder(
            customPath: (p0) => Path()..lineTo(0, 98),
            padding: EdgeInsets.zero,
            color: AppColor.disableColor,
            dashPattern: const [6, 4],
            strokeWidth: 1,
            child: Divider(
              height: AppLayout.getHeight(70),
              color: AppColor.noColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Icon(Icons.circle, size: 16, color: Colors.grey.shade400)),
        )
      ],
    );
  }
  Future _openLogDetailsBottomSheet() {
    return showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) => const LogDetailsBottomSheet(),
    );
  }
}
