import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/controller/date_time_helper_controller.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';
import '../../../attendance/presentation/widget/single_date_picker_calendar.dart';

class ApplyLeaveDobSingleDay extends StatelessWidget {
  const ApplyLeaveDobSingleDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool value = Get.isRegistered<DateTimeController>();
    if (value) {
      Get.delete<DateTimeController>();
    }
    Get.put(DateTimeController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.text_date,
          style: AppStyle.small_text.copyWith(
              color: AppColor.normalTextColor,
              fontWeight: FontWeight.w600,
              fontSize: Dimensions.fontSizeDefault),
        ),
        customSpacerHeight(height: 10),
        InkWell(
          onTap: () => showDialog(
            context: Get.context!,
            builder: (context) {
              return const Dialog(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  insetPadding: EdgeInsets.zero,
                  child: SingleDatePicker());
            },
          ),
          child: Obx(() => Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey, width: .5)),
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getWidth(10),
                    vertical: AppLayout.getHeight(12)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Get.find<DateTimeController>().requestedDate.value,
                        style: AppStyle.normal_text_grey,
                      ),
                      const Icon(Icons.calendar_month)
                    ]),
              )),
        )
      ],
    );
  }
}
