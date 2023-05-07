import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/custom_status_button.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/edit_details.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/log_response.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/widget/custom_app_button.dart';

class LeaveDetails extends GetView<LeaveController> {
  LeaveDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bottomSheetAppbar(
                          appbarTitle: AppString.text_leave_details,
                          context: context),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  controller.leaveDetails.data?.leaveType ??
                                      "",
                                  style: AppStyle.title_text.copyWith(
                                      color: AppColor.normalTextColor,
                                      fontSize: Dimensions.fontSizeMid),
                                ),
                                SizedBox(
                                  width: AppLayout.getWidth(12),
                                ),
                                CustomStatusButton(
                                  //todo
                                  textColor: AppColor.pendingTextColor,
                                  bgColor: AppColor.pendingBgColor
                                      .withOpacity(0.2),
                                  text: AppString.text_pending,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  controller.leaveDetails.data?.leaveDuration ??
                                      "",
                                  style: AppStyle.normal_text.copyWith(
                                      color: AppColor.hintColor,
                                      fontSize: Dimensions.fontSizeDefault),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.circle,
                                    size: 6,
                                    color: AppColor.hintColor,
                                  ),
                                ),
                                Text(
                                  '11.00 am - 1.00 pm',
                                  style: AppStyle.normal_text.copyWith(
                                      color: AppColor.hintColor,
                                      fontSize: Dimensions.fontSizeDefault),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppLayout.getHeight(12),
                            ),
                            Text(
                              "${controller.leaveDetails.data?.startAt ?? ""} - ${controller.leaveDetails.data?.startAt ?? ""}",
                              style: AppStyle.title_text.copyWith(
                                  color: AppColor.normalTextColor,
                                  fontSize: Dimensions.fontSizeDefault),
                            ),
                            SizedBox(
                              height: AppLayout.getHeight(4),
                            ),
                            Text(
                              controller.leaveDetails.data?.reasonNote ?? '',
                              style: AppStyle.normal_text.copyWith(
                                  color: AppColor.normalTextColor,
                                  fontSize: Dimensions.fontSizeDefault),
                            ),
                            SizedBox(
                              height: AppLayout.getHeight(28),
                            ),
                            Text(
                              "${controller.leaveDetails.data?.attachmentCount.toString() ?? ''} Attachments",
                              style: AppStyle.title_text.copyWith(
                                  color: AppColor.hintColor,
                                  fontSize: Dimensions.fontSizeDefault - 1),
                            ),
                            SizedBox(
                              height: AppLayout.getHeight(8),
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller
                                      .leaveDetails.data?.attachments?.length ??
                                  0,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent:
                                          AppLayout.getSize(context).width * .5,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemBuilder: (context, index) =>
                                  _attachmentCard(index),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter, child: _buttonLayout()),
              ],
            ),
        onLoading: const LoadingIndicator());
  }

  _buttonLayout() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: AppLayout.getWidth(Dimensions.paddingLarge),
        right: AppLayout.getWidth(Dimensions.paddingLarge),
        bottom: AppLayout.getHeight(Dimensions.paddingLarge),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          controller.leaveDetails.data!.leaveStatus != "Canceled"
              ? _cancelButton()
              : customSpacerWidth(width: 0),
          controller.leaveDetails.data!.leaveStatus != "Canceled"
              ? customSpacerWidth(width: 10)
              : customSpacerWidth(width: 0),
          _logResponseButton(),
        ],
      ),
    );
  }

  _cancelButton() {
    return AppButton(
      onPressed: () async => await controller.cancelLeave(
          id: controller.leaveDetails.data?.id ?? 0),
      buttonText: AppString.text_cancel_leave,
      buttonColor: Colors.transparent,
      hasOutline: true,
      borderColor: Colors.black,
      textColor: Colors.black,
    );
  }

  _logResponseButton() {
    return AppButton(
      onPressed: () {
        customButtomSheet(
            context: Get.context!,
            height: 0.9,
            child: const LogResponse());
      },
      buttonText: AppString.text_log_response,
      buttonColor: AppColor.primary_blue,
      textColor: Colors.white,
    );
  }

  _attachmentCard(int index) {
    return InkWell(
      child: Image.asset(Images.documents),
      onTap: () => launchUrl(Uri.parse(
          controller.leaveDetails.data?.attachments?[index].fullUrl ?? '')),
    );
  }
}
