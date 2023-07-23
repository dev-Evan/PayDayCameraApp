import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_app_button.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/break_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/dimensions.dart';

Future breakPopUp() {
  if (!Get.isRegistered<BreakController>()) {
    Get.put(BreakController());
  }
  Get.find<BreakController>().selectedIndex(100);
  return showDialog(
    barrierDismissible: true,
    context: Get.context!,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        insetPadding: EdgeInsets.zero,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(0, 3),
                  )
                ]),
            margin: EdgeInsets.symmetric(
                horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _breakAppbar(),
                customSpacerHeight(height: 20),
                Obx(() => _timerLayout()),
                Center(child: Obx(() => _breakTimes())),
                customSpacerHeight(height: 20),
                Obx(() => _buttonLayout()),
                customSpacerHeight(height: 20)
              ],
            )),
      );
    },
  );
}

_loadingButtonLayout() => SizedBox(
      height: AppLayout.getHeight(50),
      child: const LoadingIndicator(),
    );

_breakAppbar() {
  return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(Dimensions.paddingDefault)),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade50,
              offset: const Offset(0, 3),
            )
          ]),
      child: Obx(
        () => AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            Get.find<AttendanceController>().breakDetails.value.breakTimeId ==
                    null
                ? AppString.text_take_break.tr
                : "text_on_break".tr,
            style: AppStyle.normal_text_black.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.fontSizeDefault + 2),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.close,
                size: Dimensions.fontSizeLarge,
                color: AppColor.secondaryColor,
              ),
            ),
          ],
        ),
      ));
}

_timerLayout() {
  Duration timerTime = Get.find<BreakController>().duration.value;
  String hrs = timerTime.inHours.remainder(60).toString().padLeft(2, "0");
  String mins = timerTime.inMinutes.remainder(60).toString().padLeft(2, "0");
  String sec = timerTime.inSeconds.remainder(60).toString().padLeft(2, "0");
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("$hrs : ", style: AppStyle.timer_text.copyWith(color: Colors.black)),
      Text(
        "$mins : ",
        style: AppStyle.timer_text.copyWith(color: Colors.black),
      ),
      Text(
        sec,
        style: AppStyle.timer_text.copyWith(color: Colors.black),
      )
    ],
  );
}

_breakTimes() {
  return Get.find<AttendanceController>().breakDetails.value.breakTimeId == null
      ? ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) =>
              customSpacerHeight(height: AppLayout.getHeight(20)),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(20),
              vertical: AppLayout.getHeight(20)),
          itemCount: Get.find<AttendanceController>().breakTimes.length,
          itemBuilder: (context, index) => Obx(() => InkWell(
                onTap: () => Get.find<BreakController>().selectedIndex(index),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: AppLayout.getHeight(12),
                      horizontal: AppLayout.getWidth(20)),
                  decoration: BoxDecoration(
                      color: Get.find<BreakController>().selectedIndex.value ==
                              index
                          ? AppColor.primaryBlue.withOpacity(.15)
                          : Colors.grey.withOpacity(.05),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                      Get.find<AttendanceController>().breakTimes[index].name ??
                          "",
                      style: AppStyle.small_text_black,
                    )),
                    const Icon(Icons.watch_later_outlined, size: 16),
                    customSpacerWidth(width: 4),
                    Text(
                      Get.find<AttendanceController>()
                              .breakTimes[index]
                              .duration ??
                          "",
                      style: AppStyle.small_text_black,
                    ),
                  ]),
                ),
              )),
        )
      : _breakInfo();
}

_breakInfo() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(20),horizontal: AppLayout.getWidth(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.watch_later_outlined,
          size: AppLayout.getWidth(16),
        ),
        customSpacerWidth(width: 10),
        Expanded(child: Text(
          "${Get.find<AttendanceController>().breakDetails.value.breakReason} ( ${Get.find<AttendanceController>().breakDetails.value.duration} )",textAlign: TextAlign.center,
        ))
      ],
    ),
  );
}

_buttonLayout() {
  return Get.find<BreakController>().isLoading.isTrue
      ? _loadingButtonLayout()
      : Padding(
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
          child: Row(
            children: [
              AppButton(
                buttonText: AppString.text_close,
                onPressed: () {
                  Get.back();
                },
                buttonColor: Colors.transparent,
                textColor: Colors.black,
                borderColor: Colors.black,
              ),
              customSpacerWidth(width: 10),
              AppButton(
                  buttonText: Get.find<AttendanceController>()
                              .breakDetails
                              .value
                              .breakTimeId ==
                          null
                      ? AppString.text_start
                      : AppString.text_end,
                  onPressed: () {
                    //check if break is on
                    if (Get.find<AttendanceController>()
                            .breakDetails
                            .value
                            .breakTimeId ==
                        null) {
                      // ignore: unrelated_type_equality_checks
                      if (Get.find<BreakController>().selectedIndex != 100) {
                        //get log id from check punched in method from attendance controller
                        //find break id by indexing from break controller
                        Get.find<BreakController>().startBreak(
                            logId: Get.find<AttendanceController>()
                                .lastAttendanceId,
                            breakId: Get.find<AttendanceController>()
                                    .breakTimes[Get.find<BreakController>()
                                        .selectedIndex
                                        .value]
                                    .id ??
                                0);
                      } else {
                        showCustomSnackBar(
                            message: AppString.breaK_time_selection_text);
                      }
                    } else {
                      //get log id from check punched in method from attendance controller
                      //find break id by indexing from break controller
                      if (Get.find<AttendanceController>().logs.value.data !=
                          null) {
                        Get.find<BreakController>().endBreak(
                            logId: Get.find<AttendanceController>()
                                .lastAttendanceId,
                            breakId: Get.find<AttendanceController>()
                                    .breakDetails
                                    .value
                                    .breakTimeId ??
                                0);
                      }
                    }
                  },
                  hasOutline: false,
                  buttonColor: Get.find<AttendanceController>()
                              .breakDetails
                              .value
                              .breakTimeId ==
                          null
                      ? AppColor.primaryGreen
                      : AppColor.primaryRed),
            ],
          ),
        );
}
