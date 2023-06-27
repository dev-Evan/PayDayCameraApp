
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/custom_divider.dart';
import 'package:pay_day_mobile/common/widget/custom_status_button.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_record.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/leave_details.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/utils.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget viewListViewLayout() {
  Data? data = Get.find<LeaveController>().leaveRecord.data;
  return data != null
      ? Padding(
          padding: EdgeInsets.only(left: AppLayout.getWidth(20), right: AppLayout.getWidth(20), bottom: AppLayout.getHeight(20)),
          child: ListView.separated(
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(top: AppLayout.getHeight(20)),
              child: customDivider(
                  AppLayout.getHeight(0.6), MediaQuery.of(context).size.width),
            ),
            itemCount: data.leaveRecords!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 0,
                      child: Column(children: [
                        Text(data.leaveRecords![index].month!,
                            style: AppStyle.normal_text_grey),
                        customSpacerHeight(height: 10),
                        _leaves(leaves: data.leaveRecords![index].leaves!)
                      ]),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      : Container();
}

_leaves({required List<Leaves> leaves}) {
  return ListView.separated(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: leaves.length,
    separatorBuilder: (context, index) => customSpacerHeight(height: 20),
    itemBuilder: (context, index) => InkWell(
      onTap: () async {
        customButtonSheet(context: context, height: 0.9, child: const LeaveDetails());
        await Get.find<LeaveController>()
            .getILeaveDetails(id: leaves[index].id!);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  leaves[index].date ?? "",
                  style: AppStyle.mid_large_text.copyWith(
                      color: AppColor.normalTextColor,
                      fontSize: Dimensions.fontSizeExtraLarge,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  leaves[index].month ?? "",
                  style: AppStyle.small_text.copyWith(
                      color: AppColor.hintColor,
                      fontSize: Dimensions.fontSizeSmall),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                customDivider(25, 0.5),
                customSpacerWidth(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        leaves[index].leaveType ?? "",
                        style: AppStyle.mid_large_text.copyWith(
                          color: AppColor.normalTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: Dimensions.fontSizeDefault + 1,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(6),
                      ),
                      Row(
                        children: [
                          Text(
                            leaves[index].leaveDuration ?? "",
                            style: AppStyle.small_text_black,
                          ),
                          SizedBox(
                            width: AppLayout.getWidth(12),
                          ),
                          CustomStatusButton(
                            bgColor: Util.getChipBgColor(
                                status: leaves[index].leaveStatusClass!),
                            text: leaves[index].leaveStatus,
                            textColor: Util.getChipTextColor(
                                status: leaves[index].leaveStatusClass!),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                CircleAvatar(
                    backgroundColor: AppColor.disableColor.withOpacity(0.2),
                    radius: 14,
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.primaryColor,
                      size: 16,
                    )),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
