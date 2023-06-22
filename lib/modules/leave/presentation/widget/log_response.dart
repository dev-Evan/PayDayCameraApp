import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_status_button.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/utils.dart';
import 'package:pay_day_mobile/utils/images.dart';

import '../../../../common/widget/custom_app_button.dart';
import '../../../../utils/app_string.dart';
import '../../../attendance/presentation/widget/bottom_sheet_appbar.dart';

class LogResponse extends GetView<LeaveController> {
  const LogResponse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bottomSheetAppbar(
                  appbarTitle: AppString.text_leave_response, context: context),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getWidth(20),
                    vertical: AppLayout.getHeight(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _leaveStatusDetailsLayout(),
                    customSpacerHeight(height: 20),
                    _leaveDateAndReason(),
                    _leaveResponseLogList()
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(20),
                  vertical: AppLayout.getHeight(10)),
              child: _cancelButton(),
            )),
      ],
    );
  }

  _leaveStatusDetailsLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.leaveDetails.data?.leaveType ?? "",
              style: AppStyle.extra_large_text_black
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            customSpacerHeight(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.watch_later_outlined,
                  size: 16,
                  color: Colors.grey,
                ),
                customSpacerWidth(width: 4),
                Text(controller.leaveDetails.data?.leaveDuration ?? "",
                    style:
                        AppStyle.small_text_black.copyWith(color: Colors.grey)),
                customSpacerWidth(width: 20),
                Image.asset(Images.attachment_file,
                    height: AppLayout.getWidth(12),
                    width: AppLayout.getHeight(12)),
                customSpacerWidth(width: 4),
                Text(
                    controller.leaveDetails.data?.attachmentCount.toString() ??
                        "",
                    style:
                        AppStyle.small_text_black.copyWith(color: Colors.grey)),
              ],
            ),
          ],
        ),
        CustomStatusButton(
            bgColor: Util.getChipBgColor(
                status: controller.leaveDetails.data!.leaveStatusClass!),
            textColor: Util.getChipTextColor(
                status: controller.leaveDetails.data!.leaveStatusClass!),
            text: controller.leaveDetails.data?.leaveStatus),
      ],
    );
  }

  _leaveResponseLogList() {
    return Padding(
      padding: EdgeInsets.only(
          left: AppLayout.getWidth(20), top: AppLayout.getHeight(20)),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.leaveDetails.data?.logs?.length ?? 0,
        itemBuilder: (context, index) => _logResponseCard(index),
      ),
    );
  }

  _logResponseCard(int index) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _dottedLine(),
          customSpacerWidth(width: 16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _logDate(index),
                  customSpacerWidth(width: 4),
                  Icon(
                    Icons.circle,
                    size: AppLayout.getHeight(4),
                  ),
                  customSpacerWidth(width: 4),
                  _logTime(index),
                ],
              ),
              customSpacerHeight(height: 8),
              Row(
                children: [
                  Image.asset(
                    Images.log_response_icon,
                    width: AppLayout.getWidth(50),
                    height: AppLayout.getHeight(50),
                    fit: BoxFit.fill,
                  ),
                  customSpacerWidth(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          controller.leaveDetails.data?.logs?[index].level ??
                              "",
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.normal_text_black
                              .copyWith(fontWeight: FontWeight.bold)),
                      customSpacerHeight(height: 8),
                      Text(
                          controller.leaveDetails.data?.logs?[index].logBy ??
                              "",
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ],
              ),
              customSpacerHeight(height: 8),
              _comment(index),
              controller.leaveDetails.data!.logs!.length - 1 == index
                  ? customSpacerHeight(height: 40)
                  : customSpacerHeight(height: 16)
            ],
          )),
        ],
      );

  _leaveDateAndReason() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _leaveDate(),
          customSpacerHeight(height: 16),
          _leaveReason(),
        ],
      );

  _leaveReason() => Text(
        controller.leaveDetails.data?.reasonNote ?? "",
        style: AppStyle.normal_text_black,
      );

  _leaveDate() => Text(
        "${controller.leaveDetails.data?.startAt ?? ""} - ${controller.leaveDetails.data?.endAt ?? ""}",
        style: AppStyle.normal_text_black.copyWith(fontWeight: FontWeight.bold),
      );

  _cancelButton() {
    return Row(
      children: [
        AppButton(
          onPressed: () => Get.back(),
          isButtonExpanded: true,
          buttonText: AppString.text_back,
          buttonColor: AppColor.primaryBlue,
          textColor: Colors.white,
        ),
      ],
    );
  }

  _dottedLine() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customSpacerHeight(height: 4),
          Icon(
            Icons.circle,
            size: AppLayout.getHeight(8),
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(left: AppLayout.getWidth(4)),
            child: DottedBorder(
              customPath: (p0) => Path()..lineTo(0, 98),
              color: AppColor.disableColor,
              dashPattern: const [8],
              strokeWidth: 1,
              child: const Divider(
                color: AppColor.noColor,
              ),
            ),
          ),
        ],
      );

  _logTime(int index) => Text(
        controller.leaveDetails.data?.logs?[index].logTime ?? "",
        style: AppStyle.small_text_grey,
      );

  _logDate(int index) => Text(
        controller.leaveDetails.data?.logs?[index].logDate ?? "",
        style: AppStyle.small_text_grey,
      );

  _comment(int index) {
    return Text(controller.leaveDetails.data?.logs?[index].comment ?? "");
  }
}
