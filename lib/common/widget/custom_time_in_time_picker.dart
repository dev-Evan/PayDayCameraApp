import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/timer_picker.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_string.dart';
import '../../utils/app_style.dart';
import '../../utils/dimensions.dart';
import '../controller/date_time_helper_controller.dart';

class CustomTimeInTimePicker extends GetView<DateTimeController> {
  const  CustomTimeInTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getHeight(Dimensions.paddingDefaultExtra),
            vertical: AppLayout.getWidth(
                AppLayout.getWidth(Dimensions.paddingDefault))),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    controller.pickedInTime.value.isNotEmpty
                        ? controller.pickedInTime.value
                        : AppString.text_select_time,
                    style: controller.pickedInTime.value.isNotEmpty
                        ? AppStyle.normal_text_black
                        : AppStyle.normal_text_grey),
                const Icon(Icons.access_time,size: 16,)
              ],
            )),
      ),
      onTap: () {
        controller.isInTimeClicked.value = true;
        timePicker(context);
      },
    );
  }
}
