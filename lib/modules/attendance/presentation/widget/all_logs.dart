import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/logs_list.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/selected_range_calender.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';

import '../../../../enum/range_calendar_method_imp.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';

class AllLogsScreen extends GetView<AttendanceLogsController> {
  const AllLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppLayout.getHeight(Dimensions.paddingLarge),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => _openBottomSheet(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.filteredLogSummary.data != null
                              ? Text(
                                  controller.filteredLogSummary.data!
                                          .queryString!.start!.isNotEmpty
                                      ? "Custom"
                                      : "This Month",
                                  style: AppStyle.mid_large_text.copyWith(
                                      color: AppColor.secondaryColor,
                                      fontWeight: FontWeight.w700),
                                )
                              : Container(),
                          controller.filteredLogSummary.data != null
                              ? Text(
                                  controller.filteredLogSummary.data!
                                          .queryString!.start!.isNotEmpty
                                      ? "${controller.filteredLogSummary.data?.queryString?.start} - ${controller.filteredLogSummary.data?.queryString?.end}"
                                      : DateFormat('MMMM yyyy')
                                          .format(DateTime.now())
                                          .toString(),
                                  style: AppStyle.normal_text_grey,
                                )
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        width: AppLayout.getWidth(12),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.hintColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //next version
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Stack(
            //       children: [
            //         //next version
            //         // Row(
            //         //   children: [
            //         //     InkWell(
            //         //         onTap: () => customButtomSheet(
            //         //             context: context,
            //         //             height: 0.9,
            //         //             child: const AttendanceFilter()),
            //         //         child: const Icon(
            //         //           Icons.filter_alt_outlined,
            //         //           color: AppColor.hintColor,
            //         //         )),
            //         //     SizedBox(
            //         //       width: AppLayout.getWidth(24),
            //         //     ),
            //         //   ],
            //         // ),
            //         (controller.filteredLogSummary.data != null &&
            //                 controller.filteredLogSummary.data!.queryString!
            //                     .start!.isNotEmpty)
            //             ? Positioned(
            //                 left: AppLayout.getWidth(24),
            //                 top: -1,
            //                 child: const Icon(
            //                   Icons.circle,
            //                   size: 8,
            //                   color: AppColor.primaryColor,
            //                 ))
            //             : Container()
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
        SizedBox(
          height: AppLayout.getHeight(12),
        ),
        Expanded(child: LogsList()),
        Obx(
          () => controller.isMoreDataLoading.isTrue
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : Container(),
        ),
      ],
    );
  }

  Future _openBottomSheet() {
    return showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) =>
          const SelectRangeCalender(
              rangeCalendarMethodImp:
              RangeCalendarMethodImp.ALL_LOG),
    );
  }
}
