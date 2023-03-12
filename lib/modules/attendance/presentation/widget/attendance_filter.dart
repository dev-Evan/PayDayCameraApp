import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../../../common/custom_double_button.dart';
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
    return Container(
      child: SingleChildScrollView(
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
                AppString.text_entry_type,
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
                            AppString.text_single,
                            style: AppStyle.extra_large_text.copyWith(
                                color: AppColor.normalTextColor,
                                fontSize: Dimensions.fontSizeDefault),
                          ),
                          Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusSmall)),
                            value: this.single,
                            onChanged: (bool? single) {
                              setState(() {
                                this.single = single;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.text_multi,
                            style: AppStyle.extra_large_text.copyWith(
                                color: AppColor.normalTextColor,
                                fontSize: Dimensions.fontSizeDefault),
                          ),
                          Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusSmall)),
                            value: this.multi,
                            onChanged: (bool? multi) {
                              setState(() {
                                this.multi = multi;
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
                AppString.text_attendance_behavior,
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
                            AppString.text_enrly,
                            style: AppStyle.extra_large_text.copyWith(
                                color: AppColor.normalTextColor,
                                fontSize: Dimensions.fontSizeDefault),
                          ),
                          Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusSmall)),
                            value: this.early,
                            onChanged: (bool? early) {
                              setState(() {
                                this.early = early;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.text_regular,
                            style: AppStyle.extra_large_text.copyWith(
                                color: AppColor.normalTextColor,
                                fontSize: Dimensions.fontSizeDefault),
                          ),
                          Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusSmall)),
                            value: this.regular,
                            onChanged: (bool? regular) {
                              setState(() {
                                this.regular = regular;
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
      ),
    );
  }
}
