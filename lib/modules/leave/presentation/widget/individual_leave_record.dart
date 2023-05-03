import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';

import '../../../../common/custom_spacer.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/images.dart';
import '../view/leave_calendar.dart';

Widget individualDateLeaveRecord() => Container(
      color: AppColor.backgroundColor,
      child: const Column(
        children: [
          DatePickerCustom(),
          IndividualDateLeaveRecordList(),
          // _noDataImg(),
        ],
      ),
    );

class IndividualDateLeaveRecordList extends GetView<LeaveController> {
  const IndividualDateLeaveRecordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.individualDateLeaveList.data?.length ?? 0,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => _listCard(index),
              ),
            ),
        onLoading: const LoadingIndicator());
  }

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
                        controller.individualDateLeaveList.data?[index]
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
                    controller.individualDateLeaveList.data?[index]
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
          if (index == controller.individualDateLeaveList.data?.length)
            customSpacerHeight(height: 80)
        ]),
      );
}

Widget _noDataImg() {
  return SizedBox(
    height: AppLayout.getHeight(120),
    child: Image.asset(
      Images.calendar,
      fit: BoxFit.fitHeight,
    ),
  );
}
