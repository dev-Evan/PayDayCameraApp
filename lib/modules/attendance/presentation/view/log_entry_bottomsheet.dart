import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/common/widget/users_current_info_layout.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/map_layout.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import '../../../../common/widget/custom_app_button.dart';
import '../../../../common/widget/input_note.dart';
import '../../../../utils/dimensions.dart';
import '../../domain/log_entry/log_entry_request.dart';
import '../widget/timer_overview_layout.dart';

import '../../../../utils/app_layout.dart';
import '../widget/bottom_sheet_appbar.dart';
import '../widget/vertical_divider.dart';

class LogEntryBottomSheet extends GetView<AttendanceController> {
  const LogEntryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => DraggableScrollableSheet(
              initialChildSize: .8,
              maxChildSize: .8,
              minChildSize: .5,
              builder:
                  (BuildContext context, ScrollController scrollController) =>
                      Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16))),
                child: Stack(
                  children: [
                    ListView(
                      controller: scrollController,
                      children: [
                        bottomSheetAppbar(
                            context: context,
                            appbarTitle:
                                Get.find<AttendanceController>().isPunchIn.value
                                    ? AppString.text_punch_out
                                    : AppString.text_punch_in),
                        _contentLayout(),
                        SizedBox(height: AppLayout.getHeight(60)),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _buttonLayout(context),
                    ),
                  ],
                ),
              ),
            ),
        onLoading: const LoadingIndicator());
  }

  _contentLayout() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(Dimensions.paddingLarge),
          horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _timeLayout(),
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
          _noteLayout(),
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
          _mapLayout(),
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
          Obx(
            () => UsersCurrentInfoLayout(
                title: AppString.text_my_location,
                data: Get.find<AttendanceController>().address.value),
          ),
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
          Obx(
            () => UsersCurrentInfoLayout(
                title: AppString.text_ip_address,
                data: Get.find<AttendanceController>().ipAddress.value),
          ),
        ],
      ),
    );
  }

  Widget _mapLayout() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      width: double.infinity,
      height: AppLayout.getHeight(168),
      child: MapSample(),
    );
  }

  _noteLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _noteText(),
        SizedBox(height: AppLayout.getHeight(Dimensions.paddingDefault)),
        inputNote(
            controller: Get.find<AttendanceController>().editTextController)
      ],
    );
  }

  _noteText() {
    return Text(
      AppString.note_text,
      style: AppStyle.normal_text
          .copyWith(color: Colors.grey, fontWeight: FontWeight.w600),
    );
  }

  _timeLayout() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _inTimeLog(),
          const Spacer(),
          verticalDivider(dividerColor: AppColor.grey_drak),
          const Spacer(),
          _outTimeLog(),
          const Spacer(),
          verticalDivider(dividerColor: AppColor.grey_drak),
          const Spacer(),
          _totalTimeLog(),
        ]);
  }

  _inTimeLog() {
    var data = Get.find<AttendanceController>().logs.value.data;
    return logInfo(
        title: AppString.text_in,
        time: Get.find<AttendanceController>().isPunchIn.value
            ? data != null && data.dailyLogs!.isNotEmpty
                ? data.dailyLogs?.first.inTime ?? ""
                : ""
            : DateFormat('h:mma').format(DateTime.now()).toString(),
        fontColor: Colors.black);
  }

  _outTimeLog() {
    return logInfo(
        title: AppString.text_out,
        time: Get.find<AttendanceController>().isPunchIn.value
            ? DateFormat('h:mma').format(DateTime.now()).toString()
            : "",
        fontColor: Colors.black);
  }

  _totalTimeLog() {
    var data = Get.find<AttendanceController>().logs.value.data;
    final Duration time = DateTime.now().difference(DateTime.parse(
        data != null && data.dailyLogs!.isNotEmpty
            ? data.dailyLogs!.first.startTime.toString()
            : "2023-03-21 10:41:25"));
    String hrs = time.inHours.remainder(60).toString();
    String mins = time.inMinutes.remainder(60).toString();
    return logInfo(
        title: AppString.text_total,
        time: Get.find<AttendanceController>().isPunchIn.value
            ? "$hrs h $mins m"
            : "",
        fontColor: Colors.black);
  }

//output (in seconds): 103510200

  _buttonLayout(BuildContext context) {
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
          _cancelButton(context),
          SizedBox(width: AppLayout.getWidth(10)),
          _punchButton(),
        ],
      ),
    );
  }

  _punchButton() {
    final controller = Get.find<AttendanceController>();
    return Obx(() => AppButton(
          buttonColor: controller.isPunchIn.value
              ? AppColor.primary_orange
              : AppColor.primary_green,
          buttonText: controller.isPunchIn.value
              ? AppString.text_punch_out
              : AppString.text_punch_in,
          onPressed: () => controller.isPunchIn.value
              ? _punchOut(controller)
              : _punchIn(controller),
        ));
  }

  _punchOut(AttendanceController controller) async {
    await controller.punchOut(LogEntryRequest(
        ipData: IpData(
            ip: controller.ipAddress.value,
            coordinate: Coordinate(
              lat: controller.lat.value.toString(),
              lng: controller.long.value.toString(),
            ),
            location: controller.address.value,
            workFromHome: false),
        note: controller.editTextController.value.text,
        today: DateFormat('y-M-d').format(DateTime.now())));
    Navigator.of(Get.context!).pop();
  }

  _punchIn(AttendanceController controller) async {
    await controller.punchIn(LogEntryRequest(
        ipData: IpData(
            ip: controller.ipAddress.value,
            coordinate: Coordinate(
              lat: controller.lat.value.toString(),
              lng: controller.long.value.toString(),
            ),
            location: controller.address.value,
            workFromHome: false),
        note: controller.editTextController.value.text,
        today: DateFormat('y-M-d').format(DateTime.now())));

    Navigator.of(Get.context!).pop();
  }

  _cancelButton(BuildContext context) {
    return AppButton(
      onPressed: () => Navigator.of(context).pop(),
      buttonText: AppString.text_cancel,
      buttonColor: Colors.transparent,
      hasOutline: true,
      borderColor: Colors.black,
      textColor: Colors.black,
    );
  }
}
