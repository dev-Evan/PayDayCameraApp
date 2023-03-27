import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/common/custom_double_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class LeaveDurationFilter extends StatefulWidget {
  const LeaveDurationFilter({Key? key}) : super(key: key);

  @override
  State<LeaveDurationFilter> createState() => _AttendanceFilterState();
}

class _AttendanceFilterState extends State<LeaveDurationFilter> {
  bool? approve = false;
  bool? pending = false;
  bool? rejection = false;

  bool? multiDay = false;
  bool? firstHalf = false;
  bool? lastHalf = false;
  bool? hours = false;
  bool? singleDay = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          bottomSheetAppbar(
              appbarTitle: AppString.text_filter, context: context),
          ExpansionTile(
            title: Text(
              AppString.text_attendance_status,
              style: AppStyle.extra_large_text.copyWith(
                  color: AppColor.normalTextColor,
                  fontSize: Dimensions.fontSizeMid),
            ),
            initiallyExpanded: true,
            iconColor: AppColor.normalTextColor,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.text_approved,
                          style: AppStyle.extra_large_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusSmall)),
                          value: this.approve,
                          onChanged: (bool? approve) {
                            setState(() {
                              this.approve = approve;
                              print(approve);
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.text_pending,
                          style: AppStyle.extra_large_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusSmall)),
                          value: this.pending,
                          onChanged: (bool? pending) {
                            setState(() {
                              this.pending = pending;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.text_rejection,
                          style: AppStyle.extra_large_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusSmall)),
                          value: this.rejection,
                          onChanged: (bool? rejection) {
                            setState(() {
                              this.rejection = rejection;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              AppString.text_attendance_duration,
              style: AppStyle.extra_large_text.copyWith(
                  color: AppColor.normalTextColor,
                  fontSize: Dimensions.fontSizeMid),
            ),
            initiallyExpanded: true,
            iconColor: AppColor.normalTextColor,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.text_hours,
                          style: AppStyle.extra_large_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusSmall)),
                          value: this.hours,
                          onChanged: (bool? hours) {
                            setState(() {
                              this.hours = hours;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.text_single_day,
                          style: AppStyle.extra_large_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusSmall)),
                          value: this.singleDay,
                          onChanged: (bool? singleDay) {
                            setState(() {
                              this.singleDay = singleDay;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.text_multi_day,
                          style: AppStyle.extra_large_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusSmall)),
                          value: this.multiDay,
                          onChanged: (bool? multiDay) {
                            setState(() {
                              this.multiDay = multiDay;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.text_first_half,
                          style: AppStyle.extra_large_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusSmall)),
                          value: this.firstHalf,
                          onChanged: (bool? firstHalf) {
                            setState(() {
                              this.firstHalf = firstHalf;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.text_last_half,
                          style: AppStyle.extra_large_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusSmall)),
                          value: this.lastHalf,
                          onChanged: (bool? lastHalf) {
                            setState(() {
                              this.lastHalf = lastHalf;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          customDoubleButton(
              context: context,
              textBtnText: 'Clear',
              textButtonAction: () {},
              elevatedBtnText: 'Apply',
              elevatedButtonAction: () {})
        ],
      ),
    );
  }
}
