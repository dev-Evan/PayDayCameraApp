import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'bottom_sheet_appbar.dart';

class filterView extends StatefulWidget {
  @override
  State<filterView> createState() => _filterViewState();
}

class _filterViewState extends State<filterView> {
  bool? approve = false;
  bool? pending = false;
  bool? rejection = false;
  bool? hours = false;
  bool? singleDay = false;
  bool? multiDay = false;
  bool? firstHalf = false;
  bool? lastHalf = false;

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
                AppString.text_leave_status,
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
                AppString.text_leave_duration,
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
            _doubleButton(
              context,
            ),

          ],
        ),
      ),
    );
  }
}

Widget _doubleButton(context) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      children: [
        Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 18,
            child: TextButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    primary: AppColor.backgroundColor,
                    elevation: 0,
                    side:
                        BorderSide(width: 1, color: AppColor.normalTextColor)),
                child: Text(
                  'Clear',
                  style: AppStyle.mid_large_text.copyWith(
                      color: AppColor.normalTextColor,
                      fontSize: Dimensions.fontSizeMid),
                )),
          ),
        ),
        SizedBox(
          width: AppLayout.getWidth(12),
        ),
        Flexible(child: CustomButton('Apply', () {})),
      ],
    ),
  );
}
