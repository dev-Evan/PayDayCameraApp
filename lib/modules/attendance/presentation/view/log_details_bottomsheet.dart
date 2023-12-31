import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/attendance_eidt_bottomsheet.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../common/controller/date_time_helper_controller.dart';
import '../../../../common/widget/custom_app_button.dart';
import '../../../../common/widget/custom_buttom_sheet.dart';
import '../../../../common/widget/loading_indicator.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/dimensions.dart';
import '../widget/bottom_sheet_appbar.dart';
import '../widget/log_details_bottom_sheet_content.dart';

class LogDetailsBottomSheet extends GetView<AttendanceController> {
  final String pendingText;

  const LogDetailsBottomSheet({required this.pendingText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        child: Column(
          children: [
            bottomSheetAppbar(
                context: context,
                appbarTitle: pendingText == "warning"
                    ? AppString.text_log_request_details
                    : AppString.text_log_details),
            controller.obx((state) => contentLayout(),
                onLoading: bottomSheetLoader()),
            const Spacer(),
            controller.obx((state) => _buttonLayout(context),
                onLoading: Container())
          ],
        ));
  }

  _buttonLayout(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          left: AppLayout.getWidth(Dimensions.paddingLarge),
          right: AppLayout.getWidth(Dimensions.paddingLarge),
          bottom: AppLayout.getHeight(Dimensions.paddingLarge),
        ),
        color: Colors.white,
        child: pendingText == "warning"
            ? Obx(() =>
                Get.find<AttendanceLogsController>().isLoading.value == true
                    ? loadingIndicatorLayout()
                    : _manualEntryButtonLayout())
            : _autoEntryLogDetail());
  }

  _cancelRequest() {
    return AppButton(
        buttonText: AppString.text_cancel_request,
        onPressed: () {
          Get.find<AttendanceLogsController>().cancelRequest(
              requestId: controller.logDetailsById.data?.id ?? 0);
        },
        buttonColor: Colors.white,
        borderColor: Colors.black,
        textColor: Colors.black87);
  }

  _editButton() {
    return AppButton(
      buttonColor: AppColor.primaryBlue,
      buttonText: AppString.text_edit,
      onPressed: () {
        Get.delete<DateTimeController>();
        Get.put(DateTimeController());
        customButtonSheet(
          context: Get.context!,
          height: 0.9,
          child: EditAttendanceBottomSheet(
              Get.find<AttendanceController>().logDetailsById),
        );
      },
    );
  }

  _autoEntryLogDetail() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _editButton(),
        ],
      );

  _manualEntryButtonLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _cancelRequest(),
        customSpacerWidth(width: 10),
        _editButton(),
      ],
    );
  }
}
