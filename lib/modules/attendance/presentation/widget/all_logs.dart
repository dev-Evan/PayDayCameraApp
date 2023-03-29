import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/custom_divider.dart';
import 'package:pay_day_mobile/common/custom_status_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/date_picker.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/logs_list.dart';
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
          const Expanded(child: LogsList())
        ],
      ),
    );
  }
}


