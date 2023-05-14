import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/custom_divider.dart';
import 'package:pay_day_mobile/common/widget/custom_status_button.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_record.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/leave_details.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_view.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/color_picker_helper.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget viewListViewLayout() {
  Data? data = Get.find<LeaveController>().leaveRecord.data;
  return data != null
      ? Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
          child: ListView.separated(
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: CustomDiveider(
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
        customButtomSheet(context: context, height: 0.9, child: LeaveDetails());
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
                CustomDiveider(25, 0.5),
                customSpacerWidth(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      leaves[index].leaveType ?? "",
                      style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.normalTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.fontSizeDefault + 1,
                      ),
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
                              leaves[index].leaveStatusClass!),
                          text: leaves[index].leaveStatus,
                          textColor: Util.getChipTextColor(
                              leaves[index].leaveStatusClass!),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
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
