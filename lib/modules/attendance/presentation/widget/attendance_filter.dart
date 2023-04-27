import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/controller/status_controller.dart';
import 'package:pay_day_mobile/common/domain/attendance_status.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../../../common/widget/custom_double_button.dart';
import 'bottom_sheet_appbar.dart';

class AttendanceFilter extends StatefulWidget {
  const AttendanceFilter({Key? key}) : super(key: key);

  @override
  State<AttendanceFilter> createState() => _AttendanceFilterState();
}

class _AttendanceFilterState extends State<AttendanceFilter> {
  bool? approve = false;
  bool? pending = false;
  bool? rejection = false;
  bool? single = false;
  bool? multi = false;
  bool? early = false;
  bool? regular = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          bottomSheetAppbar(
              appbarTitle: AppString.text_filter, context: context),
          _attendanceStatus(),
          _entryTypeStatus(),
          _attendanceBehaviourStatus(),
          customDoubleButton(
              context: context,
              textBtnText: 'Clear',
              textButtonAction: () {
                setState(() {
                  multi=false;
                });
              },
              elevatedBtnText: 'Apply',
              elevatedButtonAction: () {})
        ],
      ),
    );
  }

  _attendanceStatus() => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
        child: ExpansionTile(
            title: Text(
              AppString.text_attendance_status,
              style: AppStyle.extra_large_text.copyWith(
                  color: AppColor.normalTextColor,
                  fontSize: Dimensions.fontSizeMid),
            ),
            tilePadding: EdgeInsets.zero,
            initiallyExpanded: true,
            iconColor: AppColor.normalTextColor,
            children: [
              ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppLayout.getHeight(16)),
                itemBuilder: (context, index) => StatusCheckbox(
                  attendanceStatusData:
                      Get.find<StatusController>().statusData.data?[index],
                ),
                shrinkWrap: true,
                itemCount:
                    Get.find<StatusController>().statusData.data?.length ?? 0,
              ),
              SizedBox(height: AppLayout.getHeight(16)),
            ]),
      );

  _entryTypeStatus() => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
        child: ExpansionTile(
          title: Text(
            AppString.text_entry_type,
            style: AppStyle.extra_large_text.copyWith(
                color: AppColor.normalTextColor,
                fontSize: Dimensions.fontSizeMid),
          ),
          tilePadding: EdgeInsets.zero,
          initiallyExpanded: true,
          iconColor: AppColor.normalTextColor,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.text_single,
                      style: AppStyle.extra_large_text.copyWith(
                          color: AppColor.normalTextColor,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(24),
                      width: AppLayout.getWidth(24),
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusSmall)),
                        value: single,
                        onChanged: (bool? single) {
                          setState(() {
                            this.single = single;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppLayout.getHeight(24)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.text_multi,
                      style: AppStyle.extra_large_text.copyWith(
                          color: AppColor.normalTextColor,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(24),
                      width: AppLayout.getWidth(24),
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusSmall)),
                        value: multi,
                        onChanged: (bool? multi) {
                          setState(() {
                            this.multi = multi;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppLayout.getHeight(24)),
              ],
            ),
          ],
        ),
      );

  _attendanceBehaviourStatus() => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          title: Text(
            AppString.text_attendance_behavior,
            style: AppStyle.extra_large_text.copyWith(
                color: AppColor.normalTextColor,
                fontSize: Dimensions.fontSizeMid),
          ),
          initiallyExpanded: true,
          iconColor: AppColor.normalTextColor,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.text_enrly,
                      style: AppStyle.extra_large_text.copyWith(
                          color: AppColor.normalTextColor,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(24),
                      width: AppLayout.getWidth(24),
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusSmall)),
                        value: early,
                        onChanged: (bool? early) {
                          setState(() {
                            this.early = early;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppLayout.getHeight(24)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.text_regular,
                      style: AppStyle.extra_large_text.copyWith(
                          color: AppColor.normalTextColor,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(24),
                      width: AppLayout.getWidth(24),
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusSmall)),
                        value: regular,
                        onChanged: (bool? regular) {
                          setState(() {
                            this.regular = regular;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppLayout.getHeight(24)),
              ],
            ),
          ],
        ),
      );
}

class StatusCheckbox extends StatefulWidget {
  final Data? attendanceStatusData;

  const StatusCheckbox({super.key, required this.attendanceStatusData});

  @override
  State<StatusCheckbox> createState() => _StatusCheckboxState();
}

class _StatusCheckboxState extends State<StatusCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.attendanceStatusData?.translatedName ?? "",
          style: AppStyle.extra_large_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDefault),
        ),
        SizedBox(
          width: AppLayout.getWidth(24),
          height: AppLayout.getHeight(24),
          child: Checkbox(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
