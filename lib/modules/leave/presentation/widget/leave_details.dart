import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/custom_status_button.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/log_response.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/common/controller/downloader_helper.dart';
import 'package:pay_day_mobile/utils/images.dart';
import 'package:pay_day_mobile/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../common/widget/custom_app_button.dart';

class LeaveDetails extends GetView<LeaveController> {
  const LeaveDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bottomSheetAppbar(
            appbarTitle: AppString.text_leave_details,
            context: context),

        controller.obx((state) =>   Expanded(child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.leaveDetails.data?.leaveType ?? "",
                          style: AppStyle.title_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeMid),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppLayout.getWidth(12),
                  ),
                  CustomStatusButton(
                      textColor: Util.getChipTextColor(
                          status: controller.leaveDetails.data
                              ?.leaveStatusClass ??
                              ""),
                      bgColor: Util.getChipBgColor(
                          status: controller.leaveDetails.data
                              ?.leaveStatusClass ??
                              ""),
                      text: controller
                          .leaveDetails.data?.leaveStatus ??
                          ""),
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
                  customSpacerWidth(width: 16),
                  controller.leaveDetails.data != null &&
                      controller
                          .leaveDetails.data!.leaveDuration!
                          .contains("hrs")
                      ? _hoursDuration()
                      : Container(),
                ],
              ),
              SizedBox(
                height: AppLayout.getHeight(12),
              ),
              Text(
                "${controller.leaveDetails.data?.startAt ?? ""} - ${controller.leaveDetails.data?.endAt ?? ""}",
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
              ),
              const Spacer(),
              _logResponseButtonLayOut()
            ],
          ),
        )),onLoading: const Expanded(child: Center(child: LoadingIndicator()))
        )
      ],
    );

  }

  _buttonLayout() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        bottom: AppLayout.getHeight(Dimensions.paddingLarge),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          controller.leaveDetails.data?.leaveStatus == "Pending"
              ? _cancelButton()
              : customSpacerWidth(width: 0),
          controller.leaveDetails.data?.leaveStatus == "Pending"
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
        customButtonSheet(
            context: Get.context!, height: 0.9, child: const LogResponse());
      },
      buttonText: AppString.text_log_response,
      buttonColor: AppColor.primaryBlue,
      textColor: Colors.white,
    );
  }

  _attachmentCard(int index) {
    return InkWell(
        child: Image.asset(Images.documents),
        onTap: () => Get.find<DownloadHelper>().downloadFileForAndroid(
            url: controller.leaveDetails.data?.attachments?[index].fullUrl ??
                ""));
  }

  _hoursDuration() {
    return Text(
        "( ${controller.leaveDetails.data!.leaveStartAt} - ${controller.leaveDetails.data!.leaveEndAt} )");
  }

  _logResponseButtonLayOut() {
    return Align(alignment: Alignment.bottomCenter, child: _buttonLayout());
  }
}

downloadFile({required String url}) async {
  final status = await Permission.storage.request();
  if (status.isGranted) {
    final baseStorage = await getExternalStorageDirectory();
    await FlutterDownloader.enqueue(
      url: url,
      savedDir: baseStorage!.path,
      fileName: "File",
    )
        .then((value) => print(value))
        .catchError((error) => print(error.toString()));
  } else {
    print("No Permission");
  }
}
