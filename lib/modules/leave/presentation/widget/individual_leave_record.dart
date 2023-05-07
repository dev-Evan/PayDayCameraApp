import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/leave_details.dart';

import '../../../../common/custom_spacer.dart';
import '../../../../common/widget/custom_buttom_sheet.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/images.dart';
import '../view/leave_calendar.dart';

Widget individualDateLeaveRecord() => Container(
      color: AppColor.backgroundColor,
      child: Column(
        children: [
          const DatePickerCustom(),
          Obx(() => Get.find<LeaveController>().isValueLoading.isTrue
              ? const CircularProgressIndicator()
              : Get.find<LeaveController>()
                      .individualDateLeaveList
                      .value
                      .data!
                      .isNotEmpty
                  ? _individualDateLeaveRecordList()
                  : _noDataImg())
          // ,
        ],
      ),
    );

_individualDateLeaveRecordList() => Padding(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: Get.find<LeaveController>()
                .individualDateLeaveList
                .value
                .data
                ?.length ??
            0,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => InkWell(
          onTap: () async {
            customButtomSheet(
                context: Get.context!, height: 0.9, child: LeaveDetails());
            await Get.find<LeaveController>().getILeaveDetails(
                id: Get.find<LeaveController>()
                    .individualDateLeaveList
                    .value
                    .data![index]
                    .id!);
          },
          child: _listCard(index),
        ),
      ),
    );

_listCard(int index) => Padding(
      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      Get.find<LeaveController>()
                              .individualDateLeaveList
                              .value
                              .data?[index]
                              .leaveType ??
                          '',
                      style: AppStyle.large_text_black,
                    ),
                    customSpacerWidth(width: 8),
                    Image.asset(
                      Images.attachment_file,
                      height: AppLayout.getHeight(12),
                      width: AppLayout.getWidth(12),
                    )
                  ],
                ),
                customSpacerHeight(height: 6),
                Text(
                  Get.find<LeaveController>()
                          .individualDateLeaveList
                          .value
                          .data?[index]
                          .leaveDuration ??
                      '',
                  style: AppStyle.small_text_black,
                )
              ],
            ),
            CircleAvatar(
                radius: 14,
                backgroundColor: AppColor.hintColor.withOpacity(0.1),
                child: Icon(
                  CupertinoIcons.right_chevron,
                  size: 16,
                  color: AppColor.primaryColor.withOpacity(0.8),
                )),
          ],
        ),
        if (index ==
            Get.find<LeaveController>()
                    .individualDateLeaveList
                    .value
                    .data!
                    .length -
                1)
          customSpacerHeight(height: 80)
      ]),
    );

Widget _noDataImg() {
  return SizedBox(
    height: AppLayout.getHeight(120),
    child: Image.asset(
      Images.calendar,
      fit: BoxFit.fitHeight,
    ),
  );
}
