import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/dob_half_day_field.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/dob_hours_field.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/dob_multi_day_field.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/dob_single_day_field.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../controller/leave_controller.dart';

class ApplyLeaveButtonLayout extends StatefulWidget {
  const ApplyLeaveButtonLayout({Key? key}) : super(key: key);

  @override
  State<ApplyLeaveButtonLayout> createState() => _ApplyLeaveButtonLayoutState();
}

class _ApplyLeaveButtonLayoutState extends State<ApplyLeaveButtonLayout> {
  var currentIndex = 0;
  List buttonText = [
    AppString.text_single_day,
    AppString.text_multi_day,
    AppString.text_half_day,
    AppString.text_hours,
  ];
  final _dobField = [
    const ApplyLeaveDobSingleDay(),
    const ApplyLeaveDobMultiDay(),
    const ApplyLeaveDobHalfDay(),
    const ApplyLeaveDobHours(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppLayout.getHeight(128),
          child: GridView.builder(
            itemCount: buttonText.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 2,
                childAspectRatio: 3.14),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.find<LeaveController>().requestLeaveQueries.clear();
                  switch (index) {
                    case 0:
                      {
                        Get.find<LeaveController>().leaveDurationIndex(0);
                        Get.find<LeaveController>()
                                .requestLeaveQueries["leave_duration"] =
                            "single_day";
                      }
                      break;
                    case 1:
                      {
                        Get.find<LeaveController>().leaveDurationIndex(1);
                        Get.find<LeaveController>()
                                .requestLeaveQueries["leave_duration"] =
                            "multi_day";
                      }
                      break;
                    case 2:
                      {
                        Get.find<LeaveController>().leaveDurationIndex(2);
                      }
                      break;
                    case 3:
                      {
                        Get.find<LeaveController>().leaveDurationIndex(3);
                        Get.find<LeaveController>()
                            .requestLeaveQueries["leave_duration"] = "hours";
                      }
                      break;
                  }
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault),
                      side: BorderSide(
                          color: currentIndex == index
                              ? AppColor.primaryColor
                              : AppColor.disableColor.withOpacity(0.4))),
                  color: currentIndex == index
                      ? AppColor.primaryColor.withOpacity(0.2)
                      : AppColor.disableColor.withOpacity(0.4),
                  child: Center(
                      child: Text(
                    buttonText[index],
                    style: AppStyle.small_text_black.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.fontSizeDefault,
                        letterSpacing: 0.2,
                        color: currentIndex == index
                            ? AppColor.primaryColor
                            : AppColor.normalTextColor),
                  )),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: AppLayout.getHeight(8),
        ),
        Container(
          child: _dobField[currentIndex],
        )
      ],
    );
  }
}
