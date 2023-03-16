import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/custom_divider.dart';
import 'package:pay_day_mobile/common/custom_status_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/date_picker.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/selected_range_calender.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/filter_view.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import 'attendance_filter.dart';

class allLogsScreen extends StatefulWidget {
  const allLogsScreen({Key? key}) : super(key: key);

  @override
  State<allLogsScreen> createState() => _allLogsScreenState();
}

class _allLogsScreenState extends State<allLogsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
    children: [
      SizedBox(
        height: AppLayout.getHeight(12),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => customButtomSheet(
                    context: context,
                    Height: 0.9,
                    Child: const SelectRangeCalender()),
                child: Row(
                  children: [
                    Text(
                      AppString.textCustom,
                      style: AppStyle.mid_large_text.copyWith(
                          color: AppColor.secondaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(12),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColor.hintColor,
                    )
                  ],
                ),
              ),
              Text(
                '14 Dec 2022 - 30 Dec 2022',
                style: AppStyle.small_text_black
                    .copyWith(color: AppColor.hintColor),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () => customButtomSheet(
                              context: context,
                              Height: 0.9,
                              Child: const AttendanceFilter()),
                          child: const Icon(
                            Icons.filter_alt,
                            color: AppColor.hintColor,
                          )),
                      SizedBox(
                        width: AppLayout.getWidth(24),
                      ),
                      InkWell(
                        onTap: () => CustomAlertDialog(
                            context: context,
                            yesText: AppString.text_yes,
                            decIcon: Icons.sticky_note_2_outlined,
                            contentText: AppString.text_dialog_dec_pdf,
                            titleText: AppString.text_export_attendance,
                            icon: Icons.file_upload_outlined,
                            yesAction: () {},
                            iconColor: AppColor.primaryColor,
                            buttonColor: AppColor.primaryColor,
                            iconBgColor:
                                AppColor.primaryColor.withOpacity(0.1)),
                        child: const Icon(
                          Icons.file_upload_outlined,
                          color: AppColor.hintColor,
                        ),
                      )
                    ],
                  ),
                  const Positioned(
                      left: 28,
                      top: -1,
                      child: Icon(
                        Icons.circle,
                        size: 8,
                        color: AppColor.primaryColor,
                      ))
                ],
              ),
            ],
          ),
        ],
      ),
      SizedBox(
        height: AppLayout.getHeight(12),
      ),
      Expanded(child: logsList())
    ],
      ),
    );
  }
}

Widget logsList() {
  return ListView.builder(
    itemCount: 5,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Card(
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "10",
                        style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.normalTextColor,
                            fontSize: Dimensions.fontSizeExtraLarge,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "Dec",
                        style: AppStyle.small_text.copyWith(
                            color: AppColor.hintColor,
                            fontSize: Dimensions.fontSizeSmall),
                      ),
                    ],
                  ),
                  CustomDiveider(25, 1),
                  Column(
                    children: [
                      Text(
                        "11.00 am - 8.00 pm",
                        style: AppStyle.mid_large_text.copyWith(
                          color: AppColor.secondaryColor,
                          fontSize: Dimensions.fontSizeDefault + 2,
                        ),
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(6),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: AppColor.hintColor.withOpacity(0.6),
                            size: Dimensions.fontSizeDefault + 2,
                          ),
                          SizedBox(
                            width: AppLayout.getWidth(3),
                          ),
                          Text(
                            "9h",
                            style: AppStyle.mid_large_text.copyWith(
                                color: AppColor.hintColor.withOpacity(0.7),
                                fontSize: Dimensions.fontSizeDefault + 2,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: AppLayout.getWidth(12),
                          ),
                          Icon(
                            Icons.sticky_note_2_outlined,
                            color: AppColor.hintColor.withOpacity(0.6),
                            size: Dimensions.fontSizeDefault + 2,
                          ),
                          SizedBox(
                            width: AppLayout.getWidth(3),
                          ),
                          Text(
                            "0",
                            style: AppStyle.mid_large_text.copyWith(
                                color: AppColor.hintColor,
                                fontSize: Dimensions.fontSizeDefault + 2,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: AppLayout.getWidth(12),
                          ),
                          CustomStatusButton(
                            bgColor: AppColor.pendingBgColor.withOpacity(0.4),
                            text: AppString.text_pending,
                            textColor: AppColor.pendingTextColor,
                          )
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                      backgroundColor: AppColor.disableColor.withOpacity(0.2),
                      radius: 14,
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColor.primaryColor,
                        size: 16,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: CustomDiveider(
                  AppLayout.getHeight(0.6), MediaQuery.of(context).size.width),
            )
          ],
        ),
      );
    },
  );
}
