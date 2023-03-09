import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/custom_divider.dart';
import 'package:pay_day_mobile/common/custom_status_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/date_picaker.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/date_pickar.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/filter_view.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class allLogsScreen extends StatefulWidget {
  const allLogsScreen({Key? key}) : super(key: key);

  @override
  State<allLogsScreen> createState() => _allLogsScreenState();
}

class _allLogsScreenState extends State<allLogsScreen> {
  DateTimeRange? _selectedDateRange;

  // // This function will be triggered when the floating button is pressed
  //  _show() async {
  //   final DateTimeRange? result = await showDateRangePicker(
  //     context: context,
  //     firstDate: DateTime(2022, 1, 1),
  //     lastDate: DateTime(2030, 12, 31),
  //     currentDate: DateTime.now(),
  //     saveText: 'Done',
  //   );
  //
  //   if (result != null) {
  //     print(result.start.toString());
  //     setState(() {
  //       _selectedDateRange = result;
  //     });
  //   }
  // }
  // @override
  // void initState() {
  //   _show();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
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
                  Row(
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
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CustomCalender(),));
                        },
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColor.hintColor,
                        ),
                      )
                    ],
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
                                  context,
                                  0.9,
                                  Container(
                                    child: filterView()
                                  )

                              ),
                              child: const Icon(Icons.filter_alt,
                                  color: AppColor.hintColor)),
                          SizedBox(
                            width: AppLayout.getWidth(24),
                          ),
                          const Icon(
                            Icons.file_upload_outlined,
                            color: AppColor.hintColor,
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
    ));
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
                  customDiveider(25, 1),
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
              child: customDiveider(
                  AppLayout.getHeight(0.6), MediaQuery.of(context).size.width),
            )
          ],
        ),
      );
    },
  );
}


